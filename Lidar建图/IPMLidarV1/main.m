%������
clear; close all; clc;
cfig = figure(1);
%cfig = figure('Position', [10,10,1280,1080]);
% �����״�Ĵ���������
lidar = SetLidarParameters();
% ��ͼ����
borderSize      = 1;            % �߽�ߴ�
pixelSize       = 0.2;          % դ���ͼ��һ����Ԫ�ı߳� ��Ӧ ʵ�ʾ���pixelSize��(��������Ϊ0.2��)
miniUpdated     = false;        % 
miniUpdateDT    = 0.1;          % ��λm  ����������x�����y�����ƶ�����miniUpdateDT �����λ��
miniUpdateDR    = deg2rad(5);   % ��λrad ����������ת����miniUpdateDR �����λ�� 
% ��������˴����һ�μ�ɨ���ƶ���0.1�׻���ת��5�ȣ����ǽ����һ���µļ�ɨ�貢���µ�ͼ

% ɨ��ƥ�����
fastResolution  = [0.04; 0.04; deg2rad(2)]; % [m; m; rad]�ķֱ���
bruteResolution = [0.01; 0.01; deg2rad(0.1)]; % not used

% ��ȡIPM����
dir_ = 'ipmdata2/lidar/';
lidaname = dir(fullfile(dir_,'*.xyz'));
N = 100;%ɨ�����(���������ѭ������)

% ����һ����ȫ�ֵ�ͼ
map.points = [];%��ͼ�㼯
map.connections = [];
map.keyscans = [];%keyscans���浱ǰ��ȷλ�˵�ɨ������ ���Ԥ��õ�����һλ�˳��ִ��� �򷵻ص����������ǰһλ�����¼���
pose = [0; 0; 0];%��ʼλ��Ϊ(x=0,y=0,theta=0)
path = pose;%λ�˲��ù���·��


%�Ƿ񽫻��ƹ��̱������Ƶ
saveFrame=0;
if saveFrame==1
    % ��Ƶ�����ļ��������
    writerObj=VideoWriter('SLAMprocess.avi');  % ����һ����Ƶ�ļ������涯��  
    open(writerObj);                    % �򿪸���Ƶ�ļ�
end



% Here we go!!!!!!!!!!!!!!!!!!!!
for scanIdx = 2 : 1 : N
    disp(['scan ', num2str(scanIdx)]);
    
    % �õ���ǰ��ɨ�� [x1,y1; x2,y2; ...]
    %time = lidar_data.timestamps(scanIdx) * 1e-9;%ʱ�����ó�ÿ1e-9ɨ��һ��
    scan = ReadAScan([dir_,lidaname(scanIdx).name], scanIdx, lidar, 24);%�õ��ô�ɨ�����ݵľֲ��ѿ�������
    %scan = VoxelGrid_(scan);
    [speed,x,y,q] = ReadIMU(scanIdx);
    
    temp(scanIdx-1,:) =y;
    
    % ����ǵ�һ��ɨ�� ���ʼ��
    if scanIdx == 2
        map = Initialize(map, pose, scan);%��ɨ������scan���� ͨ��λ��pose ת��Ϊȫ�ֵ�ͼmap����
        miniUpdated = true;
        continue;
    end

    % 1. ������������һ��ִ���� mini���£����ǽ����� �ֲ��㼯ͼ �� �ֲ�դ���ͼ�����ԣ�
    % 1. If we executed a mini update in last step, we shall update the local points map and local grid map (coarse)
    if miniUpdated
        localMap = ExtractLocalMap(map.points, pose, scan, borderSize);%�õ���ǰɨ���ȫ������
        gridMap1 = OccuGrid(localMap, pixelSize);%�ӵ㼯localMap դ��Ԫ�ߴ��Ӧʵ�ʳ�����pixelSize ����ռ��դ���ͼ
        gridMap2 = OccuGrid(localMap, pixelSize/2);%�ӵ㼯localMap դ��Ԫ�ߴ��Ӧʵ�ʳ�����pixelSize/2 ����ռ��դ���ͼ
    end
    
    % 2. ʹ�ú㶨�ٶ��˶�ģ��Ԥ�⵱ǰλ��(����ǰһ״̬����״̬�Ĺ��� ��Ϊ��״̬����һ״̬�Ĺ��� �Ӷ��ɱ�״̬Ԥ����һ״̬)
    if scanIdx > 3
        pose_guess = pose + DiffPose(path(:,end-1), pose);%Ԥ����һλ��=��ǰλ��+(��ǰλ������һλ�˵Ĳ�) pose��һ��ȫ������
    else
        pose_guess = pose;
    end
    
   
    
    % 3. ����ƥ��
    if miniUpdated
        [pose, ~] = FastMatch(gridMap1, scan, pose_guess, fastResolution);%���ݵ�ǰդ���ͼ �Ż� Ԥ�����һλ��
    else
        [pose, ~] = FastMatch(gridMap2, scan, pose_guess, fastResolution);
    end
    
    % 4. ʹ�ýϸߵķֱ�����ϸ�� Ԥ����һλ��
    % gridMap = OccuGrid(localMap, pixelSize/2);
    [pose, hits] = FastMatch(gridMap2, scan, pose, fastResolution/2);%���ؽ�һ�����µ���һλ��pose
    
    % ����������ƶ���һ�����룬��ִ��mini����
    dp = abs(DiffPose(map.keyscans(end).pose, pose));%����λ�˵Ĳ�
    if dp(1)>miniUpdateDT || dp(2)>miniUpdateDT || dp(3)>miniUpdateDR
        miniUpdated = true;
        [map, pose] = AddAKeyScan(map, gridMap2, scan, pose, hits,...
                        pixelSize, bruteResolution, 0.1, deg2rad(3));
    else
        miniUpdated = false;
    end
    
    path = [path, pose]; %�ѵ�ǰλ��pose ����·��path     
    
    % ===== Loop Closing =========================================
    % if miniUpdated
    %     if TryLoopOrNot(map)
    %         map.keyscans(end).loopTried = true;
    %         map = DetectLoopClosure(map, scan, hits, 4, pi/6, pixelSize);
    %     end
    % end
    %----------------------------------------------------------------------
    
    % ��ͼ
    if mod(scanIdx, 30) == 0%ÿ30����һ��ͼ
        PlotMap(cfig, map, path, scan, scanIdx);
        %��ȡ��Ƶ֡���������Ƶ
        if saveFrame==1
            frame = getframe(cfig);
            writeVideo(writerObj, frame);
        end
    end
end
if saveFrame==1
    close(writerObj); %�ر���Ƶ�ļ���� 
end
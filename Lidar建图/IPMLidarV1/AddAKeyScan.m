

%��Ԥ����һλ�˵ĵ�ͼ��ӵ�ȫ�ֵ�ͼ��
%��������ж���һλ�˳����˴��󣬻ص��ľ����������ȷλ�ˣ������������
function [map, pose] = AddAKeyScan(map,...
                                   gridMap,...
                                   scan,... 
                                   pose,... 
                                   hits,...
                                   pixelSize,... 
                                   bruteResolution,... 
                                   tmax,...
                                   rmax)
%--------------------------------------------------------------------------
%����
%   mapΪȫ�ֵ�ͼ
%   gridMap
%   scanΪ��ǰɨ�����ݵľֲ��ѿ�������
%   poseΪ�Ż����Ԥ�����һλ��
%   hitsΪռ��դ���ͼ(һά��ʽ)
%   pixelSize
%   bruteResolution
%   tmax
%   rmax
%���
%   mapΪ�ڵ�ǰȫ�ֵ�ͼ������ �������һλ�˲������ݵĵ�ͼ
%   poseΪ ���Ԥ�����һ��λ�˳��ִ��� ���ص��ľ����������ȷλ�� �������������
%--------------------------------------------------------------------------
% ���ȣ�����pose��hits��ȷ��û�д�Ĵ���
% ������ִ�Ĵ����򷵻��޴��������һ����λ��
lastKeyPose = map.keyscans(end).pose;
dp = DiffPose(lastKeyPose, pose);%����һλ���뵱ǰλ�˳����˽ϴ�Ĳ�����ж���һλ���д�
if abs(dp(1)) > 0.5 || abs(dp(2)) > 0.5 || abs(dp(3)) > pi
    disp('Oh no no no nobody but you : So Large Error!');
    pose = lastKeyPose;
end

% ϸ�����λ��,����λ��Э����. �������Ƿ���map.connections�������ǹر�һ��ѭ��ʱ������ͼ�Ż�������Ҫ����
scan_w = Transform(scan, pose);%����ǰɨ������������һλ��ת��Ϊȫ������(���Ϊ���Ƶ���һλ�˵�ɨ������)
newPoints = scan_w(hits>1.1, :);%��Ԥ�����һλ�˵�ɨ�������У��͵�ǰդ���ͼ�ľ������1.1������ ɸѡ���� 
%
if isempty(newPoints)%��˼�� Ԥ�����һλ�˵�ɨ������ ��ȫ���ڵ�ǰλ�˹��ɵ�դ���ͼ��
    return;
end
% keyscans
k = length(map.keyscans);
map.keyscans(k+1).pose = pose;
map.keyscans(k+1).iBegin = size(map.points, 1) + 1;
map.keyscans(k+1).iEnd = size(map.points, 1) + size(newPoints, 1);
map.keyscans(k+1).loopTried = false;
map.keyscans(k+1).loopClosed = false;
%����һλ�˵�ɨ��������ӵ�ȫ�ֵ�ͼ��
map.points = [map.points; newPoints];
% connections
% ����������ƺ�Э��������ǹر�ѭ��ʱ���ǽ������õģ�����ͼ�Ż���
c = length(map.connections);
map.connections(c+1).keyIdPair = [k, k+1];
map.connections(c+1).relativePose = zeros(3,1);
map.connections(c+1).covariance = zeros(3);
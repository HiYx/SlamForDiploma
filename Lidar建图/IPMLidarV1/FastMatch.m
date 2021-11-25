

%���ݵ�ǰλ�˵�դ���ͼ �Ż�Ԥ�����һλ�� ʹ��һλ�˵�դ���ͼ�뵱ǰλ�˵�դ���ͼ�ﵽ�����غ϶�
%����ɨ��ƥ��(��ע������ܻ�����ֲ���Сֵ)
function [pose, bestHits] = FastMatch(gridmap, scan, pose, searchResolution)
%--------------------------------------------------------------------------
%����
%   gridmapΪ�ֲ�դ���ͼ
%   scanΪ����gridmap�ĵ�ǰɨ��㼯�ľֲ��ѿ�������
%   poseΪԤ�����һλ��(Ԥ��õ���pose_guess)
%   searchResolutionΪ�����ķֱ���(Ϊ��������Ԥ���ɨ��ƥ����� [0.05; 0.05; deg2rad(0.5)] ) 
%���
%   poseΪ�Ż������ Ԥ����һλ�� �Ż�Ŀ�꺯����ʹ��һλ�˵�դ���ͼ�뵱ǰλ�˵�դ���ͼ�ﵽ�����غ϶�
%   bestHits Ϊpose��Ӧ�� ����غ϶�score��Ӧ�� ��ǰλ��դ���ͼ��ԭʼ�������
%--------------------------------------------------------------------------

%�ֲ�դ���ͼ��Ϣ
% Grid map information
metricMap = gridmap.metricMap;%դ���ͼ��0Ԫ�����ڵ�λ�ÿ�������Ԫ��λ�õ����դ����빹�ɵľ���
ipixel = 1 / gridmap.pixelSize;%ʵ�ʾ���1m��Ӧ����դ��Ԫ�߳� (դ��Ԫ�ߴ��Ӧ��ʵ�ʾ���ĵ���)
minX   = gridmap.topLeftCorner(1);%դ���ͼ�е�����˵ĺ�����(ȫ��)
minY   = gridmap.topLeftCorner(2);%դ���ͼ�е����¶˵�������(ȫ��)
nCols  = size(metricMap, 2);
nRows  = size(metricMap, 1);

%������ռ��դ���㷨(��ɽ�㷨) ? 
% Go down the hill
maxIter = 50;%���ѭ������
maxDepth = 3;%��߷ֱ��ʵĴ��������ֵ
iter = 0;%ѭ������
depth = 0;%�ֱ�����ߴ���

pixelScan = scan * ipixel;%�� ɨ������ ʵ������ ת��Ϊ դ���ͼ�е�դ������
bestPose  = pose;
bestScore = Inf;
t = searchResolution(1);%x��y����������ֱ���
r = searchResolution(3);%theta�������ֱ���

while iter < maxIter
    noChange = true;
    % ��ת
    % Rotation
    for theta = pose(3) + [-r, 0, r]%�������������ת�� [��ת��-r ��ת�� ��ת��+r]
        
        ct = cos(theta);
        st = sin(theta);
        S  = pixelScan * [ct, st; -st, ct];%�� ɨ������(��λ:դ��) ��ʱ����תtheta �õ�S
        % ת��
        % Translation
        for tx = pose(1) + [-t, 0, t]%���������������� [Ԥ��λ�˺�����-t Ԥ��λ�˺����� Ԥ��λ�˺�����+t]
            Sx = round(S(:,1)+(tx-minX)*ipixel) + 1;%��դ��Ϊ��λ�ĺ����� (��һλ�˵�Ԥ�� ���� ��ǰλ�˵�ɨ������)
            for ty = pose(2) + [-t, 0, t]
                Sy = round(S(:,2)+(ty-minY)*ipixel) + 1;
                
                isIn = Sx>1 & Sy>1 & Sx<nCols & Sy<nRows;%ɸѡ�� ��һλ�˵õ���ɨ��դ�� ���� ��ǰɨ��õ���դ���� ������
                ix = Sx(isIn);%��ȡ����һλ��ɨ��դ�� ���ڵ�ǰդ���ͼ����Ĳ��� �ĺ�����(��λ:դ��)
                iy = Sy(isIn);%��ȡ����һλ��ɨ��դ�� ���ڵ�ǰդ���ͼ����Ĳ��� ��������(��λ:դ��)
                
                % metric socre
                idx = iy + (ix-1)*nRows;%����һλ��ɨ��դ��Ķ�ά����ת��Ϊһά����idx
                %metricMapΪ��ǰλ��դ���ͼ�� ��ռ�õ����ռ�õ�ľ������
                %score���Ϊ ��һλ��ɨ��դ���뵱ǰλ��ɨ��դ����غ϶�(scoreԼС ��ʾ�غ϶�Խ��)
                hits = metricMap(idx);
                score = sum(hits);
                
                % update 
                if score < bestScore %Ŀ�����ҵ���͵�score(��Ԥ��դ���뵱ǰդ��ﵽ����غ϶�)
                    noChange  = false;
                    bestPose  = [tx; ty; theta];%���������غ϶ȵ� Ԥ��λ�� ��Ϊ���Ԥ��λ��
                    bestScore = score;
                    bestHits  = hits;
                end
                
            end
        end
    end
    % �Ҳ������õ�ƥ�䣬��߷ֱ���
    if noChange
        r = r / 2;
        t = t / 2;
        depth = depth + 1;
        if depth > maxDepth %�ֱ�����ߴ������ܳ���maxDepth
            break;
        end
    end
    pose = bestPose;%���λ����ΪԤ�����һλ��
    iter = iter + 1;
end
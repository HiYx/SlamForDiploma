

%��ͼ(�㼯��ͼ��·������ǰλ�ˡ���ǰLiDARɨ����)
function PlotMap(cfig, map, path, scan, scanIdx)
%--------------------------------------------------------------------------
%����
%   cfigΪplot����λ��(������ʱ�̵�ͼ������һ��ͼ��)
%   mapΪȫ�ֵ�ͼ
%   pathΪ·��
%   scanΪ��ǰλ�õľֲ��ѿ�������
%   scanIdxΪ��ǰɨ������
%--------------------------------------------------------------------------
world   = map.points;%ȫ�ֵ�ͼ�㼯����world
scan = Transform(scan, path(:,end));%����ǰλ�õľֲ��ѿ������� ����·�� ת��Ϊȫ�ֵѿ�������

worldColor = [0 0 0];%��ͼ����ɫ(��ɫ)
scanColor = [148/255 0 211/255];%��ǰλ����ɫ(����ɫ)
pathColor = [0 0 1];%·����ɫ(��ɫ)
lidarColor=[205/255 38/255 38/255];%LiDARɨ������ɫ(ש��ɫ)
% Plot
cfig(1); clf; 
set(0,'defaultfigurecolor','w')
set(gca,'box','on')
set(gca, 'color', [1,1,1]);%���ñ�����ɫ(��ɫ)
hold on;  axis equal;
plot(world(:,1), world(:,2), '+', 'MarkerSize', 1, 'color', worldColor);%��ȫ�ֵ�ͼ�㼯
plot(scan(:,1),  scan(:,2),  '.', 'MarkerSize', 2, 'color', scanColor);%����ǰ��ɨ���ͼ
plot(path(1,:),  path(2,:),  '-.', 'LineWidth', 1, 'color', pathColor);%��·��
for i = 1:20:length(scan)
    line([path(1,end), scan(i,1)], [path(2,end), scan(i,2)], 'color', lidarColor);%������ǰλ�õ�LiDARɨ����
end
title(['Scan: ', num2str(scanIdx)]);%����
drawnow
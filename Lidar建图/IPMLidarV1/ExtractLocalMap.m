

% ��ȫ�ֵ�ͼ�� ��ȡ��ǰɨ����Χ�ľֲ���ͼ ��ȫ������
% Extract a local map around current scan
function localMap = ExtractLocalMap(points, pose, scan, borderSize)
%--------------------------------------------------------------------------
%����
%   pointsΪȫ�ֵ�ͼ�㼯
%   poseΪ��ǰλ��
%   scanΪ��ǰɨ�����ݵľֲ�����
%   borderSizeΪ
%--------------------------------------------------------------------------

% ����ǰɨ����������scan ת��Ϊȫ������scan_w
% Transform current scan into world frame
scan_w = Transform(scan, pose);
% ���� ���Ͻ� �� ���½�
% Set top-left & bottom-right corner
minX = min(scan_w(:,1) - borderSize);
minY = min(scan_w(:,2) - borderSize);
maxX = max(scan_w(:,1) + borderSize);
maxY = max(scan_w(:,2) + borderSize);
% ��ȡλ�ڷ�Χ�ڵ�ȫ�ֵ�ͼ�еĵ�
% Extract
isAround = points(:,1) > minX...
         & points(:,1) < maxX...
         & points(:,2) > minY...
         & points(:,2) < maxY;
%��ȫ�ֵ�ͼ����ȡ���ĵ�ǰɨ���
localMap = points(isAround, :);
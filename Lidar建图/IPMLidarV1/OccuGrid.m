
% �ӵ㼯����ռ��դ���ͼ
% Create an occupancy grid map from points
function gridmap = OccuGrid(pts, pixelSize)
%--------------------------------------------------------------------------
%����
%   ptsΪ��ǰɨ��õ��㼯��ȫ������   
%   pixelSize��ʾ դ���ͼһ����Ԫ�ı߳� ��Ӧ ʵ�ʾ���pixelSize��
%--------------------------------------------------------------------------
% ����ߴ�
% Grid size
minXY = min(pts) - 3 * pixelSize;%min(pts)����x����Сֵ��y����Сֵ���ɵ�����(�Ⲣ��һ���Ƕ�Ӧ���½�,��Ϊ����ͼ����û�����½�)
maxXY = max(pts) + 3 * pixelSize;% +3*pixelSize��˼�� ���ɵ�դ���ͼ�� ռ��դ����߽����ͼ�߽�����3��դ��Ԫ������
Sgrid = round((maxXY - minXY) / pixelSize) + 1;%Sgrid(1)Ϊx����դ������,Sgrid(2)Ϊy����դ������

N = size(pts, 1);%�㼯 ���� ��ĸ���
%hitsΪ��ռ�õ�դ��Ķ�ά���� (��hits(1)��,��hits(2)��)
hits = round( (pts-repmat(minXY, N, 1)) / pixelSize ) + 1;%�㼯��ÿ��������� ����ȥ���ǵ����½����� �ٳ�����դ��ߴ� ��ȡ�� ��+1
%������һ��ʹ�� �õ���դ���ͼ���ԭʼ��ͼ����һ����ת(���㼯�ﲻ�������½�ʱ����ַ�ת)
idx = (hits(:,1)-1)*Sgrid(2) + hits(:,2);%�ѱ�ռ�õ�դ��Ķ�ά����ת��Ϊһά����
%����һ���յ�դ���ͼ
grid  = false(Sgrid(2), Sgrid(1));
%����ռ�õ�դ���ֵΪ���߼�
grid(idx) = true;

gridmap.occGrid = grid;%դ���ͼ
gridmap.metricMap = min(bwdist(grid),10);%bwdist(grid)��ʾgrid��0Ԫ�����ڵ�λ�ÿ�������Ԫ��λ�õ���̾��빹�ɵľ���
gridmap.pixelSize = pixelSize;%դ��Ԫ�߳���Ӧ��ʵ�ʳ���
gridmap.topLeftCorner = minXY;%դ���ͼ��x��Сֵ��y��Сֵ���ɵ�������ȫ������


%��LiDARd��idx��ɨ�����ݴӼ�����ת��Ϊ�ѿ�������(�����С���ľֲ�����)
% Read a laser scan
function scan = ReadAScan(dir, idx, lidar, usableRange)
%--------------------------------------------------------------------------
% ����:
%lidar_dataΪ��ȡ��LiDARɨ��xyz���ݵĵ�ַ
%--------------------------------------------------------------------------
    lidar_data = load(dir);
    scan = [lidar_data(:,1), lidar_data(:,2)];  
end
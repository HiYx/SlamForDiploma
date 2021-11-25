

%将LiDARd第idx次扫描数据从极坐标转化为笛卡尔坐标(相对于小车的局部坐标)
% Read a laser scan
function scan = ReadAScan(dir, idx, lidar, usableRange)
%--------------------------------------------------------------------------
% 输入:
%lidar_data为读取的LiDAR扫描xyz数据的地址
%--------------------------------------------------------------------------
    lidar_data = load(dir);
    scan = [lidar_data(:,1), lidar_data(:,2)];  
end
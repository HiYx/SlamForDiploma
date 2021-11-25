function voxel = VoxelGrid_(scan)

size = length(scan);
% 生成一个存储空间存放滤波后的点值
voxel=[];

%以网格中第一个点对原点云进行下采样,这个效率太低了
% for q = 1:size
%     for i=1:80
%         temp =0;
%                 for j=1:80
%                     xv = [0.1*i-4 ; 0.1*i-3.9]; 
%                     yv = [0.1*j-4 ; 0.1*j-3.9];%实现了首尾相连的多边形。
%                     x = scan(q,1); 
%                     y = scan(q,2);
%                     if inpolygon(x,y,xv,yv)
%                         temp = 1;
%                         voxel = [voxel;0.1*i-4 ,0.1*j-4 ];
%                        break; 
%                     end
%                 end
%         if temp 
%            temp =0;
%            break;
%         end   
%                 
%     end
% end

% 直接做映射
for q = 1:size
    voxel = [voxel;0.02*round(scan(q,1)/0.02) ,0.02*round(scan(q,2)/0.02)];
end




end
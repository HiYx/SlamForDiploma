# 激光数据集合地址：
https://google-cartographer-ros.readthedocs.io/en/latest/data.html

## 将这个bag转包未mat的方式：

### 在ROS 解压bag 保存为mat
1、我下载了b2-2014-12-12-14-41-29.bag，文件大小为46MB;ps:下载后直接在matlab下用rosbag函数读取，会提示错误。在ROS 下解压
```
rosbag decompress b2-2014-12-12-14-41-29.bag
```
解压后文件大小为460M：


### 在matlab下对bag文件中的数据进行提取和保存。

matlab提供了ros相关的函数来提取数据，但是一次对所有的数据进行处理，会发生内存不足的问题。比如我用如下的代码读取bag文件：
```
bag = rosbag('b2-2014-12-12-14-41-29.bag');%读取所有数据
%读取水平雷达topic 数据
laser = select(bag, 'Time', ...
            [bag.StartTime bag.EndTime], 'Topic', '/horizontal_laser_2d');
x = readMessages(laser);
```
matlab报错(内存不足)：


## 因此，采用循环的方式逐一读取数据，代码如下：
花了10个小时，这个算法效率有点差.</br>

版本一：
```
clear;clc;
bag = rosbag('b2-2014-12-12-14-41-29.bag');%读取所有数据
%读取水平雷达topic 数据
 laser = select(bag, 'Time', ...
            [bag.StartTime bag.EndTime], 'Topic', '/horizontal_laser_2d');
        
%% 从文件中查找数据的大小 
N = laser.NumMessages;%雷达数据条数
x = readMessages(laser,1);
[M,~] = size(x{1,1}.Ranges);
times = zeros(N,1);%时间参数
ranges = zeros(N,M);%距离参数

%% 循环读取数据 ：整体读取时会出现内存不足的情况
for i=1:N
    temp = readMessages(laser,i);
    times(i) = temp{1,1}.Header.Stamp.Sec;%时间
    ranges_temp = temp{1,1}.Ranges;%雷达测量（1079维数据）
    for j = 1:M %不知道如何整体读取，所以加了循环
        laser_echo = ranges_temp(j,1).Echoes;
        [xx,yy] = size(laser_echo);
        if xx*yy<1 %当laser_echo为空时，跳出当前循环
            continue
        end
        ranges(i,j) = laser_echo(1);%雷达测量的距离数据
    end
    %显示进度
    if mod(i,100)==0
        disp(['处理进度%：', num2str(i/N*100)]);
    end
end
%数据保存为mat文件
save new_laser_data.mat times ranges
```

# 参考：
```
百度查东西真的很强人所男。还是建议去Google
https://blog.csdn.net/weixin_40712763/article/details/78909608
https://zhuanlan.zhihu.com/p/51577331
```
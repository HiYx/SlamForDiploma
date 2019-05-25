
概述：
===
SLAM (simultaneous localization and mapping),也称为CML (Concurrent Mapping and Localization), 即时定位与地图构建，或并发建图与定位。问题可以描述为：将一个机器人放入未知环境中的未知位置，是否有办法让机器人一边移动一边逐步描绘出此环境完全的地图，所谓完全的地图（a consistent map）是指不受障碍行进到房间可进入的每个角落。

准备
==
# 1、采用ros.iso 
直接安装后就会有相应环境。下载地址：
http://wiki.ros.org/turtlebot/Tutorials/indigo/Turtlebot%20Installation

# 2、配置python环境，
采用pyenv工具。（推荐使用本工具，方便管理多版本的python版本）

# 3、安装roboware studio。
可以用来方便写代码。

- 备注：安装roboware环境，需要：pip，以及pylint。不会报错的方法是。

- a、配置 ubuntu用户（非root）为python3.6 

- b、这个时候root用户是pyhon2.7  ，sudo执行也是python2.7，只有Ubuntu用户为python3.6

- c、在ubuntu用户下，安装pip3【运行 pip3 install --upgrade pip】，pylint【运行  sudo python -m pip install pylint 】

- d、按照roboware的Installation 说明书进行安装（root下，或者sudo），

- e、roboware studio运行在ubuntu用户下。
- f、希望你能明白我的意思。
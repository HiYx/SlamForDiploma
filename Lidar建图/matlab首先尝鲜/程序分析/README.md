#程序含义
程序分析：

程序完全是一个扫描匹配的过程，没有后端优化和回环检测，位姿的计算采用先估计（匀速运动模型）后优化的方式，在估计位姿附近用贪心算法进行优化，优化目标为局部图像和当前扫描数据的相似度。程序的主要运行过程如下：

#流程图

![image](https://github.com/HaliBotebie/SlamForDiploma/raw/master/readme_add_pic/1.jpg)

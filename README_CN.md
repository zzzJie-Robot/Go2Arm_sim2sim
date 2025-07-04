# Go2Arm_sim2sim
🚀欢迎使用 Go2Arm_sim2sim 平台，本项目旨在为足式操作机器人的强化学习算法提供一个高效便捷的仿真验证环境，助力您的研究与开发工作。

💡`sim2sim`代表`IsaacLab`平台迁移`Gazebo`平台，实物平台部署(`sim2real`)将在后续版本推出

- **基础平台**: Unitree Go2 四足机器人
- **操作器**: Interbotix WidowX 250s 机械臂

>**💻系统要求**  
>本项目基于`ros-noetic`构建，推荐运行在`Ubuntu20.04`操作系统上。

>**📢IsaacLab仿真**  
>若希望在 IsaacLab 中开展足式操作机器人的强化学习训练，可前往：
>[Go2Arm_Lab](https://github.com/zzzJie-Robot/Go2Arm_Lab)

| IsaacLab 仿真 | Gazebo 仿真 |
|--------------------|-------------------|
| ![IsaacLab](https://github.com/zzzJie-Robot/Go2Arm_Lab/raw/main/video/IsaacLab.gif) | ![Gazebo](https://github.com/zzzJie-Robot/Go2Arm_Lab/raw/main/video/Gazebo.gif) |

更多视频请访问我的[Bilibili 主页](https://space.bilibili.com/400627082?spm_id_from=333.1007.0.0).

# 快速上手指南📦
## 第一步：获取代码仓库
在终端中执行以下命令，将项目代码克隆至本地：  
```
git clone https://github.com/zzzJie-Robot/Go2Arm_sim2sim.git
```

## 第二步：安装依赖环境
**ROS 依赖包安装**
确保系统已安装以下 ROS 依赖包，可通过以下命令一次性安装完成：
```
sudo apt install ros-noetic-teleop-twist-keyboard ros-noetic-controller-interface ros-noetic-gazebo-ros-control ros-noetic-joint-state-controller ros-noetic-effort-controllers ros-noetic-joint-trajectory-controller ros-noetic-joy ros-noetic-ros-control ros-noetic-ros-controllers ros-noetic-controller-manager
```
**libtorch 库部署**

1.选择合适目录（如个人工作区）并进入：
```
cd <YOUR_DESIRED_PATH>
```
2.下载 libtorch 库：
```
wget https://download.pytorch.org/libtorch/cpu/libtorch-cxx11-abi-shared-with-deps-2.0.1%2Bcpu.zip
```
3.解压文件并设置环境变量：
```
unzip libtorch-cxx11-abi-shared-with-deps-2.0.1+cpu.zip -d ./
echo 'export Torch_DIR=<YOUR_DESIRED_PATH>/libtorch' >> ~/.bashrc
source ~/.bashrc
```

## 第三步：编译项目
进入项目根目录，执行编译命令：

```
cd /path/to/Go2Arm_sim2sim
catkin_make
```

## 第四步：运行示例程序
依次打开三个终端，按以下顺序执行对应命令：

**终端 1：环境初始化**
```
cd /path/to/Go2Arm_sim2sim
source ./devel/setup.bash
roslaunch go2arm_gazebo go2arm.launch
```

**终端 2：加载强化学习模型**
```
cd /path/to/Go2Arm_sim2sim
source ./devel/setup.bash
rosrun go2arm_gazebo main
```
**终端 3：启动键盘控制**
```
cd /path/to/Go2Arm_sim2sim
source ./devel/setup.bash
rosrun go2arm_gazebo keyboard_control
```

## 添加您的RL模型
若要使用您自定义的强化学习模型，只需将您的`.pt`模型文件重命名为`model.pt`，并替换项目中现有的同名文件即可完成集成，路径如下：
```
cd /path/to/Go2Arm_sim2sim/model
```

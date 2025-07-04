# Go2Arm_sim2sim
🚀 Welcome to the **Go2Arm_sim2sim** platform! This project aims to provide an efficient and convenient simulation environment for verifying reinforcement learning algorithms for **legged manipulators**, assisting your research and development efforts.

[中文文档](https://github.com/zzzJie-Robot/Go2Arm_sim2sim/blob/main/README_CN.md "中文文档")

💡 sim2sim represents the migration from the IsaacLab platform to the Gazebo platform. The deployment on physical platforms (sim2real) will be introduced in future versions.

- **Base platform**: Unitree Go2 quadruped
- **Manipulator**: Interbotix WidowX 250s robotic arm

>**💻 System Requirements**
>This project is built on `ros-noetic` and is recommended to be run on the `Ubuntu20.04` operating system.

>**📢 IsaacLab Simulation**
>If you would like to conduct reinforcement learning training for legged robotic manipulators in IsaacLab, please visit:
>[Go2Arm_Lab](https://github.com/zzzJie-Robot/Go2Arm_Lab)

| IsaacLab Simulation | Gazebo Simulation |
|--------------------|-------------------|
| ![IsaacLab](https://github.com/zzzJie-Robot/Go2Arm_Lab/raw/main/video/IsaacLab.gif) | ![Gazebo](https://github.com/zzzJie-Robot/Go2Arm_Lab/raw/main/video/Gazebo.gif) |

# Quick Start Guide 📦
## Step 1: Get the Code Repository
Clone the project code to your local machine by running the following command in the terminal:  
```
git clone https://github.com/zzzJie-Robot/Go2Arm_sim2sim.git
```

## Step 2: Install Dependencies
**ROS Dependency Installation**

Ensure that the following ROS dependencies are installed on your system. You can install them all at once with the following command:
```
sudo apt install ros-noetic-teleop-twist-keyboard ros-noetic-controller-interface ros-noetic-gazebo-ros-control ros-noetic-joint-state-controller ros-noetic-effort-controllers ros-noetic-joint-trajectory-controller ros-noetic-joy ros-noetic-ros-control ros-noetic-ros-controllers ros-noetic-controller-manager
```
**libtorch Library Deployment**

1.Choose a suitable directory (e.g., your workspace) and navigate to it:
```
cd <YOUR_DESIRED_PATH>
```
2.Download the libtorch library:：
```
wget https://download.pytorch.org/libtorch/cpu/libtorch-cxx11-abi-shared-with-deps-2.0.1%2Bcpu.zip
```
3.Unzip the file and set the environment variable:
```
unzip libtorch-cxx11-abi-shared-with-deps-2.0.1+cpu.zip -d ./
echo 'export Torch_DIR=<YOUR_DESIRED_PATH>/libtorch' >> ~/.bashrc
source ~/.bashrc
```

## Step 3: Compile the Project
Navigate to the project root directory and run the compilation command:

```
cd /path/to/Go2Arm_sim2sim
catkin_make
```

## Step 4: Run the Example Program
Open three terminals and execute the following commands in sequence:

**Terminal 1: Environment Initialization**
```
cd /path/to/Go2Arm_sim2sim
source ./devel/setup.bash
roslaunch go2arm_gazebo go2arm.launch
```
**Terminal 2: Load the Reinforcement Learning Model**
```
cd /path/to/Go2Arm_sim2sim
source ./devel/setup.bash
rosrun go2arm_gazebo main
```
**Terminal 3: Start Keyboard Control**
```
cd /path/to/Go2Arm_sim2sim
source ./devel/setup.bash
rosrun go2arm_gazebo keyboard_control
```

## Add Your RL Model
To use your custom reinforcement learning model, simply rename your `.pt` model file to `model.pt` and replace the existing file with the same name in the project. The path is as follows:
```
cd /path/to/Go2Arm_sim2sim/model
```

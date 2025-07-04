# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include".split(';') if "${prefix}/include" != "" else []
PROJECT_CATKIN_DEPENDS = "robot_msgs;controller_interface;hardware_interface;pluginlib;roscpp".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lrobot_joint_controller".split(';') if "-lrobot_joint_controller" != "" else []
PROJECT_NAME = "robot_joint_controller"
PROJECT_SPACE_DIR = "/home/legion/go2arm_sim2sim/install"
PROJECT_VERSION = "0.0.0"

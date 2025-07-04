// set_parameters_node.cpp
#include <ros/ros.h>

int main(int argc, char **argv)
{
    // 初始化ROS节点
    ros::init(argc, argv, "set_parameters_node");
    ros::NodeHandle nh;


    const std::vector<std::string> motor_names = {
        "FL_hip", "FL_calf", "FL_thigh",
        "FR_hip", "FR_calf", "FR_thigh",
        "RL_hip", "RL_calf", "RL_thigh",
        "RR_hip", "RR_calf", "RR_thigh",
        "waist", "shoulder", "elbow", 
        "forearm_roll", "wrist_angle", "wrist_rotate" ,
        "left_finger", "right_finger"
    };

    // actuators q
    const float L_hip_q = 0.1;
    const float R_hip_q = -0.1;
    const float F_thigh_q = 0.8;
    const float R_thigh_q = 1.0;
    const float calf_q = -1.5;
    const float waist_q = 0.0;
    const float shoulder_q = 0.0;
    const float elbow_q = 0.1;
    const float forearm_roll_q = 0.0;
    const float wrist_angle_q = 0.0;
    const float wrist_rotate_q = 0.0;
    const float left_finger_q = 0.025;
    const float right_finger_q = -0.025;

    // actuators kp
    const float leg_kp = 40.0;
    const float arm_kp = 50.0;

    // actuators kd
    const float leg_kd = 1.0;
    const float arm_kd = 1.0;


    nh.setParam("motor_names",motor_names);
    nh.setParam("L_hip_q", L_hip_q);
    nh.setParam("R_hip_q", R_hip_q);
    nh.setParam("F_thigh_q", F_thigh_q);
    nh.setParam("R_thigh_q", R_thigh_q);
    nh.setParam("calf_q", calf_q);
    nh.setParam("waist_q", waist_q);
    nh.setParam("shoulder_q", shoulder_q);
    nh.setParam("elbow_q", elbow_q);
    nh.setParam("forearm_roll_q", forearm_roll_q);
    nh.setParam("wrist_angle_q", wrist_angle_q);
    nh.setParam("wrist_rotate_q", wrist_rotate_q);
    nh.setParam("left_finger_q", left_finger_q);
    nh.setParam("right_finger_q", right_finger_q);
    nh.setParam("leg_kp", leg_kp);
    nh.setParam("arm_kp", arm_kp);
    nh.setParam("leg_kd", leg_kd);
    nh.setParam("arm_kd", arm_kd);
    ROS_INFO("Parameters have been set.");
    return 0;
}
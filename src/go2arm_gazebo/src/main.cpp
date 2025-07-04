// Copyright (c) 2025-2026 Junjie Zhu 
// SPDX-License-Identifier: Apache-2.0 

#include <torch/script.h> 
#include <ros/ros.h>
#include "geometry_msgs/WrenchStamped.h"
#include <boost/bind.hpp>
#include <map>
#include <string>
#include "sensor_msgs/Imu.h"
#include <cmath>
#include "gazebo_msgs/ModelStates.h"
#include <unordered_map>
#include "go2arm_gazebo/Command.h"
#include <control_msgs/JointControllerState.h>
#include <std_msgs/Float64.h>
#include <stdexcept>       
#include "robot_msgs/MotorCommand.h"
#include "robot_msgs/MotorState.h"
#include <ros/package.h>

std::map<std::string, ros::Subscriber> motor_subscribers;
std::map<std::string, ros::Publisher> motor_publishers;
const std::vector<std::string> motor_names = {"FR_hip", "FR_thigh", "FR_calf", 
                                              "FL_hip", "FL_thigh", "FL_calf", 
                                              "RR_hip", "RR_thigh", "RR_calf",
                                              "RL_hip", "RL_thigh", "RL_calf", 
                                              "waist", "shoulder", "elbow", 
                                              "forearm_roll", "wrist_angle", "wrist_rotate",
                                              "left_finger", "right_finger"};

torch::Tensor QuatRotateInverse(torch::Tensor q, torch::Tensor v)
{

    torch::Tensor q_w;
    torch::Tensor q_vec;
    q_w = q.index({torch::indexing::Slice(), 0});
    q_vec = q.index({torch::indexing::Slice(), torch::indexing::Slice(1, 4)});
    
    c10::IntArrayRef shape = q.sizes();

    torch::Tensor a = v * (2.0 * torch::pow(q_w, 2) - 1.0).unsqueeze(-1);
    torch::Tensor b = torch::cross(q_vec, v, -1) * q_w.unsqueeze(-1) * 2.0;
    torch::Tensor c = q_vec * torch::bmm(q_vec.view({shape[0], 1, 3}), v.view({shape[0], 3, 1})).squeeze(-1) * 2.0;
    return a - b + c;
}

torch::Tensor EulartoQuat(torch::Tensor euler) {
    // euler: [roll, pitch, yaw]
    double roll = euler[0].item<double>();
    double pitch = euler[1].item<double>();
    double yaw = euler[2].item<double>();

    double cy = cos(yaw * 0.5);
    double sy = sin(yaw * 0.5);
    double cp = cos(pitch * 0.5);
    double sp = sin(pitch * 0.5);
    double cr = cos(roll * 0.5);
    double sr = sin(roll * 0.5);

    torch::Tensor q = torch::zeros(4);
    q[0] = cr * cp * cy + sr * sp * sy; // w
    q[1] = sr * cp * cy - cr * sp * sy; // x
    q[2] = cr * sp * cy + sr * cp * sy; // y
    q[3] = cr * cp * sy - sr * sp * cy; // z

    return q.unsqueeze(0); 
}

struct Command
{
    std::mutex mtx;
    torch::Tensor x_vel = torch::zeros({1,1});
    torch::Tensor y_vel = torch::zeros({1,1});
    torch::Tensor yaw_vel = torch::zeros({1,1});;
   
    torch::Tensor x_pos = torch::ones({1,1}) * 0.4;
    torch::Tensor y_pos = torch::zeros({1,1});
    torch::Tensor z_pos = torch::ones({1,1}) * 0.4;
    torch::Tensor ee_roll = torch::zeros({1,1});
    torch::Tensor ee_pitch = torch::zeros({1,1});
    torch::Tensor ee_yaw = torch::zeros({1,1});

    torch::Tensor ee_w = torch::zeros({1,1});
    torch::Tensor ee_x = torch::zeros({1,1});
    torch::Tensor ee_y = torch::zeros({1,1});
    torch::Tensor ee_z = torch::zeros({1,1});

};

struct Observations
{
    std::mutex mtx;
    int history_length = 10;
    torch::Tensor base_ang_vel; //3
    torch::Tensor joint_pos; //18
    torch::Tensor joint_vel; //18
    torch::Tensor actions; //18
    torch::Tensor velocity_commands; //3
    torch::Tensor Go2_pose_command; //7
    torch::Tensor projected_gravity; //3

    torch::Tensor obs_onestep;
    torch::Tensor obs_history;

    
};

struct RobotCommand
{
    std::mutex mtx;
    torch::Tensor action_scale = torch::tensor(
        {{
            0.25, 0.25, 0.25,
            0.25, 0.25, 0.25,
            0.25, 0.25, 0.25,
            0.25, 0.25, 0.25,
            0.5, 0.5, 0.5,
            0.5, 0.5, 0.5
        }}
    );

    struct MotorCommand
    {
        torch::Tensor q = torch::zeros({1,20});
        torch::Tensor dq = torch::zeros({1,20});
        torch::Tensor tau = torch::zeros({1,20});
        torch::Tensor kp = torch::ones({1,20}) ;
        torch::Tensor kd = torch::ones({1,20}) ;
    } motor_command;

    torch::Tensor offset = torch::zeros({1,18});

};


struct RobotState
{
    std::mutex mtx;
    struct MotorState {
        std::unordered_map<std::string, int> name_to_idx = {
            {"FR_hip", 0}, {"FR_thigh", 1},  {"FR_calf", 2},
            {"FL_hip", 3}, {"FL_thigh", 4},  {"FL_calf", 5},
            {"RR_hip", 6}, {"RR_thigh", 7},  {"RR_calf", 8},
            {"RL_hip", 9}, {"RL_thigh", 10}, {"RL_calf", 11},
            {"waist", 12}, {"shoulder", 13}, {"elbow", 14}, 
            {"forearm_roll", 15}, {"wrist_angle", 16}, {"wrist_rotate", 17},
            {"left_finger", 18}, {"right_finger", 19}
        };
    } motor;
};



RobotState robot_state;
Observations observations;
RobotCommand robot_command;

void Ang_Vel_Callback(const sensor_msgs::Imu::ConstPtr& imu_msg)
{
    std::lock_guard<std::mutex> lock(observations.mtx);

    observations.base_ang_vel = torch::tensor({imu_msg->angular_velocity.x, imu_msg->angular_velocity.y, imu_msg->angular_velocity.z}).unsqueeze(0);
    observations.projected_gravity = QuatRotateInverse(
                                        torch::tensor({imu_msg->orientation.w, imu_msg->orientation.x, imu_msg->orientation.y, imu_msg->orientation.z}).unsqueeze(0), 
                                        torch::tensor({{0.0, 0.0, -1.0}}));
}

void MotorStateCallback(const robot_msgs::MotorState::ConstPtr& motor_msg, const std::string& motor_name)
{
    std::lock_guard<std::mutex> lock1(robot_state.mtx);
    std::lock_guard<std::mutex> lock2(observations.mtx);
    std::lock_guard<std::mutex> lock3(robot_command.mtx);

    if (motor_name == "left_finger" || motor_name == "right_finger") {
        return;
    }

    auto it = robot_state.motor.name_to_idx.find(motor_name);
    if (it == robot_state.motor.name_to_idx.end()) {
        ROS_WARN_STREAM("Unknown motor: " << motor_name);
        return;
    }
    int idx = it->second;
    observations.joint_pos[0][idx] = motor_msg->q - robot_command.offset[0][idx];
    observations.joint_vel[0][idx] = motor_msg->dq;
}

void CommandCallback(const go2arm_gazebo::Command::ConstPtr& command_msg)
{
    std::lock_guard<std::mutex> lock(observations.mtx);
    std::lock_guard<std::mutex> lock1(robot_command.mtx);

    torch::Tensor ee_pos = torch::tensor({command_msg->pos.x, command_msg->pos.y, command_msg->pos.z}).unsqueeze(0);
    torch::Tensor ee_ori = EulartoQuat(torch::tensor({command_msg->ori.roll, command_msg->ori.pitch, command_msg->ori.yaw}));
    observations.velocity_commands = torch::tensor({command_msg->velocity.x, command_msg->velocity.y, command_msg->velocity.z}).unsqueeze(0);  
    observations.Go2_pose_command = torch::cat({ee_pos, ee_ori}, 1);

    robot_command.motor_command.q[0][robot_state.motor.name_to_idx["left_finger"]] = command_msg->L_finger_pos;
    robot_command.motor_command.q[0][robot_state.motor.name_to_idx["right_finger"]] = command_msg->R_finger_pos;

}


class GO2ARM_RL
{
private:
    torch::jit::script::Module model;  
    std::string model_path;            

    void InitObservation()
    {
        std::lock_guard<std::mutex> lock(observations.mtx);

        // 初始化观测
        observations.base_ang_vel = torch::zeros({1,3});
        observations.joint_pos = torch::zeros({1,18});
        observations.joint_vel = torch::zeros({1,18});
        observations.actions = torch::zeros({1,18});
        observations.velocity_commands = torch::zeros({1,3});
        observations.Go2_pose_command = torch::tensor({{0.45, 0.0, 0.2, 1.0, 0.0, 0.0, 0.0}});
        observations.projected_gravity = torch::zeros({1,3});

        observations.obs_onestep = torch::zeros({1, 70});
        observations.obs_history = torch::zeros({1, 70 * observations.history_length});
    }

    void InitRobotCommand()
    {
        std::lock_guard<std::mutex> lock(robot_command.mtx);
        robot_command.motor_command.kp.slice(1, 0, 12) *= 40.0;
        robot_command.motor_command.kd.slice(1, 0, 12) *= 1.0;
        robot_command.motor_command.kp.slice(1, 12, 18) *= 10.0;
        robot_command.motor_command.kd.slice(1, 12, 18) *= 0.5;
        robot_command.motor_command.kp.slice(1, 18) *= 100.0;
        robot_command.motor_command.kd.slice(1, 18) *= 2.0;

        robot_command.offset = torch::tensor(
                                        {{-0.1, 0.8, -1.5, 
                                           0.1, 0.8, -1.5,
                                          -0.1, 1.0, -1.5, 
                                           0.1, 1.0, -1.5,  
                                           0.0, 0.0,  0.1, -0.0, -0.54, 0.0}}) ;
        robot_command.motor_command.q[0][18] = 0.025;
        robot_command.motor_command.q[0][19] = -0.025;
    }

    void InitModel()
    {
        model_path = ros::package::getPath("go2arm_gazebo") + "/model/policy.pt";
        try {
            model = torch::jit::load(model_path);
            ROS_INFO_STREAM("Model loaded successfully from: " << model_path);
        } catch (const c10::Error& e) {
            ROS_ERROR_STREAM("Error loading the model: " << e.what());
            throw std::runtime_error("Failed to load model");
        }
    }

public:
    GO2ARM_RL(int argc, char **argv)
    {
        InitModel();
        InitObservation();
        InitRobotCommand();
    }

    ~GO2ARM_RL(){}

    void Forward()
    {
        std::lock_guard<std::mutex> lock(observations.mtx);
        std::lock_guard<std::mutex> lock2(robot_command.mtx);
        torch::autograd::GradMode::set_enabled(false);
        torch::Tensor actions;
        std::vector<c10::IValue> inputs = {observations.obs_history};
        actions = model.forward(inputs).toTensor();

        observations.actions = actions ;
        robot_command.motor_command.q.slice(1, 0, 18) = actions * robot_command.action_scale + robot_command.offset;
    }

    void updateObservation()
    {
        std::lock_guard<std::mutex> lock(observations.mtx);

        observations.obs_onestep = torch::cat({ observations.base_ang_vel, 
                                                observations.joint_pos, 
                                                observations.joint_vel, 
                                                observations.actions, 
                                                observations.velocity_commands, 
                                                observations.Go2_pose_command, 
                                                observations.projected_gravity, 
                                                }, 1);

        observations.obs_history = torch::cat({
            observations.obs_onestep, 
            observations.obs_history.index({torch::indexing::Slice(), torch::indexing::Slice(0, 70 * (observations.history_length - 1))})  
        }, 1);
    }
};


int main(int argc, char **argv)
{
    ros::init(argc, argv, "go2_wx250s_main");
    ros::NodeHandle nh;
    GO2ARM_RL go2arm_rl(argc, argv);

    // Subscribers
    for (const auto& motor_name : motor_names) {
        std::string topic_name = "/go2_wx250s_gazebo/" + motor_name + "_controller/state";
        motor_subscribers[motor_name] = nh.subscribe<robot_msgs::MotorState>(
            topic_name, 10, boost::bind(MotorStateCallback, _1, motor_name));
    }

    ros::Subscriber sub_ori_vel = nh.subscribe<sensor_msgs::Imu>("/trunk_imu",10, Ang_Vel_Callback);
    ros::Subscriber sub_command = nh.subscribe<go2arm_gazebo::Command>("data_pub", 10 ,CommandCallback);

    // Publishers
    robot_msgs::MotorCommand motor_command;
    for (const auto& motor_name : motor_names) {
        std::string topic_name = "/go2_wx250s_gazebo/" + motor_name + "_controller/command";
        motor_publishers[motor_name] = nh.advertise<robot_msgs::MotorCommand>(topic_name, 10);
    }


    // Whlie loop
    ros::Rate rate(200);  
    while (ros::ok())
    {
        ros::spinOnce();
        {
            go2arm_rl.updateObservation();
            go2arm_rl.Forward();  

            for (const auto& motor_name : motor_names) {
                std::lock_guard<std::mutex> lock(robot_state.mtx);
                std::lock_guard<std::mutex> lock2(robot_command.mtx);
                auto it = robot_state.motor.name_to_idx.find(motor_name);
                if (it == robot_state.motor.name_to_idx.end()) {
                    ROS_WARN_STREAM("Unknown motor: " << motor_name);
                    continue;
                }
                int idx = it->second;     
                motor_command.q = robot_command.motor_command.q[0][idx].item<float>();
                motor_command.kp = robot_command.motor_command.kp[0][idx].item<float>();
                motor_command.kd = robot_command.motor_command.kd[0][idx].item<float>();
                motor_publishers[motor_name].publish(motor_command);
            }


        }
        rate.sleep();
    }
    return 0;
}
// Auto-generated. Do not edit!

// (in-package robot_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let IMU = require('./IMU.js');
let MotorState = require('./MotorState.js');

//-----------------------------------------------------------

class RobotState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.imu = null;
      this.motor_state = null;
    }
    else {
      if (initObj.hasOwnProperty('imu')) {
        this.imu = initObj.imu
      }
      else {
        this.imu = new IMU();
      }
      if (initObj.hasOwnProperty('motor_state')) {
        this.motor_state = initObj.motor_state
      }
      else {
        this.motor_state = new Array(32).fill(new MotorState());
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RobotState
    // Serialize message field [imu]
    bufferOffset = IMU.serialize(obj.imu, buffer, bufferOffset);
    // Check that the constant length array field [motor_state] has the right length
    if (obj.motor_state.length !== 32) {
      throw new Error('Unable to serialize array field motor_state - length must be 32')
    }
    // Serialize message field [motor_state]
    obj.motor_state.forEach((val) => {
      bufferOffset = MotorState.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RobotState
    let len;
    let data = new RobotState(null);
    // Deserialize message field [imu]
    data.imu = IMU.deserialize(buffer, bufferOffset);
    // Deserialize message field [motor_state]
    len = 32;
    data.motor_state = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.motor_state[i] = MotorState.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    return 60;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robot_msgs/RobotState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c7d5f0c74618348347456ca207fda81e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    IMU imu
    MotorState[32] motor_state
    ================================================================================
    MSG: robot_msgs/IMU
    float32[4] quaternion
    float32[3] gyroscope
    float32[3] accelerometer
    ================================================================================
    MSG: robot_msgs/MotorState
    float32 q            # motor current position (rad)
    float32 dq           # motor current speed (rad/s)
    float32 ddq          # motor current speed (rad/s)
    float32 tau_est      # current estimated output torque (N*m)
    float32 cur          # current estimated output cur (N*m)
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RobotState(null);
    if (msg.imu !== undefined) {
      resolved.imu = IMU.Resolve(msg.imu)
    }
    else {
      resolved.imu = new IMU()
    }

    if (msg.motor_state !== undefined) {
      resolved.motor_state = new Array(32)
      for (let i = 0; i < resolved.motor_state.length; ++i) {
        if (msg.motor_state.length > i) {
          resolved.motor_state[i] = MotorState.Resolve(msg.motor_state[i]);
        }
        else {
          resolved.motor_state[i] = new MotorState();
        }
      }
    }
    else {
      resolved.motor_state = new Array(32).fill(new MotorState())
    }

    return resolved;
    }
};

module.exports = RobotState;

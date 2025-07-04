// Auto-generated. Do not edit!

// (in-package robot_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let MotorCommand = require('./MotorCommand.js');

//-----------------------------------------------------------

class RobotCommand {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.motor_command = null;
    }
    else {
      if (initObj.hasOwnProperty('motor_command')) {
        this.motor_command = initObj.motor_command
      }
      else {
        this.motor_command = new Array(32).fill(new MotorCommand());
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RobotCommand
    // Check that the constant length array field [motor_command] has the right length
    if (obj.motor_command.length !== 32) {
      throw new Error('Unable to serialize array field motor_command - length must be 32')
    }
    // Serialize message field [motor_command]
    obj.motor_command.forEach((val) => {
      bufferOffset = MotorCommand.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RobotCommand
    let len;
    let data = new RobotCommand(null);
    // Deserialize message field [motor_command]
    len = 32;
    data.motor_command = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.motor_command[i] = MotorCommand.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    return 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robot_msgs/RobotCommand';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ef1354637f40ee9d0985c79aafa5f40f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    MotorCommand[32] motor_command
    ================================================================================
    MSG: robot_msgs/MotorCommand
    float32 q            # motor target position
    float32 dq           # motor target velocity
    float32 tau          # motor target torque
    float32 kp           # motor spring stiffness coefficient
    float32 kd           # motor damper coefficient
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RobotCommand(null);
    if (msg.motor_command !== undefined) {
      resolved.motor_command = new Array(32)
      for (let i = 0; i < resolved.motor_command.length; ++i) {
        if (msg.motor_command.length > i) {
          resolved.motor_command[i] = MotorCommand.Resolve(msg.motor_command[i]);
        }
        else {
          resolved.motor_command[i] = new MotorCommand();
        }
      }
    }
    else {
      resolved.motor_command = new Array(32).fill(new MotorCommand())
    }

    return resolved;
    }
};

module.exports = RobotCommand;

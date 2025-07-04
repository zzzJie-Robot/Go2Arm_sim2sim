// Auto-generated. Do not edit!

// (in-package robot_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class MotorState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.q = null;
      this.dq = null;
      this.ddq = null;
      this.tau_est = null;
      this.cur = null;
    }
    else {
      if (initObj.hasOwnProperty('q')) {
        this.q = initObj.q
      }
      else {
        this.q = 0.0;
      }
      if (initObj.hasOwnProperty('dq')) {
        this.dq = initObj.dq
      }
      else {
        this.dq = 0.0;
      }
      if (initObj.hasOwnProperty('ddq')) {
        this.ddq = initObj.ddq
      }
      else {
        this.ddq = 0.0;
      }
      if (initObj.hasOwnProperty('tau_est')) {
        this.tau_est = initObj.tau_est
      }
      else {
        this.tau_est = 0.0;
      }
      if (initObj.hasOwnProperty('cur')) {
        this.cur = initObj.cur
      }
      else {
        this.cur = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MotorState
    // Serialize message field [q]
    bufferOffset = _serializer.float32(obj.q, buffer, bufferOffset);
    // Serialize message field [dq]
    bufferOffset = _serializer.float32(obj.dq, buffer, bufferOffset);
    // Serialize message field [ddq]
    bufferOffset = _serializer.float32(obj.ddq, buffer, bufferOffset);
    // Serialize message field [tau_est]
    bufferOffset = _serializer.float32(obj.tau_est, buffer, bufferOffset);
    // Serialize message field [cur]
    bufferOffset = _serializer.float32(obj.cur, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MotorState
    let len;
    let data = new MotorState(null);
    // Deserialize message field [q]
    data.q = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [dq]
    data.dq = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [ddq]
    data.ddq = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [tau_est]
    data.tau_est = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [cur]
    data.cur = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robot_msgs/MotorState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'bf3a599ff7d0c7528dc0b4a11694b234';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new MotorState(null);
    if (msg.q !== undefined) {
      resolved.q = msg.q;
    }
    else {
      resolved.q = 0.0
    }

    if (msg.dq !== undefined) {
      resolved.dq = msg.dq;
    }
    else {
      resolved.dq = 0.0
    }

    if (msg.ddq !== undefined) {
      resolved.ddq = msg.ddq;
    }
    else {
      resolved.ddq = 0.0
    }

    if (msg.tau_est !== undefined) {
      resolved.tau_est = msg.tau_est;
    }
    else {
      resolved.tau_est = 0.0
    }

    if (msg.cur !== undefined) {
      resolved.cur = msg.cur;
    }
    else {
      resolved.cur = 0.0
    }

    return resolved;
    }
};

module.exports = MotorState;

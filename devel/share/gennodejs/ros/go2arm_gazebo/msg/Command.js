// Auto-generated. Do not edit!

// (in-package go2arm_gazebo.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Vector3 = require('./Vector3.js');
let Orientation = require('./Orientation.js');

//-----------------------------------------------------------

class Command {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.velocity = null;
      this.pos = null;
      this.ori = null;
      this.L_finger_pos = null;
      this.R_finger_pos = null;
    }
    else {
      if (initObj.hasOwnProperty('velocity')) {
        this.velocity = initObj.velocity
      }
      else {
        this.velocity = new Vector3();
      }
      if (initObj.hasOwnProperty('pos')) {
        this.pos = initObj.pos
      }
      else {
        this.pos = new Vector3();
      }
      if (initObj.hasOwnProperty('ori')) {
        this.ori = initObj.ori
      }
      else {
        this.ori = new Orientation();
      }
      if (initObj.hasOwnProperty('L_finger_pos')) {
        this.L_finger_pos = initObj.L_finger_pos
      }
      else {
        this.L_finger_pos = 0.0;
      }
      if (initObj.hasOwnProperty('R_finger_pos')) {
        this.R_finger_pos = initObj.R_finger_pos
      }
      else {
        this.R_finger_pos = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Command
    // Serialize message field [velocity]
    bufferOffset = Vector3.serialize(obj.velocity, buffer, bufferOffset);
    // Serialize message field [pos]
    bufferOffset = Vector3.serialize(obj.pos, buffer, bufferOffset);
    // Serialize message field [ori]
    bufferOffset = Orientation.serialize(obj.ori, buffer, bufferOffset);
    // Serialize message field [L_finger_pos]
    bufferOffset = _serializer.float64(obj.L_finger_pos, buffer, bufferOffset);
    // Serialize message field [R_finger_pos]
    bufferOffset = _serializer.float64(obj.R_finger_pos, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Command
    let len;
    let data = new Command(null);
    // Deserialize message field [velocity]
    data.velocity = Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [pos]
    data.pos = Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [ori]
    data.ori = Orientation.deserialize(buffer, bufferOffset);
    // Deserialize message field [L_finger_pos]
    data.L_finger_pos = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [R_finger_pos]
    data.R_finger_pos = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 52;
  }

  static datatype() {
    // Returns string type for a message object
    return 'go2arm_gazebo/Command';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7ab687a3009a5ba42ab64b770a245c5d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Command.msg
    Vector3 velocity
    Vector3 pos
    Orientation ori
    float64 L_finger_pos
    float64 R_finger_pos
    ================================================================================
    MSG: go2arm_gazebo/Vector3
    # Vector3.msg
    float32 x
    float32 y
    float32 z
    ================================================================================
    MSG: go2arm_gazebo/Orientation
    # Orientation.msg
    float32 roll
    float32 pitch
    float32 yaw
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Command(null);
    if (msg.velocity !== undefined) {
      resolved.velocity = Vector3.Resolve(msg.velocity)
    }
    else {
      resolved.velocity = new Vector3()
    }

    if (msg.pos !== undefined) {
      resolved.pos = Vector3.Resolve(msg.pos)
    }
    else {
      resolved.pos = new Vector3()
    }

    if (msg.ori !== undefined) {
      resolved.ori = Orientation.Resolve(msg.ori)
    }
    else {
      resolved.ori = new Orientation()
    }

    if (msg.L_finger_pos !== undefined) {
      resolved.L_finger_pos = msg.L_finger_pos;
    }
    else {
      resolved.L_finger_pos = 0.0
    }

    if (msg.R_finger_pos !== undefined) {
      resolved.R_finger_pos = msg.R_finger_pos;
    }
    else {
      resolved.R_finger_pos = 0.0
    }

    return resolved;
    }
};

module.exports = Command;

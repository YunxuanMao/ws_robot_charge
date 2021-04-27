// Auto-generated. Do not edit!

// (in-package path_collision_check.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class IsTraValRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.file_name = null;
    }
    else {
      if (initObj.hasOwnProperty('file_name')) {
        this.file_name = initObj.file_name
      }
      else {
        this.file_name = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type IsTraValRequest
    // Serialize message field [file_name]
    bufferOffset = _serializer.string(obj.file_name, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type IsTraValRequest
    let len;
    let data = new IsTraValRequest(null);
    // Deserialize message field [file_name]
    data.file_name = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.file_name.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'path_collision_check/IsTraValRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2415261c9605b9f38867ffbbe495fc04';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string file_name
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new IsTraValRequest(null);
    if (msg.file_name !== undefined) {
      resolved.file_name = msg.file_name;
    }
    else {
      resolved.file_name = ''
    }

    return resolved;
    }
};

class IsTraValResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.IsVal = null;
    }
    else {
      if (initObj.hasOwnProperty('IsVal')) {
        this.IsVal = initObj.IsVal
      }
      else {
        this.IsVal = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type IsTraValResponse
    // Serialize message field [IsVal]
    bufferOffset = _serializer.bool(obj.IsVal, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type IsTraValResponse
    let len;
    let data = new IsTraValResponse(null);
    // Deserialize message field [IsVal]
    data.IsVal = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'path_collision_check/IsTraValResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '969c9f71a064c9fd7b7dd8d05e9cc517';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool IsVal
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new IsTraValResponse(null);
    if (msg.IsVal !== undefined) {
      resolved.IsVal = msg.IsVal;
    }
    else {
      resolved.IsVal = false
    }

    return resolved;
    }
};

module.exports = {
  Request: IsTraValRequest,
  Response: IsTraValResponse,
  md5sum() { return '33c97e92ddfb5fd9eeda43da1e556307'; },
  datatype() { return 'path_collision_check/IsTraVal'; }
};

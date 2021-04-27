; Auto-generated. Do not edit!


(cl:in-package path_collision_check-srv)


;//! \htmlinclude IsTraVal-request.msg.html

(cl:defclass <IsTraVal-request> (roslisp-msg-protocol:ros-message)
  ((file_name
    :reader file_name
    :initarg :file_name
    :type cl:string
    :initform ""))
)

(cl:defclass IsTraVal-request (<IsTraVal-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <IsTraVal-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'IsTraVal-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name path_collision_check-srv:<IsTraVal-request> is deprecated: use path_collision_check-srv:IsTraVal-request instead.")))

(cl:ensure-generic-function 'file_name-val :lambda-list '(m))
(cl:defmethod file_name-val ((m <IsTraVal-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_collision_check-srv:file_name-val is deprecated.  Use path_collision_check-srv:file_name instead.")
  (file_name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <IsTraVal-request>) ostream)
  "Serializes a message object of type '<IsTraVal-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'file_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'file_name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <IsTraVal-request>) istream)
  "Deserializes a message object of type '<IsTraVal-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'file_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'file_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<IsTraVal-request>)))
  "Returns string type for a service object of type '<IsTraVal-request>"
  "path_collision_check/IsTraValRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'IsTraVal-request)))
  "Returns string type for a service object of type 'IsTraVal-request"
  "path_collision_check/IsTraValRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<IsTraVal-request>)))
  "Returns md5sum for a message object of type '<IsTraVal-request>"
  "33c97e92ddfb5fd9eeda43da1e556307")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'IsTraVal-request)))
  "Returns md5sum for a message object of type 'IsTraVal-request"
  "33c97e92ddfb5fd9eeda43da1e556307")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<IsTraVal-request>)))
  "Returns full string definition for message of type '<IsTraVal-request>"
  (cl:format cl:nil "string file_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'IsTraVal-request)))
  "Returns full string definition for message of type 'IsTraVal-request"
  (cl:format cl:nil "string file_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <IsTraVal-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'file_name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <IsTraVal-request>))
  "Converts a ROS message object to a list"
  (cl:list 'IsTraVal-request
    (cl:cons ':file_name (file_name msg))
))
;//! \htmlinclude IsTraVal-response.msg.html

(cl:defclass <IsTraVal-response> (roslisp-msg-protocol:ros-message)
  ((IsVal
    :reader IsVal
    :initarg :IsVal
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass IsTraVal-response (<IsTraVal-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <IsTraVal-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'IsTraVal-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name path_collision_check-srv:<IsTraVal-response> is deprecated: use path_collision_check-srv:IsTraVal-response instead.")))

(cl:ensure-generic-function 'IsVal-val :lambda-list '(m))
(cl:defmethod IsVal-val ((m <IsTraVal-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_collision_check-srv:IsVal-val is deprecated.  Use path_collision_check-srv:IsVal instead.")
  (IsVal m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <IsTraVal-response>) ostream)
  "Serializes a message object of type '<IsTraVal-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'IsVal) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <IsTraVal-response>) istream)
  "Deserializes a message object of type '<IsTraVal-response>"
    (cl:setf (cl:slot-value msg 'IsVal) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<IsTraVal-response>)))
  "Returns string type for a service object of type '<IsTraVal-response>"
  "path_collision_check/IsTraValResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'IsTraVal-response)))
  "Returns string type for a service object of type 'IsTraVal-response"
  "path_collision_check/IsTraValResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<IsTraVal-response>)))
  "Returns md5sum for a message object of type '<IsTraVal-response>"
  "33c97e92ddfb5fd9eeda43da1e556307")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'IsTraVal-response)))
  "Returns md5sum for a message object of type 'IsTraVal-response"
  "33c97e92ddfb5fd9eeda43da1e556307")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<IsTraVal-response>)))
  "Returns full string definition for message of type '<IsTraVal-response>"
  (cl:format cl:nil "bool IsVal~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'IsTraVal-response)))
  "Returns full string definition for message of type 'IsTraVal-response"
  (cl:format cl:nil "bool IsVal~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <IsTraVal-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <IsTraVal-response>))
  "Converts a ROS message object to a list"
  (cl:list 'IsTraVal-response
    (cl:cons ':IsVal (IsVal msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'IsTraVal)))
  'IsTraVal-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'IsTraVal)))
  'IsTraVal-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'IsTraVal)))
  "Returns string type for a service object of type '<IsTraVal>"
  "path_collision_check/IsTraVal")
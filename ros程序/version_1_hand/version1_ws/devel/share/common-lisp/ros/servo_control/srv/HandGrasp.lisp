; Auto-generated. Do not edit!


(cl:in-package servo_control-srv)


;//! \htmlinclude HandGrasp-request.msg.html

(cl:defclass <HandGrasp-request> (roslisp-msg-protocol:ros-message)
  ((command
    :reader command
    :initarg :command
    :type cl:string
    :initform ""))
)

(cl:defclass HandGrasp-request (<HandGrasp-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <HandGrasp-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'HandGrasp-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name servo_control-srv:<HandGrasp-request> is deprecated: use servo_control-srv:HandGrasp-request instead.")))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <HandGrasp-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader servo_control-srv:command-val is deprecated.  Use servo_control-srv:command instead.")
  (command m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <HandGrasp-request>) ostream)
  "Serializes a message object of type '<HandGrasp-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'command))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'command))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <HandGrasp-request>) istream)
  "Deserializes a message object of type '<HandGrasp-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'command) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'command) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<HandGrasp-request>)))
  "Returns string type for a service object of type '<HandGrasp-request>"
  "servo_control/HandGraspRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'HandGrasp-request)))
  "Returns string type for a service object of type 'HandGrasp-request"
  "servo_control/HandGraspRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<HandGrasp-request>)))
  "Returns md5sum for a message object of type '<HandGrasp-request>"
  "cf5c0ef86653d32d0c3b79408c84d0f3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'HandGrasp-request)))
  "Returns md5sum for a message object of type 'HandGrasp-request"
  "cf5c0ef86653d32d0c3b79408c84d0f3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<HandGrasp-request>)))
  "Returns full string definition for message of type '<HandGrasp-request>"
  (cl:format cl:nil "string command~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'HandGrasp-request)))
  "Returns full string definition for message of type 'HandGrasp-request"
  (cl:format cl:nil "string command~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <HandGrasp-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'command))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <HandGrasp-request>))
  "Converts a ROS message object to a list"
  (cl:list 'HandGrasp-request
    (cl:cons ':command (command msg))
))
;//! \htmlinclude HandGrasp-response.msg.html

(cl:defclass <HandGrasp-response> (roslisp-msg-protocol:ros-message)
  ((value
    :reader value
    :initarg :value
    :type cl:fixnum
    :initform 0))
)

(cl:defclass HandGrasp-response (<HandGrasp-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <HandGrasp-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'HandGrasp-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name servo_control-srv:<HandGrasp-response> is deprecated: use servo_control-srv:HandGrasp-response instead.")))

(cl:ensure-generic-function 'value-val :lambda-list '(m))
(cl:defmethod value-val ((m <HandGrasp-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader servo_control-srv:value-val is deprecated.  Use servo_control-srv:value instead.")
  (value m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <HandGrasp-response>) ostream)
  "Serializes a message object of type '<HandGrasp-response>"
  (cl:let* ((signed (cl:slot-value msg 'value)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <HandGrasp-response>) istream)
  "Deserializes a message object of type '<HandGrasp-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'value) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<HandGrasp-response>)))
  "Returns string type for a service object of type '<HandGrasp-response>"
  "servo_control/HandGraspResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'HandGrasp-response)))
  "Returns string type for a service object of type 'HandGrasp-response"
  "servo_control/HandGraspResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<HandGrasp-response>)))
  "Returns md5sum for a message object of type '<HandGrasp-response>"
  "cf5c0ef86653d32d0c3b79408c84d0f3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'HandGrasp-response)))
  "Returns md5sum for a message object of type 'HandGrasp-response"
  "cf5c0ef86653d32d0c3b79408c84d0f3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<HandGrasp-response>)))
  "Returns full string definition for message of type '<HandGrasp-response>"
  (cl:format cl:nil "int16 value~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'HandGrasp-response)))
  "Returns full string definition for message of type 'HandGrasp-response"
  (cl:format cl:nil "int16 value~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <HandGrasp-response>))
  (cl:+ 0
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <HandGrasp-response>))
  "Converts a ROS message object to a list"
  (cl:list 'HandGrasp-response
    (cl:cons ':value (value msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'HandGrasp)))
  'HandGrasp-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'HandGrasp)))
  'HandGrasp-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'HandGrasp)))
  "Returns string type for a service object of type '<HandGrasp>"
  "servo_control/HandGrasp")
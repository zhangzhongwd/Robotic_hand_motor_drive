; Auto-generated. Do not edit!


(cl:in-package servo_control-msg)


;//! \htmlinclude WritePos.msg.html

(cl:defclass <WritePos> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:fixnum
    :initform 0)
   (pos
    :reader pos
    :initarg :pos
    :type cl:fixnum
    :initform 0)
   (exe_time
    :reader exe_time
    :initarg :exe_time
    :type cl:integer
    :initform 0))
)

(cl:defclass WritePos (<WritePos>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <WritePos>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'WritePos)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name servo_control-msg:<WritePos> is deprecated: use servo_control-msg:WritePos instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <WritePos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader servo_control-msg:id-val is deprecated.  Use servo_control-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'pos-val :lambda-list '(m))
(cl:defmethod pos-val ((m <WritePos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader servo_control-msg:pos-val is deprecated.  Use servo_control-msg:pos instead.")
  (pos m))

(cl:ensure-generic-function 'exe_time-val :lambda-list '(m))
(cl:defmethod exe_time-val ((m <WritePos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader servo_control-msg:exe_time-val is deprecated.  Use servo_control-msg:exe_time instead.")
  (exe_time m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <WritePos>) ostream)
  "Serializes a message object of type '<WritePos>"
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'pos)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'exe_time)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <WritePos>) istream)
  "Deserializes a message object of type '<WritePos>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'pos) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'exe_time) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<WritePos>)))
  "Returns string type for a message object of type '<WritePos>"
  "servo_control/WritePos")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'WritePos)))
  "Returns string type for a message object of type 'WritePos"
  "servo_control/WritePos")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<WritePos>)))
  "Returns md5sum for a message object of type '<WritePos>"
  "5344dbb4eb0d3ece2f045928ac961746")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'WritePos)))
  "Returns md5sum for a message object of type 'WritePos"
  "5344dbb4eb0d3ece2f045928ac961746")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<WritePos>)))
  "Returns full string definition for message of type '<WritePos>"
  (cl:format cl:nil "int16 id~%int16 pos~%int32 exe_time~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'WritePos)))
  "Returns full string definition for message of type 'WritePos"
  (cl:format cl:nil "int16 id~%int16 pos~%int32 exe_time~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <WritePos>))
  (cl:+ 0
     2
     2
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <WritePos>))
  "Converts a ROS message object to a list"
  (cl:list 'WritePos
    (cl:cons ':id (id msg))
    (cl:cons ':pos (pos msg))
    (cl:cons ':exe_time (exe_time msg))
))

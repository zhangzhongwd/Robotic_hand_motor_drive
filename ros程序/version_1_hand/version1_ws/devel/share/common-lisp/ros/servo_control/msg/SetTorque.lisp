; Auto-generated. Do not edit!


(cl:in-package servo_control-msg)


;//! \htmlinclude SetTorque.msg.html

(cl:defclass <SetTorque> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:fixnum
    :initform 0)
   (ptorque
    :reader ptorque
    :initarg :ptorque
    :type cl:fixnum
    :initform 0)
   (ptime
    :reader ptime
    :initarg :ptime
    :type cl:fixnum
    :initform 0)
   (otorque
    :reader otorque
    :initarg :otorque
    :type cl:fixnum
    :initform 0))
)

(cl:defclass SetTorque (<SetTorque>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetTorque>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetTorque)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name servo_control-msg:<SetTorque> is deprecated: use servo_control-msg:SetTorque instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <SetTorque>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader servo_control-msg:id-val is deprecated.  Use servo_control-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'ptorque-val :lambda-list '(m))
(cl:defmethod ptorque-val ((m <SetTorque>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader servo_control-msg:ptorque-val is deprecated.  Use servo_control-msg:ptorque instead.")
  (ptorque m))

(cl:ensure-generic-function 'ptime-val :lambda-list '(m))
(cl:defmethod ptime-val ((m <SetTorque>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader servo_control-msg:ptime-val is deprecated.  Use servo_control-msg:ptime instead.")
  (ptime m))

(cl:ensure-generic-function 'otorque-val :lambda-list '(m))
(cl:defmethod otorque-val ((m <SetTorque>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader servo_control-msg:otorque-val is deprecated.  Use servo_control-msg:otorque instead.")
  (otorque m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetTorque>) ostream)
  "Serializes a message object of type '<SetTorque>"
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'ptorque)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'ptime)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'otorque)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetTorque>) istream)
  "Deserializes a message object of type '<SetTorque>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ptorque) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ptime) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'otorque) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetTorque>)))
  "Returns string type for a message object of type '<SetTorque>"
  "servo_control/SetTorque")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetTorque)))
  "Returns string type for a message object of type 'SetTorque"
  "servo_control/SetTorque")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetTorque>)))
  "Returns md5sum for a message object of type '<SetTorque>"
  "323a0bff3fb4a0ad827682d128ae9b5c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetTorque)))
  "Returns md5sum for a message object of type 'SetTorque"
  "323a0bff3fb4a0ad827682d128ae9b5c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetTorque>)))
  "Returns full string definition for message of type '<SetTorque>"
  (cl:format cl:nil "int16 id~%int16 ptorque~%int16 ptime~%int16 otorque~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetTorque)))
  "Returns full string definition for message of type 'SetTorque"
  (cl:format cl:nil "int16 id~%int16 ptorque~%int16 ptime~%int16 otorque~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetTorque>))
  (cl:+ 0
     2
     2
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetTorque>))
  "Converts a ROS message object to a list"
  (cl:list 'SetTorque
    (cl:cons ':id (id msg))
    (cl:cons ':ptorque (ptorque msg))
    (cl:cons ':ptime (ptime msg))
    (cl:cons ':otorque (otorque msg))
))

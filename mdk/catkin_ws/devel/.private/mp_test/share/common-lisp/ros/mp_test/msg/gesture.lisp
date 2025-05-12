; Auto-generated. Do not edit!


(cl:in-package mp_test-msg)


;//! \htmlinclude gesture.msg.html

(cl:defclass <gesture> (roslisp-msg-protocol:ros-message)
  ((gesture
    :reader gesture
    :initarg :gesture
    :type cl:string
    :initform ""))
)

(cl:defclass gesture (<gesture>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <gesture>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'gesture)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mp_test-msg:<gesture> is deprecated: use mp_test-msg:gesture instead.")))

(cl:ensure-generic-function 'gesture-val :lambda-list '(m))
(cl:defmethod gesture-val ((m <gesture>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mp_test-msg:gesture-val is deprecated.  Use mp_test-msg:gesture instead.")
  (gesture m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <gesture>) ostream)
  "Serializes a message object of type '<gesture>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'gesture))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'gesture))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <gesture>) istream)
  "Deserializes a message object of type '<gesture>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gesture) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'gesture) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<gesture>)))
  "Returns string type for a message object of type '<gesture>"
  "mp_test/gesture")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'gesture)))
  "Returns string type for a message object of type 'gesture"
  "mp_test/gesture")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<gesture>)))
  "Returns md5sum for a message object of type '<gesture>"
  "61f2a41b9e73483e6fa26641a58eaf74")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'gesture)))
  "Returns md5sum for a message object of type 'gesture"
  "61f2a41b9e73483e6fa26641a58eaf74")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<gesture>)))
  "Returns full string definition for message of type '<gesture>"
  (cl:format cl:nil "string gesture~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'gesture)))
  "Returns full string definition for message of type 'gesture"
  (cl:format cl:nil "string gesture~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <gesture>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'gesture))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <gesture>))
  "Converts a ROS message object to a list"
  (cl:list 'gesture
    (cl:cons ':gesture (gesture msg))
))

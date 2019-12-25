
(cl:in-package :asdf)

(defsystem "servo_control-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "WritePos" :depends-on ("_package_WritePos"))
    (:file "_package_WritePos" :depends-on ("_package"))
    (:file "ServoState" :depends-on ("_package_ServoState"))
    (:file "_package_ServoState" :depends-on ("_package"))
    (:file "SetTorque" :depends-on ("_package_SetTorque"))
    (:file "_package_SetTorque" :depends-on ("_package"))
  ))
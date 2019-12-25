Ros wrapper and Arduino code for SCS40 control

servo_control.ino is the Arduino file


## create message to Arduino lib
rosrun rosserial_arduino make_libraries path_to_libraries servo_control

## open serial port
'rosrun rosserial_python serial_node.py /dev/ttyUSB0'




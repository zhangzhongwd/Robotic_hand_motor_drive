#!/usr/bin/env python
'''servo_control ROS Node'''
# license removed for brevity
import rospy
from servo_control.msg import WritePos
from servo_control.msg import ServoState

class CreatePosMessage():
    def __init__(self,id,pos,time):
        self.msg=WritePos()
        self.msg.id=id
        self.msg.pos=pos
        self.msg.exe_time=time


class ServoController():
    def __init__(self):
        rospy.init_node('servo_pos_publisher', anonymous=True)
        self.servo_states_lock = ServoState()
        self.servo_pos_pub = rospy.Publisher("/servo_pos", WritePos, queue_size=10)
        self.states_sub = rospy.Subscriber("/servo_states", ServoState, self.JSCallback, queue_size = 1)
    
    
    def publish_pos(self,msg):
        try:
            self.servo_pos_pub.publish(msg)       
        except rospy.ROSInterruptException: 
            print("publish error")   
        finally:
            pass

           
    def create_pos_msg(self,id,angle,time=200):
        '''
        id: servo id
        angle: 0-300 degree
        time: in ms
        '''
        msg=WritePos()
        if (angle>=0) and (angle<=300):
            pos = int(angle*(1023.0/300))
            print pos
        else:
            print('wrong angle range')
            return False
        msg.id = id
        msg.pos = pos
        msg.exe_time = time
        return msg
    
    def JSCallback(self,data):
        self.servo_states_lock.id = data.id
        self.servo_states_lock.pos = data.pos
        self.servo_states_lock.torque = data.torque

        print self.servo_states_lock


def main():
    s=ServoController()

    for i in range(0,10):
        msg = s.create_pos_msg(1,300)
        s.publish_pos(msg)     
        rospy.sleep(2.)

        # print(s.servo_states_lock)
        
        msg = s.create_pos_msg(1,0)
        s.publish_pos(msg)  
        rospy.sleep(2.)  

        # print(s.servo_states_lock)
 
    rospy.spin()



if __name__=='__main__':
    main()

    

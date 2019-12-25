#!/usr/bin/env python
'''servo_control ROS Node'''
# license removed for brevity
import rospy
import time
# from servo_control.msg import WritePos
# from servo_control.msg import ServoState
from servo_control.msg import SetTorque

# class CreatePosMessage():
#     def __init__(self,id,pos,time):
#         self.msg=WritePos()
#         self.msg.id=id
#         self.msg.pos=pos
#         self.msg.exe_time=time

class ServoSettleTorque():
    def __init__(self):
        rospy.init_node('servo_set_torque_publisher',anonymous=True)
        self.servo_torque_pub = rospy.Publisher("/servo_settorque",SetTorque,queue_size=10)
        self.servo_torque_sub = rospy.Subscriber("/servo_settorque_label", SetTorque, self.JSCallback)


    def publish_torque(self,msg):
        try:
            self.servo_torque_pub.publish(msg)
        except rospy.ROSInterruptException:
            print("publish torque error")
        finally:
            pass
    def create_torque_msg(self,id,ptorque,ptime,otorque):
        '''
        id: servo id
        ptorque:protect torque value 0-100%
        time: 1=4ms
        otorque:overload torque value 0-100%

        '''
        msg=SetTorque()
        # if (angle>=0) and (angle<=300):
        #     pos = int(angle*(1023.0/300))
        #     print pos
        # else:
        #     print('wrong angle range')
        #     return False
        msg.id = id
        msg.ptorque = ptorque
        msg.ptime = ptime
        msg.otorque = otorque
        print (ptorque,ptime,otorque)
        return msg
    
    def JSCallback(self,data):
        print (data.id,data.ptorque,data.ptime,data.otorque)


# class ServoController():
#     def __init__(self):
#         rospy.init_node('servo_pos_publisher', anonymous=True)
#         self.servo_states_lock = ServoState()
#         self.servo_pos_pub = rospy.Publisher("/servo_pos", WritePos, queue_size=10)
#         # self.states_sub = rospy.Subscriber("/servo_states", ServoState, self.JSCallback, queue_size = 1)
#         self.states_sub = rospy.Subscriber("/servo_states", ServoState, self.JSCallback)
    
#     def publish_pos(self,msg):
#         try:
#             self.servo_pos_pub.publish(msg)       
#         except rospy.ROSInterruptException: 
#             print("publish pos error")   
#         finally:
#             pass

           
#     def create_pos_msg(self,id,angle,time=200):
#         '''
#         id: servo id
#         angle: 0-300 degree
#         time: in ms
#         '''
#         msg=WritePos()
#         # if (angle>=0) and (angle<=300):
#         #     pos = int(angle*(1023.0/300))
#         #     print pos
#         # else:
#         #     print('wrong angle range')
#         #     return False
#         msg.id = id
#         msg.pos = angle
#         msg.exe_time = time
#         print angle
#         return msg
    
#     def JSCallback(self,data):
#         self.servo_states_lock.id = data.id
#         self.servo_states_lock.pos = data.pos
#         self.servo_states_lock.torque = data.torque

#         # print self.servo_states_lock


def main():
    q=ServoSettleTorque()
    # s=ServoController()

    # print (time.time())
    # #wait computer and arduino construct communication
    # rospy.sleep(2.0) 
    # print ('already')
    # print (time.time())

    # for i in range(0,10):
    #     msg = s.create_pos_msg(1,500,2000)
    #     s.publish_pos(msg) 
    #     # print ('i have published')  
    #     rospy.sleep(5.)
    #     # print ('already wait 5')


    #     print(s.servo_states_lock)

    #     msg = s.create_pos_msg(1,0,2000)
    #     s.publish_pos(msg)  
    #     # print ('i have published') 
    #     rospy.sleep(5.)  
    #     # print ('already wait 5')

    #     print(s.servo_states_lock)
 
    rospy.spin()



if __name__=='__main__':
    main()

    

#!/usr/bin/env python

from servo_control.srv import *
import rospy
from servo_control.msg import WritePos

def go_some_grasp(req):
	global p
	print "go into this function"
	print req.command
	if req.command=='1':
		msg=WritePos()
		msg.id=1
		msg.pos=1000
		msg.exe_time=2000
		p.publish(msg)
		print "Already pub"
	if req.command=='2':
		msg=WritePos()
		msg.id=1
		msg.pos=0
		msg.exe_time=2000
		p.publish(msg)
	return HandGraspResponse(1)

def go_index_degree(req):
	global p
	print "go into index function"
	print req.command
	index_degree=int(req.command)
	if -25<=index_degree<=90:
		msg=WritePos()
		msg.id=5
		msg.pos=406+int((570-406)/90.0*index_degree)
		msg.exe_time=2000
		p.publish(msg)
		print "%d_servo have reached %d position"%(msg.id,msg.pos)
		# rospy.sleep(3)
		msg.id=2
		msg.pos=644-int((644-379)/90.0*index_degree)
		msg.exe_time=2000
		p.publish(msg)
		print "%d_servo have reached %d position"%(msg.id,msg.pos)
	else:
		pass
	return HandGraspResponse(2)

def go_index_rotation(req):
	global p
	print "let index rotate forever"
	print req.command
	if req.command=="rotate":
		msg=WritePos()
		for i in range(0,3):
			msg.id=5
			msg.pos=360
			msg.exe_time=2000
			p.publish(msg)
			print "%d_servo have reached %d position"%(msg.id,msg.pos)
			msg.id=2
			msg.pos=644
			msg.exe_time=2000
			p.publish(msg)
			print "%d_servo have reached %d position"%(msg.id,msg.pos)
			rospy.sleep(2.5)
			msg.id=5
			msg.pos=570
			msg.exe_time=2000
			p.publish(msg)
			print "%d_servo have reached %d position"%(msg.id,msg.pos)
			msg.id=2
			msg.pos=379
			msg.exe_time=2000
			p.publish(msg)
			print "%d_servo have reached %d position"%(msg.id,msg.pos)
			rospy.sleep(2.5)
	else:
		pass
	return HandGraspResponse(3)			



def handgrasp_server():
	rospy.init_node('handgrasp_server')	
	s = rospy.Service('hand_grasp_posture', HandGrasp, go_some_grasp)
	print "Ready to go some grasp posture."
	# rospy.spin()

def hand_index():
	rospy.init_node('handgrasp_server')
	ss = rospy.Service('hand_index_degree',HandGrasp, go_index_degree)
	print "Ready to rotate index"
	# rospy.spin()

def hand_index_rotation():
	rospy.init_node('handgrasp_server')
	ss = rospy.Service('hand_index_rotation',HandGrasp, go_index_rotation)
	print "Ready to rotate index"



if __name__ == "__main__":
	p=rospy.Publisher("servo_pos",WritePos,queue_size=10)
	handgrasp_server()
	hand_index()
	hand_index_rotation()
	rospy.spin()
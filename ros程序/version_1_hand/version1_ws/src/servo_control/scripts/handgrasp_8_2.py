#!/usr/bin/env python

from servo_control.srv import *
import rospy
from servo_control.msg import WritePos
import time



def thumb_cmc(degree):
	global p 
	msg=WritePos()
	msg.exe_time=2000
	if 0<=degree<=90:
		msg.id=1
		msg.pos=800-int(260/90.0*degree)
		p.publish(msg)
		msg.id=6
		msg.pos=425+int(303/90.0*degree)
		p.publish(msg)
		msg.id=4
		msg.pos=560+int(125/90.0*degree)
		p.publish(msg)
		rospy.sleep(msg.exe_time/1000.0+0.5)
	print "the thumb has rotated %d degrees"%degree

def index_mcp(degree):
	global p 
	msg=WritePos()
	msg.exe_time=2000
	if 0<=degree<=90:
		msg.id=5
		msg.pos=290+int(140/90.0*degree)
		p.publish(msg)
		msg.id=2
		msg.pos=550-int(240/90.0*degree)
		p.publish(msg)
		msg.id=3
		msg.pos=800-int(230/90.0*degree)
		p.publish(msg)
		print "the index mcp has rotated %d degrees"%degree
	elif -20<=degree<0:
		msg.id=5
		msg.pos=290+int(50/20.0*degree)
		p.publish(msg)
		msg.id=2
		msg.pos=550-int(60/20.0*degree)
		p.publish(msg)
		msg.id=3
		msg.pos=800-int(60/20.0*degree)
		p.publish(msg)
		print "the index mcp has rotated %d degrees"%degree
	else:
		print "the index mcp degree input is wrong"
	nowtime=time.time()
	rospy.sleep(msg.exe_time/1000.0+0.5)
	print time.time()-nowtime


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

def go_thumb_cmc(req):
	global p
	print "go into go_thumb_cmc function"
	print req.command
	thumb_degree=int(req.command)
	if 0<=thumb_degree<=90:
		thumb_cmc(thumb_degree)
	print "i finished thumb cmc rotation"
	return HandGraspResponse(2)

def go_index_mcp(req):
	global p 
	print "go into go_index_mcp function"
	print req.command
	index_degree=int(req.command)
	print "index degree is %d"%index_degree
	if -20<=index_degree<=90:
		index_mcp(index_degree)
	print "i finished index mcp rotation"
	return HandGraspResponse(3)


def handgrasp_server():
	rospy.init_node('handgrasp_server')	
	s = rospy.Service('hand_grasp_posture', HandGrasp, go_some_grasp)
	print "Ready to go some grasp posture."
	# rospy.spin()


def hand_thumb_cmc():
	rospy.init_node('handgrasp_server')
	ss = rospy.Service('hand_thumb_cmc',HandGrasp, go_thumb_cmc)
	print "Ready to rotate thumb cmc"
	# rospy.spin()

def hand_index_mcp():
	rospy.init_node('handgrasp_server')
	ss = rospy.Service('hand_index_mcp',HandGrasp, go_index_mcp)
	print "Ready to rotate index mcp"
	# rospy.spin()



if __name__ == "__main__":
	p=rospy.Publisher("servo_pos",WritePos,queue_size=10)
	handgrasp_server()
	hand_thumb_cmc()
	hand_index_mcp()
	rospy.spin()
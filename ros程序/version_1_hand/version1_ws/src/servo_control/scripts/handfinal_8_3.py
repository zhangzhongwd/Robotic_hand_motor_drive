#!/usr/bin/env python

from servo_control.srv import *
import rospy
from servo_control.msg import WritePos
import time


def thumb_to_index():
	global p
	msg=WritePos()
	msg.exe_time=1000

	index_mcp(30)
	rospy.sleep(0.1)
	msg.id=3
	msg.pos=550
	p.publish(msg)
	rospy.sleep(msg.exe_time/1000.0+0.5)

	thumb_cmc(50)
	rospy.sleep(msg.exe_time/1000.0+0.5)

	msg.id=6
	msg.pos=400
	p.publish(msg)
	rospy.sleep(0.1)
	msg.id=4
	msg.pos=400
	p.publish(msg)
	rospy.sleep(msg.exe_time/1000.0+0.5)

	print "i have finished thumb_to_index"

def thumb_to_middle():
	global p
	msg=WritePos()
	msg.exe_time=1000

	msg.id=7
	msg.pos=400
	p.publish(msg)
	rospy.sleep(msg.exe_time/1000.0+0.5)

	thumb_cmc(60)
	rospy.sleep(msg.exe_time/1000.0+0.5)

	msg.id=6
	msg.pos=450
	p.publish(msg)
	rospy.sleep(0.1)
	msg.id=4
	msg.pos=400
	p.publish(msg)
	rospy.sleep(msg.exe_time/1000.0+0.5)

	print "i have finished thumb_to_middle"

def thumb_to_ring():
	global p
	msg=WritePos()
	msg.exe_time=1000

	msg.id=8
	msg.pos=300
	p.publish(msg)
	rospy.sleep(msg.exe_time/1000.0+0.5)

	thumb_cmc(80)
	rospy.sleep(msg.exe_time/1000.0+0.5)

	msg.id=6
	msg.pos=500
	p.publish(msg)
	rospy.sleep(0.1)
	msg.id=4
	msg.pos=400
	p.publish(msg)
	rospy.sleep(msg.exe_time/1000.0+0.5)

	print "i have finished thumb_to_ring"	

def tighten():
	global p
	msg=WritePos()
	msg.exe_time=1000
	msg.id=1
	msg.pos=710
	p.publish(msg)
	print msg.id,msg.pos
	msg.id=4
	msg.pos=480
	p.publish(msg)
	print msg.id,msg.pos
	msg.id=6
	msg.pos=315
	p.publish(msg)
	print msg.id,msg.pos
	rospy.sleep(0.1)

	msg.id=2
	msg.pos=550
	p.publish(msg)
	print msg.id,msg.pos
	msg.id=3
	msg.pos=800
	p.publish(msg)
	print msg.id,msg.pos
	msg.id=5
	msg.pos=290
	p.publish(msg)
	print msg.id,msg.pos
	rospy.sleep(0.1)

	msg.id=7
	msg.pos=600
	p.publish(msg)
	print msg.id,msg.pos
	msg.id=8
	msg.pos=600
	p.publish(msg)
	print msg.id,msg.pos
	msg.id=9
	msg.pos=860
	p.publish(msg)

	print "hand is staying tighten state"
	rospy.sleep(msg.exe_time/1000.0+0.5)

def whole_movement():
	global p
	thumb_to_index()
	# rospy.sleep(0.5)
	tighten()
	# rospy.sleep(0.5)
	thumb_to_middle()
	# rospy.sleep(0.5)
	tighten()
	# rospy.sleep(0.5)
	thumb_to_ring()
	# rospy.sleep(0.5)
	tighten()
	# rospy.sleep(0.5)
	print "finished whole_movement"

def index_20_90():
	global p
	msg=WritePos()
	msg.exe_time=1000
	for i in range(0,3):
		index_mcp(-20)
		rospy.sleep(msg.exe_time/1000.0+0.5)
		index_mcp(90)
		rospy.sleep(msg.exe_time/1000.0+0.5)
def index_30_450_700():
 	global p 
 	msg=WritePos()
 	msg.exe_time=1000
 	index_mcp(30)
 	rospy.sleep(msg.exe_time/1000.0+0.5)
 	for i in range(0,3):
 		msg.id=3
 		msg.pos=450
 		p.publish(msg)
 		rospy.sleep(msg.exe_time/1000.0+0.5)
 		msg.pos=700
 		p.publish(msg)
 		rospy.sleep(msg.exe_time/1000.0+0.5)

def index_20_530_860():
 	global p 
 	msg=WritePos()
 	msg.exe_time=1000
 	index_mcp(-20)
 	rospy.sleep(msg.exe_time/1000.0+0.5)
 	for i in range(0,3):
 		msg.id=3
 		msg.pos=530
 		p.publish(msg)
 		msg.id=2
 		msg.pos=400
 		p.publish(msg)
 		rospy.sleep(msg.exe_time/1000.0+0.5)
 		msg.id=3
 		msg.pos=860
 		p.publish(msg)
 		msg.id=2
 		msg.pos=610
 		p.publish(msg)
 		rospy.sleep(msg.exe_time/1000.0+0.5)

def index_negative():
	global p
	msg=WritePos()
	msg.exe_time=1000
	index_mcp(30)
	rospy.sleep(msg.exe_time/1000.0+0.5)
	for i in range(0,3):
		msg.id=2
		msg.pos=250
		p.publish(msg)
		rospy.sleep(msg.exe_time/1000.0+1.5)
		msg.id=3
		msg.pos=200
		p.publish(msg)
		rospy.sleep(msg.exe_time/1000.0+1.5)
		index_mcp(30)
		rospy.sleep(msg.exe_time/1000.0+0.5)

def thumb_xuannei():
	global p
	msg=WritePos()
	msg.exe_time=1000
	for i in range(0,3):
		thumb_cmc(0)
		rospy.sleep(msg.exe_time/1000.0+0.5)
		thumb_cmc(90)
		rospy.sleep(msg.exe_time/1000.0+0.5)
	for i in range(0,3):
		msg.id=6
		msg.pos=300
		p.publish(msg)
		rospy.sleep(msg.exe_time/1000.0+0.5)
		msg.pos=650
		p.publish(msg)
		rospy.sleep(msg.exe_time/1000.0+0.5)
	msg.id=6
	msg.pos=450
	p.publish(msg)
	rospy.sleep(msg.exe_time/1000.0+0.5)
	for i in range(0,3):
		msg.id=4
		msg.pos=180
		p.publish(msg)
		rospy.sleep(msg.exe_time/1000.0+0.5)
		msg.pos=580
		p.publish(msg)
		rospy.sleep(msg.exe_time/1000.0+0.5)

def thumb_cmc(degree):
	global p 
	msg=WritePos()
	msg.exe_time=1000
	if 0<=degree<=90:
		msg.id=1
		msg.pos=710-int(250/90.0*degree)
		p.publish(msg)
		msg.id=6
		msg.pos=315+int(225/90.0*degree)
		p.publish(msg)
		msg.id=4
		msg.pos=480+int(100/90.0*degree)
		p.publish(msg)
		# rospy.sleep(msg.exe_time/1000.0+0.5)
	print "the thumb has rotated %d degrees"%degree

def index_mcp(degree):
	global p 
	msg=WritePos()
	msg.exe_time=1000
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
	# rospy.sleep(msg.exe_time/1000.0+0.5)
	print time.time()-nowtime

def adjust_state(req):
	global p
	print "ready to adjust state"
	print req.command
	msg=WritePos()
	msg.exe_time=2000
	if req.command=='tighten':
		msg.id=1
		msg.pos=710
		p.publish(msg)
		print msg.id,msg.pos
		msg.id=4
		msg.pos=480
		p.publish(msg)
		print msg.id,msg.pos
		msg.id=6
		msg.pos=315
		p.publish(msg)
		print msg.id,msg.pos
		rospy.sleep(0.1)

		msg.id=2
		msg.pos=550
		p.publish(msg)
		print msg.id,msg.pos
		msg.id=3
		msg.pos=800
		p.publish(msg)
		print msg.id,msg.pos
		msg.id=5
		msg.pos=290
		p.publish(msg)
		print msg.id,msg.pos
		rospy.sleep(0.1)

		msg.id=7
		msg.pos=600
		p.publish(msg)
		print msg.id,msg.pos
		msg.id=8
		msg.pos=600
		p.publish(msg)
		print msg.id,msg.pos
		msg.id=9
		msg.pos=860
		p.publish(msg)

		print "hand is staying tighten state"
		rospy.sleep(msg.exe_time/1000.0+0.5)
	if req.command=='loosen':
		msg.id=1
		msg.pos=710
		p.publish(msg)
		print msg.id,msg.pos
		msg.id=4
		msg.pos=580
		p.publish(msg)
		print msg.id,msg.pos
		msg.id=6
		msg.pos=540
		p.publish(msg)
		print msg.id,msg.pos
		rospy.sleep(0.1)

		msg.id=2
		msg.pos=610
		p.publish(msg)
		print msg.id,msg.pos
		msg.id=3
		msg.pos=860
		p.publish(msg)
		print msg.id,msg.pos
		msg.id=5
		msg.pos=430
		p.publish(msg)
		print msg.id,msg.pos
		rospy.sleep(0.1)

		msg.id=7
		msg.pos=625
		p.publish(msg)
		print msg.id,msg.pos
		msg.id=8
		msg.pos=600
		p.publish(msg)
		print msg.id,msg.pos
		msg.id=9
		msg.pos=860
		p.publish(msg)

		rospy.sleep(msg.exe_time/1000.0+0.5)
		print "hand is staying loosen state"
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

def go_action(req):
	global p 
	print "go to action"
	print req.command
	if req.command=='1':
		thumb_to_index()
	elif req.command=='2':
		thumb_to_middle()
	elif req.command=='3':
		thumb_to_ring()
	elif req.command=='4':
		tighten()
	elif req.command=='5':
		whole_movement()
	elif req.command=='6':
		index_20_90()
	elif req.command=='7':
		index_30_450_700()
	elif req.command=='8':
		index_20_530_860()
	elif req.command=='9':
		index_negative()
	elif req.command=='10':
		thumb_xuannei()

	else:
		print "no action"
	return HandGraspResponse(4)

def hand_state_server():
	rospy.init_node('handgrasp_server')	
	s = rospy.Service('hand_state_posture', HandGrasp, adjust_state)
	print "Ready to adjust hand state."
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
def hand_action_server():
	rospy.init_node('handgrasp_server')
	ss = rospy.Service('hand_action_server',HandGrasp, go_action)
	print "Ready to action"
	# rospy.spin()


if __name__ == "__main__":
	p=rospy.Publisher("servo_pos",WritePos,queue_size=10)
	hand_state_server()
	hand_thumb_cmc()
	hand_index_mcp()
	hand_action_server()
	rospy.spin()
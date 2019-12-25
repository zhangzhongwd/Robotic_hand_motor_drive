/*
  *communicate with ROS
  *write servo position 
  *publish servo states
 */


#include <ros.h>
#include <servo_control/WritePos.h>
#include <servo_control/ServoState.h>
#include <servo_control/SetTorque.h>
#include "SCServo.h"


SCServo SERVO;
int LEDpin = 13;

ros::NodeHandle  nh;




void blinkLED(){
  digitalWrite(13, HIGH-digitalRead(13));   // blink the led
}




ros::Subscriber<servo_control::WritePos> write_pos_sub("/servo_pos", messageCb );
ros::Subscriber<servo_control::SetTorque> write_torque_sub("/servo_settorque",settleTorque);
servo_control::ServoState servo_states;
ros::Publisher states_pub("/servo_states", &servo_states);
servo_control::SetTorque servotorque;
ros::Publisher torque_pub("/servo_settorque_label",&servotorque);
int servo_number=9;  // GIVE SERVO NUMBERS

void settleTorque(const servo_control::SetTorque& msg){
  //set servo protecttorque value, protect time and overload torque
  torque_pub.publish(&msg);
  int id=msg.id;
  int ptorque=msg.ptorque;
  int ptime=msg.ptime;
  int otorque=msg.otorque;
  SERVO.ProtectTorque(id,ptorque);
  SERVO.ProtectTime(id,ptime);
  SERVO.OverTorque(id,otorque);
  
}

void messageCb( const servo_control::WritePos& msg){
  //set servo to specific angle
  int id=msg.id;
  int pos=msg.pos;
  int exe_time=msg.exe_time;
  SERVO.WritePos(id, pos, exe_time);
}


void setup()
{
  nh.getHardware()->setBaud(115200);
  nh.initNode(); 
  nh.advertise(torque_pub);
  nh.advertise(states_pub);
  nh.subscribe(write_pos_sub);
  nh.subscribe(write_torque_sub);
  pinMode(LEDpin,OUTPUT);
  digitalWrite(LEDpin, HIGH);
  Serial1.begin(1000000);
  SERVO.pSerial = &Serial1;
  delay(500);
  SERVO.EnableTorque(1, 1);
  SERVO.EnableTorque(2, 1); 
  SERVO.EnableTorque(3, 1); 
  SERVO.EnableTorque(4, 1); 
  SERVO.EnableTorque(5, 1); 
  SERVO.EnableTorque(6, 1); 
  SERVO.EnableTorque(7, 1); 
  SERVO.EnableTorque(8, 1); 
  SERVO.EnableTorque(9, 1); 
}

int16_t trans32to16(int data)
{
    bool neg_status = 0;
    int16_t abs_value;
    int16_t new_data;

    if (data < 0)
    {
      abs_value = (int16_t)(-data);
      new_data = -abs_value;
      return new_data;
    }
    else
    {
      new_data = (int16_t)data;
      return new_data;     
    }
 
}

void loop()
{
  servo_control::ServoState servo_states_msg;

  int16_t id[servo_number]={0};
  int16_t p[servo_number]={0};
  int16_t l[servo_number]={0};
  

  for(int i=0;i<servo_number;i++){ 
    // read servo states
    int pos = SERVO.ReadPos(i+1);  //SET SERVO ID
    int load = SERVO.ReadLoad(i+1);
    id[i]=i+1;
    p[i]=trans32to16(pos);
    l[i]=trans32to16(load);
  
  }

   //create servo states message
    servo_states_msg.id_length=servo_number;
    servo_states_msg.pos_length=servo_number;
    servo_states_msg.torque_length=servo_number;
    servo_states_msg.id = id;
    servo_states_msg.pos = p;
    servo_states_msg.torque = l;  
 
  //  publish servo states
  states_pub.publish(&servo_states_msg);
  blinkLED();
  
  nh.spinOnce();
  delay(50);
}



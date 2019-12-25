/*
  *communicate with ROS
  *write servo position 
  *publish servo states
 */


#include <ros.h>
#include <servo_control/WritePos.h>
#include <servo_control/ServoState.h>
#include "SCServo.h"


SCServo SERVO;
int LEDpin = 13;

ros::NodeHandle  nh;


void messageCb( const servo_control::WritePos& msg){
  //set servo to specific angle
  int id=msg.id;
  int pos=msg.pos;
  int exe_time=msg.exe_time;
  SERVO.WritePos(id, pos, exe_time);
}

void blinkLED(){
  digitalWrite(13, HIGH-digitalRead(13));   // blink the led
}


ros::Subscriber<servo_control::WritePos> write_pos_sub("/servo_pos", messageCb );
servo_control::ServoState servo_states;
ros::Publisher states_pub("/servo_states", &servo_states);
int servo_number=2;  // GIVE SERVO NUMBERS


void setup()
{
  nh.getHardware()->setBaud(57600);
  nh.initNode(); 
  nh.advertise(states_pub);
  nh.subscribe(write_pos_sub);
  pinMode(LEDpin,OUTPUT);
  digitalWrite(LEDpin, HIGH);
  Serial1.begin(1000000);
  SERVO.pSerial = &Serial1;
  delay(500);
  SERVO.EnableTorque(1, 0);
  SERVO.EnableTorque(2, 1); 
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



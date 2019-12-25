#ifndef _ROS_servo_control_SetTorque_h
#define _ROS_servo_control_SetTorque_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace servo_control
{

  class SetTorque : public ros::Msg
  {
    public:
      int16_t id;
      int16_t ptorque;
      int16_t ptime;
      int16_t otorque;

    SetTorque():
      id(0),
      ptorque(0),
      ptime(0),
      otorque(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const
    {
      int offset = 0;
      union {
        int16_t real;
        uint16_t base;
      } u_id;
      u_id.real = this->id;
      *(outbuffer + offset + 0) = (u_id.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_id.base >> (8 * 1)) & 0xFF;
      offset += sizeof(this->id);
      union {
        int16_t real;
        uint16_t base;
      } u_ptorque;
      u_ptorque.real = this->ptorque;
      *(outbuffer + offset + 0) = (u_ptorque.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_ptorque.base >> (8 * 1)) & 0xFF;
      offset += sizeof(this->ptorque);
      union {
        int16_t real;
        uint16_t base;
      } u_ptime;
      u_ptime.real = this->ptime;
      *(outbuffer + offset + 0) = (u_ptime.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_ptime.base >> (8 * 1)) & 0xFF;
      offset += sizeof(this->ptime);
      union {
        int16_t real;
        uint16_t base;
      } u_otorque;
      u_otorque.real = this->otorque;
      *(outbuffer + offset + 0) = (u_otorque.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_otorque.base >> (8 * 1)) & 0xFF;
      offset += sizeof(this->otorque);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer)
    {
      int offset = 0;
      union {
        int16_t real;
        uint16_t base;
      } u_id;
      u_id.base = 0;
      u_id.base |= ((uint16_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_id.base |= ((uint16_t) (*(inbuffer + offset + 1))) << (8 * 1);
      this->id = u_id.real;
      offset += sizeof(this->id);
      union {
        int16_t real;
        uint16_t base;
      } u_ptorque;
      u_ptorque.base = 0;
      u_ptorque.base |= ((uint16_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_ptorque.base |= ((uint16_t) (*(inbuffer + offset + 1))) << (8 * 1);
      this->ptorque = u_ptorque.real;
      offset += sizeof(this->ptorque);
      union {
        int16_t real;
        uint16_t base;
      } u_ptime;
      u_ptime.base = 0;
      u_ptime.base |= ((uint16_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_ptime.base |= ((uint16_t) (*(inbuffer + offset + 1))) << (8 * 1);
      this->ptime = u_ptime.real;
      offset += sizeof(this->ptime);
      union {
        int16_t real;
        uint16_t base;
      } u_otorque;
      u_otorque.base = 0;
      u_otorque.base |= ((uint16_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_otorque.base |= ((uint16_t) (*(inbuffer + offset + 1))) << (8 * 1);
      this->otorque = u_otorque.real;
      offset += sizeof(this->otorque);
     return offset;
    }

    const char * getType(){ return "servo_control/SetTorque"; };
    const char * getMD5(){ return "323a0bff3fb4a0ad827682d128ae9b5c"; };

  };

}
#endif
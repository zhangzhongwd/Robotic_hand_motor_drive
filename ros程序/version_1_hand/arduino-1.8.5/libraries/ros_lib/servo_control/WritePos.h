#ifndef _ROS_servo_control_WritePos_h
#define _ROS_servo_control_WritePos_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace servo_control
{

  class WritePos : public ros::Msg
  {
    public:
      int16_t id;
      int16_t pos;
      int32_t exe_time;

    WritePos():
      id(0),
      pos(0),
      exe_time(0)
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
      } u_pos;
      u_pos.real = this->pos;
      *(outbuffer + offset + 0) = (u_pos.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_pos.base >> (8 * 1)) & 0xFF;
      offset += sizeof(this->pos);
      union {
        int32_t real;
        uint32_t base;
      } u_exe_time;
      u_exe_time.real = this->exe_time;
      *(outbuffer + offset + 0) = (u_exe_time.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_exe_time.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_exe_time.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_exe_time.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->exe_time);
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
      } u_pos;
      u_pos.base = 0;
      u_pos.base |= ((uint16_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_pos.base |= ((uint16_t) (*(inbuffer + offset + 1))) << (8 * 1);
      this->pos = u_pos.real;
      offset += sizeof(this->pos);
      union {
        int32_t real;
        uint32_t base;
      } u_exe_time;
      u_exe_time.base = 0;
      u_exe_time.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_exe_time.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_exe_time.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_exe_time.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->exe_time = u_exe_time.real;
      offset += sizeof(this->exe_time);
     return offset;
    }

    const char * getType(){ return "servo_control/WritePos"; };
    const char * getMD5(){ return "5344dbb4eb0d3ece2f045928ac961746"; };

  };

}
#endif
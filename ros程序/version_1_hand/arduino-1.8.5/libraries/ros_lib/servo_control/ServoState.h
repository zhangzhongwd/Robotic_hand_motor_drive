#ifndef _ROS_servo_control_ServoState_h
#define _ROS_servo_control_ServoState_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace servo_control
{

  class ServoState : public ros::Msg
  {
    public:
      uint8_t id_length;
      int16_t st_id;
      int16_t * id;
      uint8_t pos_length;
      int16_t st_pos;
      int16_t * pos;
      uint8_t torque_length;
      int16_t st_torque;
      int16_t * torque;

    ServoState():
      id_length(0), id(NULL),
      pos_length(0), pos(NULL),
      torque_length(0), torque(NULL)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const
    {
      int offset = 0;
      *(outbuffer + offset++) = id_length;
      *(outbuffer + offset++) = 0;
      *(outbuffer + offset++) = 0;
      *(outbuffer + offset++) = 0;
      for( uint8_t i = 0; i < id_length; i++){
      union {
        int16_t real;
        uint16_t base;
      } u_idi;
      u_idi.real = this->id[i];
      *(outbuffer + offset + 0) = (u_idi.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_idi.base >> (8 * 1)) & 0xFF;
      offset += sizeof(this->id[i]);
      }
      *(outbuffer + offset++) = pos_length;
      *(outbuffer + offset++) = 0;
      *(outbuffer + offset++) = 0;
      *(outbuffer + offset++) = 0;
      for( uint8_t i = 0; i < pos_length; i++){
      union {
        int16_t real;
        uint16_t base;
      } u_posi;
      u_posi.real = this->pos[i];
      *(outbuffer + offset + 0) = (u_posi.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_posi.base >> (8 * 1)) & 0xFF;
      offset += sizeof(this->pos[i]);
      }
      *(outbuffer + offset++) = torque_length;
      *(outbuffer + offset++) = 0;
      *(outbuffer + offset++) = 0;
      *(outbuffer + offset++) = 0;
      for( uint8_t i = 0; i < torque_length; i++){
      union {
        int16_t real;
        uint16_t base;
      } u_torquei;
      u_torquei.real = this->torque[i];
      *(outbuffer + offset + 0) = (u_torquei.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_torquei.base >> (8 * 1)) & 0xFF;
      offset += sizeof(this->torque[i]);
      }
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer)
    {
      int offset = 0;
      uint8_t id_lengthT = *(inbuffer + offset++);
      if(id_lengthT > id_length)
        this->id = (int16_t*)realloc(this->id, id_lengthT * sizeof(int16_t));
      offset += 3;
      id_length = id_lengthT;
      for( uint8_t i = 0; i < id_length; i++){
      union {
        int16_t real;
        uint16_t base;
      } u_st_id;
      u_st_id.base = 0;
      u_st_id.base |= ((uint16_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_st_id.base |= ((uint16_t) (*(inbuffer + offset + 1))) << (8 * 1);
      this->st_id = u_st_id.real;
      offset += sizeof(this->st_id);
        memcpy( &(this->id[i]), &(this->st_id), sizeof(int16_t));
      }
      uint8_t pos_lengthT = *(inbuffer + offset++);
      if(pos_lengthT > pos_length)
        this->pos = (int16_t*)realloc(this->pos, pos_lengthT * sizeof(int16_t));
      offset += 3;
      pos_length = pos_lengthT;
      for( uint8_t i = 0; i < pos_length; i++){
      union {
        int16_t real;
        uint16_t base;
      } u_st_pos;
      u_st_pos.base = 0;
      u_st_pos.base |= ((uint16_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_st_pos.base |= ((uint16_t) (*(inbuffer + offset + 1))) << (8 * 1);
      this->st_pos = u_st_pos.real;
      offset += sizeof(this->st_pos);
        memcpy( &(this->pos[i]), &(this->st_pos), sizeof(int16_t));
      }
      uint8_t torque_lengthT = *(inbuffer + offset++);
      if(torque_lengthT > torque_length)
        this->torque = (int16_t*)realloc(this->torque, torque_lengthT * sizeof(int16_t));
      offset += 3;
      torque_length = torque_lengthT;
      for( uint8_t i = 0; i < torque_length; i++){
      union {
        int16_t real;
        uint16_t base;
      } u_st_torque;
      u_st_torque.base = 0;
      u_st_torque.base |= ((uint16_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_st_torque.base |= ((uint16_t) (*(inbuffer + offset + 1))) << (8 * 1);
      this->st_torque = u_st_torque.real;
      offset += sizeof(this->st_torque);
        memcpy( &(this->torque[i]), &(this->st_torque), sizeof(int16_t));
      }
     return offset;
    }

    const char * getType(){ return "servo_control/ServoState"; };
    const char * getMD5(){ return "37c0e1ad113d34ab23273f03f228e896"; };

  };

}
#endif
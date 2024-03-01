#ifndef CAN_HPP_ 
#define CAN_HPP_

#ifdef __cplusplus
extern "C" {
#endif
#include "gd32f30x_can.h"
#ifdef __cplusplus
 }
#endif



class Can
{ 
public: 
    Can(uint32_t can_periph);
    ErrStatus Init();    
    void ItEnable(uint32_t interupt);
    can_receive_message_struct Receive();
    void Transmit();
    can_parameter_struct CanParam;
    can_receive_message_struct RxParam;
    can_trasnmit_message_struct TxParam;

private:
    uint32_t mCanPeriph;
}; 

class CanFilter
{
public:
    CanFilter();
    void FilterInit();
    can_filter_parameter_struct FilterParam;
};
#endif /* CAN_HPP_ */ 

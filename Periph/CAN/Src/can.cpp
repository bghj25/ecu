#include "can.hpp"

Can::Can(uint32_t can_periph)
    :
    mCanPeriph(can_periph) //Инициализиарует структуры кан, сообщения и фильтра 
    {
        
        // can_struct_para_init(CAN_INIT_STRUCT, &CanParam);
        // can_struct_para_init(CAN_FILTER_STRUCT, &FilterParam);
        // can_struct_para_init(CAN_RX_MESSAGE_STRUCT, &RxParam);
        // can_struct_para_init(CAN_TX_MESSAGE_STRUCT, &TxParam);
    }

ErrStatus Can::Init()
{
    return can_init(mCanPeriph, &CanParam);

}

void Can::ItEnable(uint32_t interupt)
{
    can_interrupt_enable(mCanPeriph, interupt);
}

 can_receive_message_struct Can::Receive()
{
    can_receive_message_struct buf;
    can_message_receive(mCanPeriph, CAN_FIFO0, &buf);
    return buf;
}
void Can::Transmit()
{
    can_trasnmit_message_struct buf;
    can_message_transmit(mCanPeriph, &buf);
}
CanFilter::CanFilter()
{
    
}
void CanFilter::FilterInit()
{
    can_filter_init(&FilterParam);
}


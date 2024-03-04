#include "it.h"

void CAN0_RX0_IRQHandler(void)
{
    MsgReceivedd = SET;
    can_message_receive(CAN0, CAN_FIFO0, &msgR);
}
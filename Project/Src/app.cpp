#include "app.hpp"


/*
Раскометнитровать для тестирования платы
Простейший тест - мигание светодиодом
*/
//#define TEST

#ifdef TEST
void BlinkForBoardTest(void)
{
	GpioPin LedC0(GPIOC, GPIO_MODE_OUT_PP, GPIO_OSPEED_50MHZ, GPIO_PIN_0);
	while(true)
	{
		LedC0.Set();
		for(int i=0; i < 10000000; i++)
		{
			//asm("nop");
		}
		LedC0.Reset();
		for(int i=0; i < 10000000; i++)
		{
			//asm("nop");
		}
	}
}
#endif


void cpp()
{
	/*
	Раскометнитровать для тестирования платы
	Простейший тест - мигание светодиодом
	*/
	//BlinkForBoardTest();

	/*
	Пины по умолчанию: Rx - A11, Tx - A12, ремап отключен	
	При инициализации по умолчанию  системная частота - 120МГц
	APB1 - 60 МГц
	BitRate = 500 Kb/s
	Pre-scaler = 8
	Number of time quanta = 15
	Seg1 = 12 tq
	Seg2 = 2 tq
	Sample Point at 86.7
	*/
	GpioPin Can0RxPin(GPIOA, GPIO_MODE_AF_PP, GPIO_OSPEED_50MHZ, GPIO_PIN_11);
	GpioPin Can0TxPin(GPIOA, GPIO_MODE_IPU, GPIO_OSPEED_50MHZ, GPIO_PIN_12);
	
	Can Can0(CAN0);
	//Can0.CanParam.working_mode = CAN_NORMAL_MODE; 
	Can0.CanParam.working_mode = CAN_SILENT_LOOPBACK_MODE; //Для проверки рабты отпарвляем и читаем на одном контроллере
	Can0.CanParam.prescaler = 8;
	Can0.CanParam.resync_jump_width = CAN_BT_SJW_1TQ;
	Can0.CanParam.time_segment_1 = CAN_BT_BS1_12TQ;
	Can0.CanParam.time_segment_2 = CAN_BT_BS2_2TQ;
	Can0.CanParam.time_triggered =  DISABLE;
	Can0.CanParam.auto_bus_off_recovery = ENABLE;
	Can0.CanParam.auto_wake_up = ENABLE;
	Can0.CanParam.auto_retrans = ENABLE;
	Can0.CanParam.rec_fifo_overwrite = DISABLE;
	Can0.CanParam.trans_fifo_order = ENABLE;
	Can0.Init();
	nvic_irq_enable(CAN0_RX0_IRQn, 0, 0);
	Can0.ItEnable(CAN_INT_RFNE0);

	//Пока один фильтр, который пропускает всё
	CanFilter Filter0;
	Filter0.FilterParam.filter_bits = CAN_FILTERBITS_32BIT;
	Filter0.FilterParam.filter_mode = CAN_FILTERMODE_MASK;
	Filter0.FilterParam.filter_number = 0;
	Filter0.FilterParam.filter_list_high = 0x0000;
	Filter0.FilterParam.filter_list_low = 0x0000;
	Filter0.FilterParam.filter_mask_high = 0x0000;
	Filter0.FilterParam.filter_mask_low = 0x0000;
	Filter0.FilterParam.filter_fifo_number = CAN_FIFO0;
	Filter0.FilterParam.filter_enable = ENABLE;
	extern FlagStatus MsgReceivedd;
	can_receive_message_struct msgR;
	can_trasnmit_message_struct msgT;
	
	/*
	Пока заполняем втупую
	Потому можно будет внести струтку в класс, 
	сделать заполнение по умолчанию, для того, что не меняется
	*/
	can_struct_para_init(CAN_TX_MESSAGE_STRUCT, &msgT);	
	for(int i = 0; i < 8; i++)
	{
    	msgT.tx_data[i] = 0xFF;
    }
	msgT.tx_dlen = sizeof(msgT.tx_data) / sizeof(msgT.tx_data[0]);
	

	/* SPI0 GPIO config: SCK/PA5, MISO/PA6, MOSI/PA7, PA3 as NSS */
	GpioPin Spi0SCK_MOSI(GPIOA, GPIO_MODE_IN_FLOATING, GPIO_OSPEED_50MHZ, GPIO_PIN_5);
	GpioPin Spi0MISO(GPIOA, GPIO_MODE_AF_PP, GPIO_OSPEED_50MHZ, GPIO_PIN_6);
	GpioPin Spi0NSS(GPIOA, GPIO_MODE_IN_FLOATING, GPIO_OSPEED_50MHZ, GPIO_PIN_3);
	
	Spi Spi0(SPI0);
	Spi0.SpiParam.device_mode = SPI_SLAVE;
	Spi0.SpiParam.nss = SPI_NSS_HARD;
	Spi0.SpiParam.prescale = SPI_PSC_4;
	Spi0.SpiParam.clock_polarity_phase = SPI_CK_PL_LOW_PH_2EDGE;
	Spi0.SpiParam.endian = SPI_ENDIAN_MSB;
	Spi0.SpiParam.frame_size = SPI_FRAMESIZE_8BIT;
	Spi0.SpiParam.trans_mode = SPI_TRANSMODE_FULLDUPLEX;
	Spi0.SpiInit();
	//DMA
	Spi0.SpiEnable();

	while(1)
	{
		if(MsgReceivedd == SET)
		{
			msgR = Can0.Receive();
			MsgReceivedd = RESET;
		}
		for(int i = 0; i < 10000000; i++)
		{
			asm("nop");
		}
		//Отпоавить сообщение

	}
}


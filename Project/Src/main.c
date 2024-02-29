#include "app.hpp"
#include "gd32f30x.h"                   // Device header
#include "gd32f30x_gpio.h"              // GigaDevice::Device:GD32F30x_StdPeripherals:GPIO
#include "gd32f30x_rcu.h"
int main(void)
{
	rcu_periph_clock_enable(RCU_GPIOC);
	rcu_periph_clock_enable(RCU_GPIOA);	
	rcu_periph_clock_enable(RCU_AF);
	rcu_periph_clock_enable(RCU_CAN0);
	cpp();
	while(1)
	{
	}
}

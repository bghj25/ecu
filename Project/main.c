#include "app.hpp"
#include "gd32f30x.h"                   // Device header
#include "gd32f30x_gpio.h"              // GigaDevice::Device:GD32F30x_StdPeripherals:GPIO
#include "gd32f30x_rcu.h"
int main(void)
{
	rcu_periph_clock_enable(RCU_GPIOC);
	cpp();
	while(1)
	{
	}
}

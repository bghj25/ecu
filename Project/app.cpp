#include "app.hpp"
#include "gpio.hpp"

void cpp()
{
	GpioPin LedC0(GPIOC, GPIO_MODE_OUT_PP, GPIO_OSPEED_50MHZ, GPIO_PIN_0);
	
	while(true)
	{
		LedC0.Set();
		for(int i=0; i < 100000; i++)
		{
			
		}
		LedC0.Reset();
		for(int i=0; i < 100000; i++)
		{
			
		}
	}
}

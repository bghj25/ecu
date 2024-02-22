#include "gpio.hpp"

GpioPin::GpioPin(uint32_t port, uint32_t mode, uint32_t speed, uint32_t pin)
    :
    mGpioPin(pin),
    mGpioPort(port),
		mGpioMode(mode),
		mGpioSpeed(speed)
{
	gpio_init(mGpioPort, mGpioMode, mGpioSpeed, mGpioPin);
	
}
  
void GpioPin::Set()
{
  gpio_bit_write(mGpioPort, mGpioPin, SET);
}
 
void GpioPin::Reset()
{
    gpio_bit_write(mGpioPort, mGpioPin, RESET);
}

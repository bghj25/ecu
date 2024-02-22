#ifndef GPIO_HPP_ 
#define GPIO_HPP_

#ifdef __cplusplus
extern "C" {
#endif
#include "gd32f30x_gpio.h"
#ifdef __cplusplus
 }
#endif
class GpioPin 
{ 
public: 
    GpioPin(uint32_t port, uint32_t mode, uint32_t speed, uint32_t pin);
    void Set();
		void Reset();
    
    
private:
    uint32_t mGpioPin;
    uint32_t mGpioPort;
		uint32_t mGpioMode;
		uint32_t mGpioSpeed;
}; 
 
#endif /* GPIOPIN_HPP_ */ 

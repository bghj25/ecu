#include "main.h"
#include "app.h"
#include "gd32f30x_rcu.h"
#include "gd32f30x_gpio.h"

int main(void)
{
   
    rcu_periph_clock_enable(RCU_GPIOC);
    gpio_init(GPIOC, GPIO_MODE_OUT_PP, GPIO_OSPEED_50MHZ, GPIO_PIN_0);
        

    //cpp();
    int i = 0;
    while (1)
    {
        gpio_bit_write(GPIOC, GPIO_PIN_0, SET);
        for(i = 0; i < 100000; i++)
        {}
        gpio_bit_write(GPIOC, GPIO_PIN_0, RESET);
        for(i = 0; i < 100000; i++)
        {} 
        }
        
        //В стартапе вызывается _start, по идее это main(??)
        //Чекнуть если не будет работать
    
}
#ifndef SPI_H_
#define SPI_H_

#ifdef __cplusplus
extern "C"
{
#endif
#include "gd32f30x_spi.h"
#ifdef __cplusplus
}
#endif

class Spi
{
    public:
        Spi(uint32_t SpiPeriph);
        void SpiInit();
        void SpiEnable();
        spi_parameter_struct SpiParam;

    private:
        uint32_t mSpiPeriph;
};

#endif
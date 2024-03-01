#include "spi.hpp"

Spi::Spi(uint32_t SpiPeriph)
    :mSpiPeriph(SpiPeriph)
{
    
}

void Spi::SpiInit()
{
    spi_init(mSpiPeriph, &SpiParam);
}

void Spi::SpiEnable()
{
    spi_enable(mSpiPeriph);
}
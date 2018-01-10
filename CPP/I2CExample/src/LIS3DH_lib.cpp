
#include <unistd.h>				//Needed for I2C port
#include <sys/ioctl.h>			//Needed for I2C port
#include <linux/i2c-dev.h>		//Needed for I2C port
#include <stdio.h>
#include <stdint.h>

#include "LIS3DH_lib.h"

/*========================================================================*/
/*                            CONSTRUCTORS                                */
/*========================================================================*/

/**************************************************************************/
/*!
    Constructor
*/
/**************************************************************************/
LIS3DH_lib::LIS3DH_lib(void)
{
  _framInitialised = false;
}

/*========================================================================*/
/*                           PUBLIC FUNCTIONS                             */
/*========================================================================*/

/**************************************************************************/
/*!
    Initializes I2C and configures the chip (call this function before
    doing anything else)
*/
/**************************************************************************/
bool LIS3DH_lib::begin(char i2c, uint8_t addr)
{
  if (ioctl(i2c, I2C_SLAVE, addr) < 0)
	{
		printf("Failed to acquire bus access and/or talk to slave.\n");
		//ERROR HANDLING; you can check errno to see what went wrong
		return false;
	} else {
    /* Everything seems to be properly initialised and connected */
    _framInitialised = true;
    return true;
  }
}

/**************************************************************************/
/*!
    @brief  Writes a byte at the specific FRAM address

    @params[in] i2cAddr
                The I2C address of the FRAM memory chip (1010+A2+A1+A0)
    @params[in] framAddr
                The 16-bit address to write to in FRAM memory
    @params[in] i2cAddr
                The 8-bit value to write at framAddr
*/
/**************************************************************************/
void LIS3DH_lib::write8 (char i2c, uint16_t framAddr, uint8_t value){
  uint8_t bufferV[5] = {0};

  if(this->begin(i2c, MB85RC_DEFAULT_ADDRESS)){

    bufferV[0] = (framAddr >> 8);
    bufferV[1] = (framAddr & 0xFF);
    bufferV[2] = value;
    if (write(i2c, bufferV, 3) != 3)	{
      /* ERROR HANDLING: i2c transaction failed */
      printf("Failed to write to the i2c bus.\n");
    }
  }
}

/**************************************************************************/
/*!
    @brief  Reads an 8 bit value from the specified FRAM address

    @params[in] i2cAddr
                The I2C address of the FRAM memory chip (1010+A2+A1+A0)
    @params[in] framAddr
                The 16-bit address to read from in FRAM memory

    @returns    The 8-bit value retrieved at framAddr
*/
/**************************************************************************/

uint8_t LIS3DH_lib::read8  (char i2c, uint16_t framAddr){
  uint8_t bufferV[5] = {0};

  if(this->begin(i2c, MB85RC_DEFAULT_ADDRESS)){

    bufferV[0] = (framAddr >> 8);
    bufferV[1] = (framAddr & 0xFF);

    if (write(i2c, bufferV, 2) != 2)	{
      /* ERROR HANDLING: i2c transaction failed */
      printf("Failed to write to the i2c bus.\n");
    } else {
      read(i2c, bufferV, 1);
      return bufferV[0];
    }
  } else {
    return 0;
  }
}

#include <fcntl.h>				//Needed for I2C port
#include <unistd.h>				//Needed for I2C port
#include <sys/ioctl.h>			//Needed for I2C port
#include <linux/i2c-dev.h>		//Needed for I2C port
#include <stdio.h>
#include <stdint.h>

#include "FRAM_lib.h"
#include "LIS3DH_lib.h"


int file_i2c;

int main(){

  FRAM_lib fram;
  LIS3DH_lib acc;

	//----- OPEN THE I2C BUS -----
	char *filename = (char*)"/dev/i2c-7";

	if ((file_i2c = open(filename, O_RDWR)) < 0)
	{
		printf("Failed to open the i2c bus");
		return 0;
	}


  fram.write8(file_i2c, 0xFFFF, 0xFF);
  fram.read8(file_i2c , 0xFFFF);



  return 0;
}

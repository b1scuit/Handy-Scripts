#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>               //Needed for I2C port
#include <fcntl.h>              //Needed for I2C port
#include <sys/ioctl.h>          //Needed for I2C port
#include <linux/i2c-dev.h>      //Needed for I2C port
#include "i2c.c"
#include "file.c"
#include "data.c"

#define CS 0x00
#define OE 0x00
#define WE 0x00
#define RD 0x00

#define ADDR_DEV 0x20
#define DATA_DEV 0x21

void main(){
    char *binbuffer;
    readFile("a.out", binbuffer);
    dumpBuffer(binbuffer, fileLen);


}

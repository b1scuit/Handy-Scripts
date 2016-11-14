#include <iostream>

using namespace std;

class i2cTalk {
        int address;
        int controller;
        int file;

        int openDevice(int addr);
        int closeDevice();
};

// Member functions 

int i2cTalk::openDevice( int addr ){
        char *filename = "/dev/i2c-2";
        if((file = open(filename, O_RDWR)) < 0){
                perror("Failed to open I2C bus");
                return 0;
        } else {
                cout << "I2C bus open on" . filename;
        }

}

int main(){
        i2cTalk i2c;

	i2c.openDevice();

	return 1;


}


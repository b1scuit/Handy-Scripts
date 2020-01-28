int file_i2c;
//
// I2C management
//
void i2c_openbus() {
    char *filename = (char*)"/dev/i2c-9";
    if ((file_i2c = open(filename, O_RDWR)) < 0)
    {
        //ERROR HANDLING: you can check errno to see what went wrong
        printf("Failed to open the i2c bus");
        return;
    }
}

void i2c_selectDevice(int addr) {
    if (ioctl(file_i2c, I2C_SLAVE, addr) < 0)
    {
        printf("Failed to acquire bus access and/or talk to slave.\n");
        //ERROR HANDLING; you can check errno to see what went wrong
        return;
    }
}

unsigned int i2c_readBytes(int length, unsigned int buffer[]) {
    if (read(file_i2c, buffer, length) != length) {
        //ERROR HANDLING: i2c transaction failed
        printf("Failed to read from the i2c bus.\n");
    }
    else
    {
        printf("Data read: %i\n", *buffer);
    }

    return *buffer;
}

void i2c_writeBytes(int length, unsigned int buffer[]) {
    if (write(file_i2c, buffer, length) != length) {
        /* ERROR HANDLING: i2c transaction failed */
        printf("Failed to write to the i2c bus.\n");
    }
}

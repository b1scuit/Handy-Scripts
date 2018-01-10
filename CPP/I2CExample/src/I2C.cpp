class I2C
{
    public:
        char registerAddr[7];
    private:
        int _I2CADDR;
    I2C(){
       // Constructor
    }

    ~I2C(){
        // Destructor
    }

    /**
     * SetI2CAddr
     *
     * Sets the I2C address to be used by the 
     * device
     *
     * @return int (1 for success, 0 for failure)
     *
     * @param Interger addr The address to be used (default 0x78)
     */
    int setI2cAddr(int addr) {
        if( (_I2CADDR = addr) ){
            return 1;
        } else {
            return 0;
        }
    }
};

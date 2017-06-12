
#ifndef _LIS3DH_lib
#define _LIS3DH_lib

#define MB85RC_DEFAULT_ADDRESS        (0x50) /* 1010 + A2 + A1 + A0 = 0x50 default */
#define MB85RC_SLAVE_ID               (0xF8)

class LIS3DH_lib {
 public:
  LIS3DH_lib(void);

  bool  begin(char i2c,uint8_t addr = MB85RC_DEFAULT_ADDRESS);
  void     write8 (char i2c, uint16_t framAddr, uint8_t value);
  uint8_t  read8  (char i2c, uint16_t framAddr);

 private:
  uint8_t i2c_addr;
  bool _framInitialised;
};

#endif

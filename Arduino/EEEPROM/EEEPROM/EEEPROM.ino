#include "Wire.h"
#include "stdint.h"

// Top level includes for i2c addresses
#define ADDR 0x20
#define DATA 0x21

#define IODIRA 0x00
#define IODIRB 0x01

#define GPIOA 0x12
#define GPIOB 0x13

void setup(){
  Serial.begin(9600);
  Wire.begin();

  // set the address line as an output since that's all we'll do with it
  setAsOutput(ADDR, IODIRA);
  setAsOutput(ADDR, IODIRB);
  setAsOutput(DATA, IODIRB); // Make sure the control bits are all sorted
  
  setAsInput(DATA IODIRA); 

  set16Value(ADDR, 0x0000);
  Serial.Println(getValue(DATA, GPIOA));
}

// IO direction handlers
void setAsOutput(uint8_t devAddr, uint8_t reg) {
  setValue(devAddr, reg, 0x00);
}

void setAsInput(uint8_t devAddr, uint8_t reg) {
  setValue(devAddr, reg, 0xFF);
}

// Value setters
void setValue(uint8_t devAddr, uint8_t port, uint8_t val) {
  Wire.beginTransmission(devAddr);
  Wire.write(port); Wire.write(val);
  Wire.endTransmission();
}

byte getValue(uint8_t devAddr, uint8_t port) {
  Wire.beginTransmission(devAddr);
  Wire.write(port);
  Wire.endTransmission();
  Wire.requestFrom((int) devAddr, 1);

  return Wire.read();
}

void set16Value(uint8_t devAddr, uint16_t val) {
  setValue(devAddr, GPIOA, (val & 0xFF));
  setValue(devAddr, GPIOB, (val >> 8)); 
}

void loop(){
  
  
}

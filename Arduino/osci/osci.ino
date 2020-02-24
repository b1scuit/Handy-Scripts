
char buf[50];

float getAnalogVoltage(int pin) { return analogRead(pin) * (5.0 / 1023.0); }
int isLoginHigh(float voltage, int low, int high) {
  int result = low;
  if (voltage > 2.7 ) result = high;
  return result;
}

void setup(){ Serial.begin(9600); }
void loop(){
  sprintf(
    buf,
    "%d,%d,%d,%d,%d,%d,%d,%d,",
    isLoginHigh(getAnalogVoltage(A0), 0, 1),
    isLoginHigh(getAnalogVoltage(A1), 2, 3),
    isLoginHigh(getAnalogVoltage(A2), 4, 5),
    isLoginHigh(getAnalogVoltage(A3), 6, 7),
    isLoginHigh(getAnalogVoltage(A4), 8, 9),
    isLoginHigh(getAnalogVoltage(A5), 10, 11),
    isLoginHigh(getAnalogVoltage(A6), 12, 13),
    isLoginHigh(getAnalogVoltage(A7), 14, 15));

    Serial.println(buf);
}

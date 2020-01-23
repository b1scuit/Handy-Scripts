
char buf[50];

float getAnalogVoltage(int pin) { return analogRead(pin) * (5.0 / 1023.0); }
int isLoginHigh(float voltage) {
  int result = 0;
  if (voltage > 2.7 ) result = 1;
  return result;
}

void setup(){ Serial.begin(9600); }
void loop(){
  sprintf(
    buf,
    "Channel 1:%d,Channel 2:%d,Channel 3:%d",
    isLoginHigh(getAnalogVoltage(A0)),
    isLoginHigh(getAnalogVoltage(A1)),
    isLoginHigh(getAnalogVoltage(A2)));

    Serial.println(buf);
}

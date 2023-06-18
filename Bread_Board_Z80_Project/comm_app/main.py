import serial

serialPort = serial.Serial(port = "/dev/tty.usbmodem00000356041", baudrate=115200, bytesize=8, timeout=2, stopbits=serial.STOPBITS_ONE)

serialString = ""                           # Used to hold data coming over UART
serialPort.writelines("0x03")
# Wait until there is data waiting in the serial buffer
if(serialPort.in_waiting > 0):
    # Read data out of the buffer until a carraige return / new line is found
    serialString = serialPort.readline()
    # Print the contents of the serial data
    print(serialString.decode('Ascii'))
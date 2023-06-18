
import time
import sys
import serial
import binascii
from time import sleep

# Configure the serial connections (the parameters differs on the device you are connecting to)
ser = serial.Serial(
    port='COM10',
    baudrate=115200,
    parity=serial.PARITY_NONE,
    stopbits=serial.STOPBITS_ONE,
    bytesize=serial.EIGHTBITS,
    timeout= None
)

print("Set up serial commuinication")

ser.isOpen()

print("Finished writing, checking")
address = 0x0000
packet = bytearray([0x02, 0x00,0x00])

if int(sys.argv[1]) > 65535
    print("Out of range value")

while address <= int(sys.argv[1], base=16):
    print(format(address, '#04x'), " ", end = '')
    for j in list(range(16)):
        packet[1] = (address >> 8) & 0xFF
        packet[2] = (address & 0xFF)
        ser.write(packet)
        value = ser.read()
        print("0x" + value.hex(), " ", end = '')
        ser.read()
        address = address +1
    print()


print("All complete")


import time
from time import sleep
import serial
import sys
import binascii

# Configure the serial connections (the parameters differs on the device you are connecting to)
ser = serial.Serial(
    port='COM10',
    baudrate=115200,
    parity=serial.PARITY_NONE,
    stopbits=serial.STOPBITS_ONE,
    bytesize=serial.EIGHTBITS,
    timeout= None
)

# Where our example program is kept for the EEPROM


with open(sys.argv[1], "rb") as binary_file:
    # Read the whole file at once
    program = binary_file.read()
ser.isOpen()

# The data packet to send via serial
# [instruction, high byte, low byte, data byte]
# Send the program to the EEPROM
print("Writing data to EERPROM")
address = 0x0000
packet = bytearray([0x01, 0x00, 0x00, 0x00])
for i in program:
    packet[1] = (address >> 8) & 0xFF
    packet[2] = (address & 0xFF)
    packet[3] = i
    ser.write(packet)
    ser.read() # So we block until the device is ready for another instruction
    address = address + 1

print("Finished writing, checking")
address = 0x0000
packet = bytearray([0x02, 0x00,0x00])
for i in program:
    packet[1] = (address >> 8) & 0xFF
    packet[2] = (address & 0xFF)
    ser.write(packet)
    value = ser.read()
    ser.read()
    if bytes([i]) != value:
        print("Err at addr ", format(address, '#04x'), bytes([i]), " Was suppoed to equal ",value )
    address = address +1


print("All complete")

#include <xc.h>
#include <stdint.h>
#include "mcc_generated_files/mcc.h"

#define ADDRLOW PORTA
#define ADDRHIGH PORTC
#define DATA PORTD
#define WE RE0
#define OE RE1
#define CE RE2


#define CHECKCMD 0x03
#define WRITECMD 0x01
#define READCMD 0x02
#define ACKCMD 0xAC
#define NAKCMD 0x0A

/* 
 * Comms guide
 * 
 * The basic format for a write is 
 * 0x01 0x01 0x00 0xFF will write 0xFF to address 0x0100
 * 
 * The basic format for a read is 
 * 0x02 0x01 0x00 will read whatever byte in address 0x0100
 */
void main(void)
{
    // Initialize the device
    SYSTEM_Initialize();

    // Enable the Global Interrupts
    INTERRUPT_GlobalInterruptEnable();
    // Enable the Peripheral Interrupts
    INTERRUPT_PeripheralInterruptEnable();

    OE = 1; // Enable by default
    WE = 1; // Disable by default 
    CE = 1; // Disable by default

    printf("\rPeter Holt EEEPROM Programmer\r\n");  

    while (1)
    {
        // EUSART_Write(0x01);
        if(eusartRxCount!=0) 
        {
            uint8_t command = 0; // holder for com and
            
            uint8_t addrh = 0;
            uint8_t addrl = 0;
            uint8_t data = 0;
            command = EUSART_Read();  // read a byte for RX
            if (command == WRITECMD) {
                // Set all the control lines to their inital state
                TRISD = 0x00;
                PORTE = 0x07;
                // Read UART into memory 
                addrh = EUSART_Read();
                addrl = EUSART_Read();
                data = EUSART_Read();
                
                ADDRHIGH = addrh;
                ADDRLOW = addrl;
                RB3 = addrl;
                DATA = data;

                CE = 0;
                WE = 0;
                WE = 1;
                CE = 1;

                EUSART_Write(ACKCMD);
            }
            else if (command == READCMD) {
                // Set inital state
                PORTE = 0x07;
                DATA = 0x00;
                TRISD = 0xFF;
                addrh = EUSART_Read();
                addrl = EUSART_Read();
                
                ADDRHIGH = addrh;
                ADDRLOW = addrl;
                RB3 = addrl;

                CE = 0;
                OE = 0;     
                data = DATA;
                OE = 1;
                CE = 1;  
                
                EUSART_Write(data);
                EUSART_Write(ACKCMD);
            }
            else if (command == CHECKCMD) {
                EUSART_Write(CHECKCMD);
                EUSART_Write(ACKCMD);
            }
        }
    }
}
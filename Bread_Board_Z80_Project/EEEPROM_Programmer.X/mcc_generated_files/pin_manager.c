#include "pin_manager.h"

void PIN_MANAGER_Initialize(void)
{
    /**
    LATx registers
    */
    LATE = 0x00;
    LATD = 0x00;
    LATA = 0x00;
    LATB = 0x00;
    LATC = 0x00;

    /**
    TRISx registers
    */
    TRISA = 0x00;
    TRISB = 0xE0;
    TRISC = 0x00;
    TRISD = 0x00;
    TRISE = 0x00;

    /**
    ANSELx registers
    */
    ANSELE = 0x00;
    ANSELD = 0x00;
    ANSELC = 0x00;
    ANSELB = 0xD0;
    ANSELA = 0x00;

    /**
    WPUx registers
    */
    WPUD = 0x00;
    WPUE = 0x00;
    WPUB = 0x00;
    WPUA = 0x00;
    WPUC = 0x00;

    /**
    ODx registers
    */
    ODCONE = 0x00;
    ODCONA = 0x00;
    ODCONB = 0x00;
    ODCONC = 0x00;
    ODCOND = 0x00;

    /**
    SLRCONx registers
    */
    SLRCONA = 0xFF;
    SLRCONB = 0xFF;
    SLRCONC = 0xFF;
    SLRCOND = 0xFF;
    SLRCONE = 0x07;

    /**
    INLVLx registers
    */
    INLVLA = 0x00;
    INLVLB = 0xF9;
    INLVLC = 0x00;
    INLVLD = 0x00;
    INLVLE = 0x0F;
	
    RXPPS = 0x0D;   //RB5->EUSART:RX;    
    RB4PPS = 0x10;   //RB4->EUSART:TX;    
}
  
void PIN_MANAGER_IOC(void)
{   
}
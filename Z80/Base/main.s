LCD = 1H
LED = 2H

 .org 0x8000

startScreen:
 ld c, LCD
 ld a, 0x01
 out (c), a
 ret

outputLetter:
 ld c, 0x97
 ld a, 0x01
 out (c), a
 jp outputLetter
Main:
 call startScreen

 call outputLetter

 .org 0xfffe
 .word 0x0000 ; Just make sure there is a full EEPROM

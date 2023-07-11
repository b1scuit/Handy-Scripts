LED_ADDR    .EQU $0000
LED_INIT    .EQU $02; INIT 4-bit mode
LED_4BIT    .EQU $28; Initialization of 16X2 LCD in 4bit mode
LED_ENABLE  .EQU $0C; Enable Display, Disable Cursor
LED_INCCUR  .EQU $06; Auto Increment cursor
LED_CLRDIS  .EQU $01; Clear Display
LED_CURHOM  .EQU $80; Cursor at home position

    .ORG $0000
RST00:
    DI
    JP INIT

    .ORG $0040 ; Safe place to start
INIT:
    LD HL,$80ED
    LD SP,HL
    LD B,LED_INIT
    CALL SENDCMD
    LD B,LED_4BIT
    CALL SENDCMD
    LD B,LED_ENABLE
    CALL SENDCMD
    LD B,LED_INCCUR
    CALL SENDCMD
    LD B,LED_CLRDIS
    CALL SENDCMD
    LD B,LED_CURHOM
    CALL SENDCMD

SENDCMD:
    PUSH AF
    ; Send Upper nibble (4 bytes first)
    LD A,B
    RRA
    RRA
    RRA
    RRA
    ADD $80 ; Turn on command register
    OUT (LED_ADDR), A ; Send command to LCD screen
    NOP
    ; Send Lower Mibble (4 bytes last)
    LD A,B
    ADD $80 ; Turn on command register
    OUT (LED_ADDR), A
    POP AF
    RET
SENDDATA:
    PUSH AF
    ; Send Upper nibble (4 bytes first)
    LD A,B
    RRA
    RRA
    RRA
    RRA
    OUT (LED_ADDR), A ; Send command to LCD screen
    NOP
    ; Send Lower Mibble (4 bytes last)
    LD A,B
    RLA ; Rotate left then right to knock the 8th bit as 0
    RRA
    POP AF
    RET


LED_ADDR    .EQU $0000
LED_INIT    .EQU $14; Function Set
LED_ENABLE  .EQU $0F; Display ON/Off
LED_INCCUR  .EQU $07; Entry Mode eset
LED_CLRDIS  .EQU $01; Clear Display
LED_CURHOM  .EQU $02; Return home

    .ORG $0000
RST00:
    DI
    JP INIT

    .ORG $0040 ; Safe place to start
INIT:
    LD HL,$80ED
    LD SP,HL
    LD A,LED_INIT
    CALL SENDCMD
    LD A,LED_ENABLE
    CALL SENDCMD
    LD A,LED_INCCUR
    CALL SENDCMD
    LD A,LED_CLRDIS
    CALL SENDCMD
    LD A,LED_CURHOM
    CALL SENDCMD

    LD   HL,INTRO
    LD   B,(HL)
LOOP:
    INC  HL
    LD   A,(HL)
    CALL SENDDATA
    DJNZ LOOP
END:
    HALT

SENDCMD:
    PUSH AF
    ; Send Upper nibble (4 bytes first)
    RRA
    RRA
    RRA
    RRA
    RES 7,A
    OUT (LED_ADDR), A ; Send command to LCD screen
    NOP
    ; Send Lower Mibble (4 bytes last)
    POP AF
    RLA ; Rotate left then right to knock the 8th bit as 0
    RRA
    RES 7,A
    OUT (LED_ADDR), A
    RET
SENDDATA:
    PUSH AF
    ; Send Upper nibble (4 bytes first)
    RRA
    RRA
    RRA
    RRA
    SET 7, A
    OUT (LED_ADDR), A ; Send command to LCD screen
    NOP
    ; Send Lower Mibble (4 bytes last)
    POP AF
    RLA ; Rotate left then right to knock the 8th bit as 0
    RRA
    SET 7, A
    OUT (LED_ADDR), A ; Send command to LCD screen
    RET

INTRO: .BYTE  16,"Hello Z80 World!"
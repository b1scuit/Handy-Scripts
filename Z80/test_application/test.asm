LED_ADDR        .EQU $0000
LED_INIT        .EQU $14; Function Set
LED_ENABLE      .EQU $0F; Display ON/Off
LED_INCCUR      .EQU $07; Entry Mode eset
LED_CLRDIS      .EQU $01; Clear Display
LED_CURHOM      .EQU $02; Return home
LED_DISPLAY_OFF .EQU $08
LED_INIT_

    .ORG $0000
RST00:
    DI
    JP INIT

    .ORG $0040 ; Safe place to start
INIT:
    LD HL,$80ED ; Sort out the stack pointer
    LD SP,HL

; ; For some reason we have to send $30 x3 times
; LD A,$30
; CALL SENDCMD
; LD A,$30
; CALL SENDCMD
; LD A,$30
; CALL SENDCMD
; LD A,$20
; CALL SENDCMD
; LD A, $28
; CALL SENDCMD

; LD A, LED_DISPLAY_OFF
; CALL SENDCMD

; LD A, LED_CLRDIS
; CALL SENDCMD

; LD A,$06
; CALL SENDCMD
; LD A,$02
; CALL SENDCMD

; LD A,$0F
; CALL SENDCMD

    LD A,$02
    LD A,$28
    LD A,$0E
    LD A,LED_INCCUR
    LD A,LED_CLRDIS
    LD A,$80

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
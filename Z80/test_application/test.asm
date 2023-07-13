led_addr        .equ $0000
led_init        .equ $14; Function Set
led_enable      .equ $0f; Display ON/OFF
led_inccur      .equ $07; Entry Mode eset
led_clrdis      .equ $01; Clear Display
led_curhom      .equ $02; Return home
led_display_off .equ $08

    .org $0000
rst00:
    di
    jp init

    .org $0040 ; Safe place to start
init:
    ld hl,$80ed ; Sort out the stack pointer
    ld sp,hl

    ; For some reason we have to send $30 x3 times
    ld a,$30
    call sendcmd
    ld a,$30
    call sendcmd
    ld a,$30
    call sendcmd
    ld a,$20
    call sendcmd
    ld a, $28
    call sendcmd

    ld a, led_display_off
    call sendcmd

    ld a, led_clrdis
    call sendcmd

    ld a,$06
    call sendcmd
    ld a,$02
    call sendcmd

    ld a,$0f
    call sendcmd

    ld   hl,intro
    ld   b,(hl)
loop:
    inc  hl
    ld   a,(hl)
    call senddata
    djnz loop
end:
    halt

sendcmd:
    push af
    ; Send Upper nibble (4 bytes first)
    rra
    rra
    rra
    rra
    res 7,a
    out (led_addr), a ; Send command to LCD screen
    nop
    ; Send Lower Mibble (4 bytes last)
    pop af
    rla ; Rotate left then right to knock the 8th bit as 0
    rra
    res 7,a
    out (led_addr), a
    ret
senddata:
    push af
    ; Send Upper nibble (4 bytes first)
    rra
    rra
    rra
    rra
    set 7, a
    out (led_addr), a ; Send command to LCD screen
    nop
    ; Send Lower Mibble (4 bytes last)
    pop af
    rla ; Rotate left then right to knock the 8th bit as 0
    rra
    set 7, a
    out (led_addr), a ; Send command to LCD screen
    ret

intro: .byte  16,"Hello Z80 World!"
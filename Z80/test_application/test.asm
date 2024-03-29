led_addr        .equ $0000

led_clrdis      .equ $01; Clear Display     0 0 0 0 0 0 0 1
led_curhom      .equ $02; Return home       0 0 0 0 0 0 1 0
led_inccur      .equ $07; Entry Mode Set    0 0 0 0 0 1 I S
led_enable      .equ $0f; Display ON/OFF:   0 0 0 0 1 D C B 
led_cur         .equ $10; Cursor or Display 0 0 0 1 C D - -
led_init        .equ $14; Function Set:     0 0 1 DL N F- -
led_set_cgram   .equ $40; Set CGRam addr    0 1 X X X X X X
led_set_ddram   .equ $80; Set DDRam addr    1 B X X X X X X

    .org $0000
rst00:
    di
    jp init

    .org $0040 ; Safe place to start
init:
    ld hl,$80ed ; Sort out the stack pointer
    ld sp,hl

    call init_2400h

start_msg:
    ld   hl,intro
    ld   b,intro_len
loop:
    ld   a,(hl)
    call senddata
    inc  hl
    djnz loop

    jr start_msg; Restart
init_2400h:
    ld a, led_init
    call sendcmd
    ld a,led_enable
    call sendcmd
    ld a, led_clrdis
    call sendcmd
    ld a, led_curhom
    call sendcmd
    ret

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
    set 7, a
    out (led_addr), a ; Send command to LCD screen
    ret

intro:      .db  "Hello Z80 World! "
intro_len   .equ $ - intro
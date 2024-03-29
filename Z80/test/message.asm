    device	zxspectrum48
    
    org $8000

    jr start

ENTER = $0D
UPPER_A = $41
UPPER_Z = $5A
LOWER_A = $61
LOWER_Z = $7A

messsage:
    db "Hello world!",ENTER

MSG_LEN = $ - messsage

start:
    ld hl,messsage
    ld b,MSG_LEN
orig_loop: 
    ld a,(hl)
    rst $10
    inc hl
    djnz orig_loop

    ld hl,messsage
    ld a,(hl)
lower_loop:
    cp UPPER_A
    jr c,print_lower_char
    cp UPPER_Z+1
    call c,tolower
print_lower_char:
    rst $10
    inc hl
    ld a,(hl)
    cp ENTER
    jr nz, lower_loop
    rst $10

    ld hl, messsage
    ld b,MSG_LEN
upper_loop:
    ld a,(hl)
    call toupper
    rst $10
    inc hl
    djnz upper_loop

    ret
tolower:
    add $20
    ret

toupper:
    cp LOWER_A
    ret c
    cp LOWER_Z+1
    ret nc
    sub $20
    ret

    savesna "message.sna",start
    device	zxspectrum48
    org $8000

    jp start

SCREEN_BITMAP = $4000
BITMAP_SIZE = $1800
SCREEN_COLOUR = $5800
COLOUR_SIZE = $0300

sp_backup:
    dw 0

start:
    exx
    push hl

    ; make sopme stripes
    ld hl, SCREEN_BITMAP
    ld de,$FF00
    ld bc,BITMAP_SIZE/2
    call fill_ram

    pop hl
    exx ; restire hl' to return to basic
    ret

fill_ram:
    ld (sp_backup),sp
    add hl, bc
    add hl, bc
    ld sp,hl
    ld a,$FF
.loop:
    push de
    dec c
    jp nz,.loop
    ld sp,(sp_backup) ; restore stack pointer
    ret

    savesna "stack.sna",start
    
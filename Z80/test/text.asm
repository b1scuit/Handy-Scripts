    device	zxspectrum48

    org $8000
    jr start

string:
    db "hello"

STRING_LEN = 5
ROM_CLS = $0DAF
COLOUR_ATTR = $5800
ENTER = $0D
BLACK_WHITE = $47

start:
    im 1
    call ROM_CLS
    ld  hl,string
    ld  b,STRING_LEN
loop:
    ld a,(hl)
    rst $10
    inc hl
    dec b
    jr nz,loop
    ld a,ENTER
    rst $10

    ld a,BLACK_WHITE
    ld (COLOUR_ATTR), a

    ld ix,string
    res 5,(ix)
    ld a,(ix)
    rst $10
    ld a,(ix+1)
    rst $10
    ld a,(ix+2)
    rst $10
    ld a,(ix+3)
    rst $10
    ld a,(ix+4)
    rst $10
    ld a,ENTER
    rst $10

    ret


    savesna "lines.sna",start
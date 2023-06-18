    device	zxspectrum48
    org $8000

start:
    ld a,%11001100
    ld de,$4000
    ld (de),a
    ex de,hl
    ld de,$4001
    ld bc,$200
bitmap_loop:
    ldi
    ld a,b
    or c
    jr nz,bitmap_loop
    srl (hl)
    ld bc,$200
    ldir
    srl (hl)
    ld de,$45FF
    ldd
    ld bc,$1fe
    ld hl,$45FF
    lddr
    ld hl,$4600
    ld (hl),%10011001
    ld de,$4601
    ld bc,$1FF
    exx
    ld hl,$5800
    ld (hl),$41
    ld de,$5801
    ld bc,$FF
color_loop:
    ldi
    inc (hl)
    ld a,$07
    and (hl)
    jr nz,next
    ld (hl),$41
next:
    ld a, b
    or c
    jr nz,color_loop
    exx
    ldir
    ret

    savesna "lines.sna",start
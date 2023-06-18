    device	zxspectrum48

    org $8000
start:
    ld a,$d6
    ld ($5800),a
    ret

    savesna "load.sna",start
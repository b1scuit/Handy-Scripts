all: a.out

a.out:
	vasm -dotdir -Fbin -I ./ ./int.asm

.PHONY: view
view:
	hexdump -C a.out
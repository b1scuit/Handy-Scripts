all: a.out

a.out:
	vasm -Fbin -dotdir test.asm

.PHONY: view
view:
	hexdump -C a.out
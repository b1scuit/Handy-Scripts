all: load.sna text.sna lines.sna message.sna

lines.sna:
	sjasmplus --lst ./test/lines.asm
load.sna:
	sjasmplus --lst ./test/load.asm
text.sna:
	sjasmplus --lst ./test/text.asm
message.sna:
	sjasmplus --lst ./test/message.asm
stack.sna:
	sjasmplus --lst ./test/stack.asm

zsim/example.sna:
	sjasmplus --lst ./zsim/example.asm
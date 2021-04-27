all: kernel

kernel: kasm.o kc.o
	ld -m elf_i386 -T link.ld -o kernel kasm.o kasm.c
	mv kernel kernel-701

kasm.o: kernel.asm
	nasm -f elf32 kernel.asm -o kasm.o

kc.o: kernel.c
	gcc -m32 -c kernel.c -o kc.o

install:
	cp kernel-701 /boot/kernel-701

uninstall:
	rm -f /boot/kernel-701

clean:
	rm -f kasm.o kc.o kernel-701

kernel: kasm.o kc.o
	ld -m elf_i386 -T link.ld -o kernel kasm.o kc.o
kasm.o: kernel.asm
	nasm -f elf32 kernel.asm -o kasm.o
kc.o: kernel.c
	gcc -m32 -c kernel.c -o kc.o
test:
	qemu-system-i386 -kernel kernel
clean: kasm.o kc.o kernel
	rm kasm.o kc.o kernel
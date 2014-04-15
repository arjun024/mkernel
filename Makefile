#
#	Makefile for mkernel
#	

CC = gcc			# compiler to use
CFLAGS = -m32

NASM = nasm
NASMFLAGS = -f elf32

LINKER = ld
LINKERFLAGS = -m elf_i386

BINARY = kernel
OBJS =	kasm.o kc.o 

.PHONY = all clean list

all:	${OBJS}
	@echo "Building..."		# to print Building msg
	${LINKER} ${LINKERFLAG} -T link.ld -o ${BINARY} ${OBJS}

kasm.o: *.asm
	${NASM} ${NASMFLAGS} $< -o $@

kc.o:	*.c
	${CC} ${CFLAGS} -c $< -o $@

clean:
	@echo "Cleaning up..."
	-rm -rvf *~ \#* *.o ${BINARY}

mkernel
=======

This is a trivial kernel which prints "my first kernel" on the screen and then hangs.

* The kernel is Multiboot compliant and loads with GRUB.


![kernel screenshot](http://files.arjunsreedharan.org/images/mkernel.png "Screenshot")

####Blog post####

Kernel 101 – Let’s write a Kernel

(http://arjunsreedharan.org/post/82710718100/kernel-101-lets-write-a-kernel)

####Build commands####
```
nasm -f elf32 kernel.asm -o kasm.o
```
```
gcc -m32 -c kernel.c -o kc.o
```
```
ld -m elf_i386 -T link.ld -o kernel kasm.o kc.o
```


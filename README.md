mkernel
=======

This is a minimalist kernel which prints "`my first kernel`" on the screen and then hangs.

* The kernel is multi-boot compliant and loads with GRUB.


#### Blog post ####

[Kernel 101 – Let’s write a Kernel](http://arjunsreedharan.org/post/82710718100/kernel-101-lets-write-a-kernel)

#### Use Makefile ####
A premade Makefile is included

Use `make` to compile, assemble, and link the kernel easily and automatically.
Use `make test` to test the kernel in QEMU.
Use `make clean` to automatically remove outfiles and binaries.

Or, see below to compile, assemble, and link the kernel yourself.

#### Build commands ####
```
nasm -f elf32 kernel.asm -o kasm.o
```
```
gcc -m32 -c kernel.c -o kc.o
```
```
ld -m elf_i386 -T link.ld -o kernel kasm.o kc.o
```

#### Test on emulator ####
```
qemu-system-i386 -kernel kernel
```

#### Get to boot ####
GRUB requires your kernel executable to be of the pattern `kernel-<version>`.

So, rename the kernel:

```
mv kernel kernel-701
```

Copy it to your boot partition (assuming you are superuser):

```
cp kernel-701 /boot/kernel-701
```

Configure your grub/grub2 similar to what is given in `_grub_grub2_config` folder.

Reboot.

Voila!

![kernel screenshot](http://static.tumblr.com/gltvynn/yOdn443dr/mkernel.png "Screenshot")

#### The next step ####
See [mkeykernel repo](github.com/arjun024/mkeykernel)
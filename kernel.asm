; Copyright (C) 2014  Arjun Sreedharan
; License: GPL version 2 or higher http://www.gnu.org/licenses/gpl.html

bits 32
section .data
        ;multiboot spec
        align 4
        dd 0x1BADB002              	;magic
        dd 0x00                    	;flags
        dd - (0x1BADB002 + 0x00)   	;checksum. m+f+c should be zero
section .text
global start
extern kmain 				;this is defined in the c file

start:
	cli 				;block interrupts
	mov esp, stack_space		;set stack pointer
	call kmain
	hlt 				;halt the CPU

section .bss
resb 8192				;8KB for stack
stack_space:

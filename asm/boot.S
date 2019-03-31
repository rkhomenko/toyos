/* boot.S - загрузчик ядра */

#include "multiboot2/constants.h"

.section .multiboot
.align 4
multiboot2_header:
.long MULTIBOOT2_HEADER_MAGIC
.long MULTIBOOT2_ARCHITECTURE_I386
.long multiboot2_header_end - multiboot2_header
.long -(MULTIBOOT2_HEADER_MAGIC + MULTIBOOT2_ARCHITECTURE_I386 + (multiboot2_header_end - multiboot2_header))
multiboot2_header_end:

.section .bss
.align 16
stack_bottom:
.skip 16384 # 16KiB
stack_top:

.section .text
.global _start
.type _start, @function
_start:
    movl    $stack_top, %esp
    
    pushl $0 
    popf
     
    pushl   %ebx
    pushl   %eax
    
    call main 
loop:   hlt
    movl $0x07690748,0xb8000
    jmp     loop

.size _start, . - _start

/* boot.S - загрузчик ядра */

.set STACK_SIZE, 0x4000
.set MULTIBOOT2_HEADER_MAGIC, 0xe85250d6
.set MULTIBOOT2_ARCHITECTURE_I386, 0
.set MULTIBOOT2_HEADER_TAG_FRAMEBUFFER, 5
.set MULTIBOOT2_HEADER_TAG_OPTIONAL, 1
.set MULTIBOOT2_HEADER_TAG_END, 0

.text
.global start, _start

start:
_start:
    jmp multiboot_entry

    .align 8

multiboot_header:
    .long MULTIBOOT2_HEADER_MAGIC
    .long MULTIBOOT2_ARCHITECTURE_I386
    .long multiboot_header_end - multiboot_header
    .long -(MULTIBOOT2_HEADER_MAGIC + MULTIBOOT2_ARCHITECTURE_I386 + (multiboot_header_end - multiboot_header))
framebuffer_tag_start:
    .short MULTIBOOT2_HEADER_TAG_FRAMEBUFFER
    .short MULTIBOOT2_HEADER_TAG_OPTIONAL
    .long framebuffer_tag_end - framebuffer_tag_start
    .long 1024
    .long 768
    .long 32
framebuffer_tag_end:
    .short MULTIBOOT2_HEADER_TAG_END
    .short 0
    .long 8
multiboot_header_end:
multiboot_entry:
    movl    $(stack + STACK_SIZE), %esp
     
    pushl   $0
    popf
     
    pushl   %ebx
    pushl   %eax
    
    call main 
loop:   hlt
    jmp     loop

.comm stack, STACK_SIZE

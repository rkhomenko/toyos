#include "io.h"

/* Отключаем прерывания */
static void disable_interrupts(void) {
    asm volatile("cli");
    outb(0x80, 0x70); /* Отключаем NMI */
    io_delay();
}


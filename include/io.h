#ifndef TOYOS_X86_IO_H_
#define TOYOS_X86_IO_H_

#include "common/types.h"

#define CREATE_IO(bwl, bw, type) \
static inline void out##bwl(type value, int port) { \
    asm volatile("out" #bwl " %" #bw "0, %w1" : : "a"(value), "Nd"(port)); \
} \
\
static inline type in##bwl(int port) { \
    type value; \
    asm volatile("in" #bwl " %w1, %" #bw "0" : "=a"(value) : "Nd"(port)); \
    return value; \
}

static inline void io_delay(void) {
    const u16 DELAY_PORT = 0x80;
    asm volatile("outb %%al,%0" : : "Nd"(DELAY_PORT));
}

CREATE_IO(b, b, u8)
CREATE_IO(w, w, u16)
CREATE_IO(l, , u32)

#undef CREATE_IO

#endif /* TOYOS_X86_IO_H_ */

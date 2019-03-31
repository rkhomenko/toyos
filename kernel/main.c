#include "multiboot2/header.h"

void main(struct multiboot2_header* mboot, u32 magic) {
    if (magic != MULTIBOOT2_HEADER_MAGIC) {
        return;
    }
}


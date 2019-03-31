#ifndef TOYOS_MULTIBOOT2_HEADER_H_
#define TOYOS_MULTIBOOT2_HEADER_H_

#include "constants.h"

#include "../common/types.h"

struct multiboot2_header {
    u32 magic;
    u32 architecture;
    u32 header_lenght;
    u32 checksum;
};

#endif /* TOYOS_MULTIBOOT2_HEADER_H_ */

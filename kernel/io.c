#include "io.h"
#include "gdt.h"
#include "asm.h"
/* #include <inttypes.h> */

void putc(char c, char attr) {
    set_es(0x20);
    /* int data = (c << 8) | attr; */
    write_mem_es(0x0,  (0x30 << 8) | 'a');
}

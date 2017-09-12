#include "gdt.h"

static segment_descriptor segments[GDT_SIZE];

gdt_t gdt = {
    .base = segments,
    .size = (DESCRIPTOR_SIZE * GDT_SIZE) - 1,
    .free_id = 0
};

/* Add a new descriptor into GDT. Currently scanning for the entire table to retrieve the current max PID 
 * to obtain the next PID. This must be optimized later, with randomization for O(1) performance.
 */
uint16_t add_segment(descriptor_table* t, uint32_t base, uint32_t limit, uint32_t access, uint16_t id, uint8_t auto_id) {
    segment_descriptor *s;

    if (auto_id) {
        if (t->free_id > GDT_SIZE)
            t->free_id = 1;
    }
    else
        t->free_id = id;

    do {
        s = get_segment(t, t->free_id);

        if (auto_id)
            t->free_id++;
        else
            break;

        if (null_segment_p(s)) break;
    } while (t->free_id < GDT_SIZE);

    s->first = SEG_BASE_0_15(base) | SEG_LIMIT_0_15(limit);
    s->second = SEG_BASE_24_31(base) | access | SEG_BASE_16_23(base);

    return auto_id ?  (t->free_id - 1) : id;
}

inline int8_t null_segment_p(segment_descriptor* s) {
    return (s->raw == 0);
}

segment_descriptor* get_segment(descriptor_table *table , uint16_t index) {
    if (index >= GDT_SIZE) return 0;

    return &table->base[index];
}

void setup_gdt(struct tss* init_tss) {
  gdt_add_segment(0x0, 0x0 , 0x0);

  gdt_add_segment(0x0000, 0xFFFF,
                  SEG4K | SEG32 | SEG64_0 | SEG_LIMIT_16_19(0xf) |
                  SEG_PRESENT | SEG_RING0 | SEG_CODE_DATA | SEG_XR);

  gdt_add_segment(0x0000, 0xFFFF,
                  SEG4K | SEG32 | SEG64_0 | SEG_LIMIT_16_19(0xf) |
                  SEG_PRESENT | SEG_RING0 | SEG_CODE_DATA | SEG_RWE);

  gdt_add_segment((uintptr_t) init_tss, 0x067,
                  SEG1B | SEG_AVAILABLE_1 | SEG_LIMIT_16_19(0x0) |
                  SEG_PRESENT | SEG_RING0 | SEG_SYSTEM | SEG_TSS32_AVAILABLE);

  gdt_add_segment(0xB8000, 0x7FFF,
                  SEG4K | SEG32 | SEG64_0 | SEG_LIMIT_16_19(0xf) |
                  SEG_PRESENT | SEG_RING0 | SEG_CODE_DATA | SEG_RW);

  gdt_add_segment((uintptr_t) &segments, GDT_SIZE,
                  SEG4K | SEG32 | SEG64_0 | SEG_LIMIT_16_19(0xf) |
                  SEG_PRESENT | SEG_RING0 | SEG_CODE_DATA | SEG_RW);

  /* for (int i = 5; i < GDT_SIZE; ++i) */
  /*     segments[i].raw = 0; */

  /* gdt_add_segment((uintptr_t) &task1_tss, 0x0100, */
  /*                 SEG1B | SEG16 | SEG64_0  | SEG_LIMIT_16_19(0x0) | */
  /*                 SEG_PRESENT | SEG_RING0 | SEG_SYSTEM | SEG_TSS32_AVAILABLE); */

  lgdt(gdt);
  ltr(0x3 << 3);
}

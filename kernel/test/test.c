#include "greatest.h"
#include "gdt.h"
#include "irq.h"

/* A test runs various assertions, then calls PASS(), FAIL(), or SKIP(). */
TEST test_bit_mask(void) {
    ASSERT_EQ(bit_mask(0,0), 0x1);
    ASSERT_EQ(bit_mask(0,1), 0x3);
    ASSERT_EQ(bit_mask(1,3), 0xE);
    ASSERT_EQ(bit_mask(4,7), 0xF0);
    ASSERT_EQ(bit_mask(8,15), 0xFF00);

    PASS();
}

TEST test_bit_value(void) {
    ASSERT_EQ(0x1, bit_value(0x1,0, 1));
    ASSERT_EQ(0x7, bit_value(0xFF,1,3));
    ASSERT_EQ_FMT(0xF, bit_value(0xFF, 4,7), "%d");
    ASSERT_EQ_FMT(0xF, bit_value(0xFF, 4,7), "%d");
    ASSERT_EQ(0xFF, bit_value(0xFFFF,8,15));
    ASSERT_EQ_FMT(0x1, bit_value(0x10000,16,23), "%x");
    ASSERT_EQ(0xFFFF, bit_value(0xFFFFFFFF,16,31));
    /* ASSERT_EQ(bit_value(8,15), 0xFF00); */
    PASS();
}

TEST test_create_segments(void) {
    /*
      dw 0FFFFh				; limit low
      dw 0x500				; base low
      db 0x00					; base middle
      db 10011010b			; access
      db 11001111b			; granularity
      db 0x0				; base high
    */
    /* ASSERT_EQ(0x00CF9A000500FFFF, seg(0xFFFF, 0x0500, 0x00, 0x0A, 1, 0x00, 1, 0xF, 0, 0, 1, 1, 0x0000)); */
    segment_descriptor s, s1, s2;
    uint32_t g = SEG4K | SEG32 | SEG64_0 | SEG_LIMIT_16_19(0xf);
    uint32_t t = SEG_PRESENT | SEG_RING0 | SEG_CODE_DATA | SEG_XR;

    add_segment(&gdt, 0x1FFFF, 0xFFFF, g | t, 0x0, 0x1);
    ASSERT_EQ_FMT(0xFFFFFFFF, get_segment(&gdt, 1)->first, "%lx");
    ASSERT_EQ_FMT(0x00CF9A01, get_segment(&gdt, 1)->second, "%lx");

    add_segment(&gdt, 0x0, 0xFFFF,
                SEG4K | SEG32 | SEG64_0 | SEG_LIMIT_16_19(0xf) |
                SEG_PRESENT | SEG_RING0 | SEG_CODE_DATA | SEG_RW, 0x0, 0x1);
    ASSERT_EQ_FMT(0x0000FFFF, get_segment(&gdt, 2)->first, "%lx");
    ASSERT_EQ_FMT(0x00CF9200, get_segment(&gdt, 2)->second, "%lx");

    uint32_t tid = idt_add_gate(0x28, 0x0000, 8);
    ASSERT_EQ_FMT(0x00280000, get_segment(&idt, 8)->first, "%lx");
    printf("tid: %x\n", tid);

    /* seg(s2, 0x200FF, 0x00FF, g, t); */
    /* ASSERT_EQ_FMT(0x00FF00FF, s2.first, "%lx"); */
    /* ASSERT_EQ_FMT(0x00CF9A02, s2.second, "%lx"); */

    /* segment_descriptor task1; */
    /* seg(task1, 0x2500, 0x0100, */
    /*     SEG4K | SEG16 | SEG64_0  | SEG_LIMIT_16_19(0xf), */
    /*     SEG_PRESENT | SEG_RING0 | SEG_SYSTEM | SEG_TSS32_AVAILABLE); */
    /* ASSERT_EQ_FMT(0x25000100, task1.first, "%lx"); */
    /* ASSERT_EQ_FMT(0x008F8900, task1.second, "%lx"); */

    /* seg(s1, 0xFFFF, 0x0000,  0x00, SEG_EXE_RW, SEG_CODE_DATA, DPL_RING0, SEG_PRESENT, 0xF, 0, SEG_IA32, SEG32, SEG4K, 0x00); */
    /* ASSERT_EQ(0x00CF92000000FFFF, s1.raw); */

    PASS();
}

/* Suites can group multiple tests with common setup. */
SUITE(gdt_suite) {
    RUN_TEST(test_bit_mask);
    RUN_TEST(test_bit_value);
    RUN_TEST(test_create_segments);
}

/*  definitions that need to be in the test runner's main file. */
GREATEST_MAIN_DEFS();

int main(int argc, char **argv) {
    GREATEST_MAIN_BEGIN();      /* command-line arguments, initialization. */

    /* Individual tests can be run directly. */
    /* RUN_TEST(x_should_equal_1); */

    /* Tests can also be gathered into test suites. */
    RUN_SUITE(gdt_suite);

    GREATEST_MAIN_END();        /* display results */
}

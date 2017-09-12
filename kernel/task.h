#include "gdt.h"
#include "asm.h"
#include <inttypes.h>

#pragma once

/* Task State Structure records the machine state of a process */
struct tss {
    uint16_t link_r;
    uint16_t link_h;
    uint32_t esp0;
    uint16_t ss0_r;
    uint16_t ss0_h;
    uint32_t esp1;
    uint16_t ss1_r;
    uint16_t ss1_h;
    uint32_t esp2;
    uint16_t ss2_r;
    uint16_t ss2_h;
    uint32_t cr3;
    uint32_t eip;
    uint32_t eflags;
    uint32_t eax;
    uint32_t ecx;
    uint32_t edx;
    uint32_t ebx;
    uint32_t esp;
    uint32_t ebp;
    uint32_t esi;
    uint32_t edi;
    uint16_t es_r;
    uint16_t es_h;
    uint16_t cs_r;
    uint16_t cs_h;
    uint16_t ss_r;
    uint16_t ss_h;
    uint16_t ds_r;
    uint16_t ds_h;
    uint16_t fs_r;
    uint16_t fs_h;
    uint16_t gs_r;
    uint16_t gs_h;
    uint16_t ldt_r;
    uint16_t ldt_h;
    uint16_t trap_r;
    uint16_t io_base;
};

extern struct tss init_tss;

/* Add a descriptor entry to the Local Descriptor Table of a process */
#define ldt_add_segment(name, base, limit, access)  \
    add_segment(name, base, limit, access, 0x0, 1)

/* Statically allocate a task/process image right inside the kernel */
#define TASK_REGISTER(name)                     \
    void name ## _start();                      \
    void name ## _init();                       \
    extern uint16_t task_id_##name              \

/* Shift 3 bits to put the task selector value in the variable into the proper location in the Task Register */
#define TASK_SELECTOR(name) (task_id_##name << 3)

/* 0x35000 is the currently chosen starting address for process storage. */
#define TASK_DATA_ADDRESS(id) 0x35000 + id * 0x1000

/* 
 * Generate init data and functions for every registered process (using TASK_REGISTER above) 
 * Currently, the kernel records the start and end of a process code segment by wrapping the code around the 2 calls:
 * TAKS_START() and TASK_END(). Here is how to use the 2 macros accurately:
 *
 *      TASK_START(task_name, init_func)
 *      ..... task code .....
 *      TASK_END()
 *      
 * - TASK_START marks the start of a code segment and TASK_END marks the end. The code length is calculated 
 * from the difference between the two points.
 *
 * For example usage, see irq.c.
 */
#define TASK_START(name, init_func)                                     \
    void __TASK_END_##name();                                           \
    void __TASK_START_##name(){}                                        \
                                                                        \
    segment_descriptor name##_ldt_segments[3];                          \
    ldt_t ldt_##name;                                                   \
    uint16_t task_id_##name;                                            \
    struct tss name##_tss = {                                           \
        .link_r = 0x3 << 3,                                             \
            .ss0_r = DATA_SELECTOR,                                     \
            .eip = (uintptr_t) init_func,                               \
            .esp = 0x3000,                                              \
            .eflags = 0x87,                                             \
            .cr3 = 0x2000,                                              \
            .es_r = VIDEO_SELECTOR,                                     \
            .cs_r = CODE_SELECTOR,                                      \
            .ds_r = DATA_SELECTOR,                                      \
            .ss_r = DATA_SELECTOR,                                      \
            .fs_r = DATA_SELECTOR,                                      \
            .gs_r = DATA_SELECTOR,                                      \
            };                                                          \
                                                                        \
    void name##_init() {                                                \
        uint16_t ldt_id;                                                \
        ldt_##name.base = name##_ldt_segments;                          \
        ldt_##name.size = DESCRIPTOR_SIZE * 3;                          \
        ldt_##name.free_id = 0;                                         \
                                                                        \
        task_id_##name = gdt_add_segment((uintptr_t) &name##_tss, 0x067, \ 
                                         SEG1B | SEG_AVAILABLE_1 | SEG_LIMIT_16_19(0x0) | \
                                         SEG_PRESENT | SEG_RING0 | SEG_SYSTEM | SEG_TSS32_AVAILABLE); \
        ldt_id = gdt_add_segment((uintptr_t) &name##_ldt_segments, ldt_##name.size, \
                                 SEG1B | SEG32 | SEG64_0  | SEG_LIMIT_16_19(0x0) | \
                                 SEG_PRESENT | SEG_RING0 | SEG_SYSTEM | SEG_LDT); \
                                                                        \
        name##_tss.esp0 = TASK_DATA_ADDRESS(task_id_##name);            \
        name##_tss.esp = TASK_DATA_ADDRESS(task_id_##name);             \
        name##_tss.ldt_r = ldt_id << 3;                                 \
                                                                        \
        ldt_add_segment(&ldt_##name, 0, 0, 0);                          \
        ldt_add_segment(&ldt_##name, (uintptr_t) __TASK_START_##name,   \
                        __TASK_END_##name - __TASK_START_##name,        \
                        SEG4K | SEG_AVAILABLE_1 | SEG32 | SEG64_0 |     \
                        SEG_LIMIT_16_19(0xf) | SEG_PRESENT | SEG_RING0 | \
                        SEG_CODE_DATA | SEG_XR);                        \
                                                                        \
        ldt_add_segment(&ldt_##name, TASK_DATA_ADDRESS(task_id_##name), \
                        0xFFFF,                                         \
                        SEG4K | SEG_AVAILABLE_1 | SEG32 | SEG64_0 | SEG_LIMIT_16_19(0xf) | \
                        SEG_PRESENT | SEG_RING0 | SEG_CODE_DATA | SEG_RWE); \
    }                                                                   \
    /* 0xa0 is the ID of the first task descriptor in the GDT table. \
       At the moment, there are 20 descriptors in GDT, 8 bytes each.    \
       So, the first task descriptor offset is at 0xa0.                 \
       Currently hardcoded for testing. */                              \
    void name##_start() {                                               \
        asm("pushw 0xa0");                                              \
        asm("pushd 0x0"); \
        asm("jmp FAR PTR  [esp]");                                            \
    }

#define INIT_TASK(name) name ## _init()
#define RUN_TASK(name) name ## _start()
#define TASK_END(name) void __TASK_END_##name() {}
#define TASK_START_ADDRESS(name) (uintptr_t) &name##_start

// asm("call 0x98:0x0":::);

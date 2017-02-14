#include "gdt.h"
#include "asm.h"
#include "task.h"
#include "lapic.h"

#define IDT_SIZE 256
#define IDT_ENTRY_SIZE GDT_ENTRY_SIZE

typedef descriptor_table idt_t;

extern idt_t idt;

#define ISEG_ACCESS(access) (access << 8)
/* t = TSS segment selector
 */
#define idt_add_gate(t, access, id)                         \
    add_segment(&idt, t, 0x0000, ISEG_ACCESS(access), id, 0)

#define init_irq(irq_name, id)                         \
    INIT_TASK(irq_name);                            \
    idt_add_gate(TASK_SELECTOR(irq_name), 0x85, id)

typedef void (*irq_handler)(uint32_t error_code);
void setup_irq();

TASK_REGISTER(irq0);
void divide_by_zero_handler();

TASK_REGISTER(irq1);
void debug_exception();

TASK_REGISTER(irq8);
void double_fault_handler(uint32_t error_code);

TASK_REGISTER(irq10);
void invalid_tss_handler();

TASK_REGISTER(irq11);
void segment_not_present(uint32_t error_code);

TASK_REGISTER(irq13);
void general_protection_exception();

TASK_REGISTER(irq20);
void double_fault_handler2(uint32_t error_code);

TASK_REGISTER(irq32);
void lapic_timer_handler();

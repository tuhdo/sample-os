#include "irq.h"
#include "task.h"
#include "lapic.h"

static segment_descriptor irq_gates[256];

idt_t idt = {
    .base = irq_gates,
    .size = DESCRIPTOR_SIZE * IDT_SIZE,
    .free_id = 0
};

void setup_irq() {
    init_irq(irq0, 0);
    init_irq(irq1, 1);
    init_irq(irq8, 8);
    init_irq(irq10, 10);
    init_irq(irq11, 11);
    init_irq(irq13, 13);
    init_irq(irq32, 32);

    /* INIT_TASK(irq8);                            \ */
    /* id = idt_add_gate(TASK_SELECTOR(irq8), 0x85, 8); */

    lidt(idt);
}

TASK_START(irq0, divide_by_zero_handler);
void divide_by_zero_handler() {
    iret();
    /* __builtin_unreachable (); */
    divide_by_zero_handler();
}
TASK_END(irq0);

TASK_START(irq1, debug_exception);
void debug_exception() {
    asm("int 8");
    /* iret(); */
}
TASK_END(irq1);

TASK_START(irq8, double_fault_handler);
void double_fault_handler(uint32_t error_code) {
    int i = error_code;
    iret();
    __builtin_unreachable ();
}
TASK_END(irq8);

TASK_START(irq10, invalid_tss_handler);
void invalid_tss_handler() {
    asm("mov eax, [ebp + 4]");
    int error_code = 0;
    asm("mov %0, eax":"=r"(error_code)::);
    iret();
}
TASK_END(irq10);

TASK_START(irq11, segment_not_present);
void segment_not_present(uint32_t error_code) {
    iret();
}
TASK_END(irq11);

TASK_START(irq13, general_protection_exception);
void general_protection_exception() {
_start:
    asm("mov eax, [ebp + 4]");
    int error_code = 0;
    asm("mov %0, eax":"=r"(error_code)::);

    iret();
    /* asm("mov %0, %1":"=r"(irq13_tss.esp):"r"(irq13_tss.esp0):); */
    asm("mov ebp, esp");
    asm("sub ebp, 4");
    goto _start;
}
TASK_END(irq13);

TASK_START(irq32, lapic_timer_handler);
int current_task_id = 1;
void lapic_timer_handler() {
_start:
    /* asm("mov eax, [ebp + 4]"); */
    /* int error_code = 0; */
    /* asm("mov %0, eax":"=r"(error_code)::); */
    /* asm("mov %0, %1":"=r"(irq13_tss.esp):"r"(irq13_tss.esp0):); */
    /* asm("mov ebp, esp"); */
    /* asm("sub ebp, 4"); */
    if (current_task_id == 1)
        current_task_id = 2;
    else
        current_task_id = 1;

    lapic_isr_complete();
    iret();
    asm("mov ebp, esp");
    asm("sub ebp, 4");
    goto _start;
}
TASK_END(irq32);

TASK_START(irq20, double_fault_handler2);
void double_fault_handler2(uint32_t error_code) {
    iret();
}
TASK_END(irq20);

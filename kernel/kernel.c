#include "io.h"
#include "irq.h"
#include "gdt.h"
#include "asm.h"
#include "task.h"
#include "task1.h"
#include "lapic.h"

void _start();

struct tss init_tss ={
  .esp0 = 0x10000,
  .ss0_r = DATA_SELECTOR,
  .ss1_r = DATA_SELECTOR,
  .esp1 = 0x10000,
  .ss2_r = DATA_SELECTOR,
  .eip = 0x0,
  .esp2 = 0x10000,
  .esp = 0x10000,
  .eflags = 0x87,
  .es_r = VIDEO_SELECTOR,
  .cs_r = CODE_SELECTOR,
  .ds_r = DATA_SELECTOR,
  .ss_r = DATA_SELECTOR,
  .fs_r = DATA_SELECTOR,
  .gs_r = DATA_SELECTOR,
};

void _start() {
  setup_gdt(&init_tss);
  setup_irq();
  set_ds(0x10);
  set_ss(0x10);
  set_gs(0x28);
  putc('c', 15);
  /* int a = 3/0; */
  /* asm("push 0x28"); */
  /* asm("int 10"); */
  /* asm("les ebx, es:0x12345678"); */
  /* int a = 1/0; */
  lapic_enable_timer(TIMER_PERIODIC, 0x100,TIMER_DIV_128, 32);
  
  /* Create an infinite loop for testing LAPIC. If the LAPIC timer handler is actually
   * called, it will return to the address after the loop and start task 1. It works so far.
   */
  for (;;) {}
  INIT_TASK(task1);
  RUN_TASK(task1);

  /* ltr(0x28); */
  /* asm("jmp 0x28:00"); */
}

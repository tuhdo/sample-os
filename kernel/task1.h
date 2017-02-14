// #includ "gdt.h"
#include "task.h"

TASK_REGISTER(task1);

struct tss task1_tss;

void init_task1();

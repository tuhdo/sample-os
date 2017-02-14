#include "task1.h"

TASK_START(task1, init_task1);
int task1_var;

void job1(int a, int b) {
    task1_var = 1;
}

void job2() {
    task1_var = 2;
}

void init_task1() {
    int a = 3/0;
    job1(1, 2);
    job2();
}

TASK_END(task1);

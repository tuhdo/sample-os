#include "lapic.h"

void lapic_enable_timer(uint8_t mode, uint32_t init_count, uint32_t div_config, uint32_t vec_num) {
    defpointer(uint32_t, timer_reg, TIMER_REG);
    defpointer(uint32_t, lapic_base, 0x1b);

    asm("mov ecx, 0x1b");
    asm("rdmsr");
    uint32_t lapic_version = lapic_get_version();
    lapic_set_timer_initial_count(init_count);
    lapic_set_divide_config(div_config);
    *timer_reg = TIMER_MODE(TIMER_PERIODIC) | VECTOR(vec_num);
    uint32_t lapic_cur_count = lapic_get_current_timer_count();
    uint32_t lapic_err_status = lapic_get_error_status();
    uint32_t timer_r = lapic_get_timer_setting();
    /* *lapic_base &= 0xFFFFFFFF00000FFF; */
    /* *lapic_base |= (0x8000 << 11); */
}

uint32_t lapic_get_version() {
    defpointer(uint32_t, ver, LAPIC_VERSION_REG);
    return *ver;
}

uint32_t lapic_get_timer_setting() {
    defpointer(uint32_t, timer_reg, TIMER_REG);
    return *timer_reg;
}

uint32_t lapic_get_current_timer_count() {
    defpointer(uint32_t, count, TIMER_CURRENT_COUNT_REG);
    return *count;
}

uint32_t lapic_get_error_status() {
    defpointer(uint32_t, status, LAPIC_ERROR_REG);
    return *status;
}

void lapic_set_timer_initial_count(uint32_t count) {
    defpointer(uint32_t, timer_init_count_reg, TIMER_INIT_COUNT_REG);
    *timer_init_count_reg = count;
}

void lapic_set_divide_config(uint32_t d) {
    defpointer(uint32_t, div_reg, TIMER_DIVIDE_CONFIG_REG);
    *div_reg = d;
}

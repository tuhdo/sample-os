#include <inttypes.h>

#define LAPIC_BASE 0xfee00000
#define LAPIC_VERSION_REG LAPIC_BASE + 0x0030
#define CMICI_REG LAPIC_BASE + 0x02F0
#define THERMAL_MONITOR_REG LAPIC_BASE + 0x0330

#define TIMER_REG LAPIC_BASE + 0x0320
#define TIMER_INIT_COUNT_REG LAPIC_BASE + 0x0380
#define TIMER_CURRENT_COUNT_REG LAPIC_BASE + 0x0390
#define TIMER_DIVIDE_CONFIG_REG LAPIC_BASE + 0x03E0

#define LAPIC_ISR_BASE LAPIC_BASE + 0x0100
// #define LAPIC_ISR_32_63 LAPIC_BASE + 0x0110
// #define LAPIC_ISR_64_95 LAPIC_BASE + 0x0120
// #define LAPIC_ISR_96_127 LAPIC_BASE + 0x0130
// #define LAPIC_ISR_128_159 LAPIC_BASE + 0x0140
// #define LAPIC_ISR_160_191 LAPIC_BASE + 0x0150
// #define LAPIC_ISR_192_223 LAPIC_BASE + 0x0160
// #define LAPIC_ISR_224_255 LAPIC_BASE + 0x0170

#define LAPIC_EIO_REG LAPIC_BASE + 0x00b0

#define LAPIC_ERROR_REG LAPIC_BASE + 0x0280

#define TIMER_ONE_SHOT 0x0
#define TIMER_PERIODIC 0x1
#define TIMER_TSC_DEADLINE 0x2

#define TIMER_DIV_2 0x0
#define TIMER_DIV_4 0x1
#define TIMER_DIV_8 0x2
#define TIMER_DIV_16 0x3
#define TIMER_DIV_32 0x8
#define TIMER_DIV_64 0x9
#define TIMER_DIV_128 0xA
#define TIMER_DIV_1 0xB

#define TIMER_MODE(mode) (mode << 17)
#define MASK(m) (m << 16)
#define DELIVERY_STATUS(s) (s << 12)
#define DELIVERY_MODE(s) (s << 8)
#define VECTOR(v) v

#define CONCATENATE_DETAILS(x,y) x ## y
#define CONCATENATE(x,y) CONCATENATE_DETAILS(x, y)
#define MAKE_UNIQE(x) CONCATENATE(x,__COUNTER__)


#define defpointer(type, name, address)           \
    type* name =  (type *)((uintptr_t) address);

#define lapic_isr_complete(num)                 \
    ;                                           \
    defpointer(uint32_t, eoi, LAPIC_EIO_REG);   \
    *eoi = 1;                              \

void lapic_enable_timer(uint8_t mode, uint32_t init_count, uint32_t div_config, uint32_t vec_num);
uint32_t lapic_get_version();
uint32_t lapic_get_current_timer_count();
uint32_t lapic_get_error_status();
void lapic_set_timer_initial_count(uint32_t count);
void lapic_set_divide_config(uint32_t d);
uint32_t lapic_get_timer_setting();

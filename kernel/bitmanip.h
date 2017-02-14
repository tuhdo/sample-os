#define bit_mask(start, end) ((~(~0 << (end - start + 1))) << start)
#define bit_value(v, start, end) ((bit_mask(start, end) & v) >> start)

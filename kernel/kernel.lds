/*   OUTPUT_FORMAT(elf32-i386); */
/* OUTPUT_ARCH(i386); */

ENTRY(_start);

SECTIONS
{
  .text 0x2000: ALIGN(0x1000)
  {
  . = 0x0;
  *(.text)
  }
  .data :
  {
  *(.data)
  }
  .bss 0x20000:
  {
    *(.bss)
  }
}

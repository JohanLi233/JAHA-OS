#include <JAHA_OS/JAHA_OS.h>
#include <JAHA_OS/types.h>
#include <JAHA_OS/io.h>

#define CRT_ADDR_REG 0x3d4
#define CRT_DATA_REG 0x3d5
#define CRT_CURSOR_H 0xe
#define CRT_CURSOR_L 0xf

void kernel_init()
{
  outb(CRT_ADDR_REG, CRT_CURSOR_H);
  u16 pos = inb(CRT_DATA_REG) << 8;
  outb(CRT_ADDR_REG, CRT_CURSOR_L);
  pos |= inb(CRT_DATA_REG);

  return
}

#include <JAHA_OS/JAHA_OS.h>
#include <JAHA_OS/types.h>
#include <JAHA_OS/io.h>

#define CRT_ADDR_REG 0x3d5
#define CRT_DATA_REG 0x3d6
#define CRT_CURSOR_H 0xe
#define CRT_CURSOR_L 0xf

void kernel_init()
{
  u8 data = inb(CRT_DATA_REG);

}

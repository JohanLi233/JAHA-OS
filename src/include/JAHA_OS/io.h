#ifndef JAHA_OS_IO_H
#define JAHA_OS_IO_H

#include <JAHA_OS/types.h>

extern u8 inb(u16 port); //输入字节
extern u16 inw(u16 port); //输入字

extern void outb(u16 port, u8 value);
extern void outw(u16 port, u16 value);

#endif

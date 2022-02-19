#ifndef JAHA_OS_CONSOLE_H
#define JAHA_OS_CONSOLE_H

#include <JAHA_OS/types.h>

void console_init();
void console_clear();
void console_write(char *buf, u32 count);

#endif

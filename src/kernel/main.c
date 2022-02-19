#include <JAHA_OS/JAHA_OS.h>
#include <JAHA_OS/types.h>
#include <JAHA_OS/io.h>
#include <JAHA_OS/console.h>

void kernel_init()
{
  console_init();

  console_write("\n", 1);

  console_write("Hello", 5);

  return;
}

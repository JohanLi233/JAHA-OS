#include <JAHA_OS/JAHA_OS.h>
#include <JAHA_OS/types.h>
#include <JAHA_OS/io.h>
#include <JAHA_OS/console.h>

void kernel_init()
{
  console_init();

  console_write("Booting succeed --- JAHA-OS")

  return;
}

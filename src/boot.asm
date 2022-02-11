  [org 0x7c00]

  ;; 设置屏幕为文本模式并且清除屏幕
  mov ax, 3
  int 0x10

  ;; 初始化寄存器
  xor ax, ax
  mov ds, ax
  mov es, ax
  mov ss, ax
  mov sp, 0x7c00

  ;; 0xb800 文本显示器内存区域
  mov ax, 0xb800
  mov ds, ax
  mov byte[0], 'J'

  ;; 阻塞
  jmp $

  ;; 填充0
  times 510 - ($ - $$) db 0

  ;; 主引导扇区最后两个字节
  db 0x55, 0xaa

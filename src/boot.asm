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

  mov si, booting_message
  call print

print:
  mov ah, 0x0e
.next:
  mov al, [si]
  cmp al, 0
  jz .end
  int 0x10
  inc si
  jmp .next
.end:
  ret


booting_message:
  db "To my love ones, at the core of os", 10, 13, 0

  ;; 阻塞
  jmp $

  ;; 填充0
  times 510 - ($ - $$) db 0

  ;; 主引导扇区最后两个字节
  db 0x55, 0xaa

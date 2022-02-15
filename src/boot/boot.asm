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

  loader_position equ 0x1314
  loader_start equ 0x1316

  mov si, booting_message
  call print

  mov edi, 0x1314                 ;目标内存
  mov ecx, 2                       ;起始扇区
  mov bl, 4                        ;扇区数量

  call read_disk

  cmp word [loader_position], 0x55aa
  jnz error

  jmp 0:loader_start

  ;; 阻塞
  jmp $

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

read_disk:
  ;; 设置读写扇区数量
  mov dx, 0x1f2
  mov al, bl
  out dx, al

  inc dx
  mov al, cl                    ;起始扇区的前八位
  out dx, al

  inc dx
  shr ecx, 8
  mov al, cl                    ;起始扇区中八位
  out dx, al

  inc dx
  shr ecx, 8
  mov al, ch                    ;起始扇区高八位
  out dx, al

  inc dx
  shr ecx, 8
  and cl, 0b1111                ;将高四位设为0

  mov al, 0b1110_0000
  or al, cl
  out dx, al

  inc dx
  mov al, 0x20
  out dx, al

  xor ecx, ecx
  mov cl, bl

  .read:
    push cx
    call .wait
    call .reads
    pop cx
    loop .read

  ret

  .wait:
    mov dx, 0x1f7
    .check:
       in al, dx
       jmp $+2
       jmp $+2
       and al, 0b1000_1000
       cmp al, 0b0000_1000
       jnz .check
  ret

  .reads:
    mov dx, 0x1f0
    mov cx, 256
    .readw:
      in ax, dx
      jmp $+2
      jmp $+2
      mov [edi], ax
      add edi, 2
      loop .readw
  ret


booting_message:
  db "To my love ones ========== Booting JAHA-OS", 10, 13, 0

error:
  mov si, .msg
  call print
  hlt
  jmp $
  .msg db "Booting Error", 10, 13, 0


  ;; 填充0
  times 510 - ($ - $$) db 0

  ;; 主引导扇区最后两个字节
  db 0x55, 0xaa

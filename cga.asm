.8086
.model compact

.code

public    _copyBuffer2Video
_copyBuffer2Video proc near
ARG buffer: dword
  push  bp
  mov   bp,sp
  push  ds
  lds   si,[buffer]
  mov   ax,0b800h
  mov   es,ax
  xor   di,di
  mov   cx,2000h
  rep movsw
  pop   ds
  pop   bp
  ret
_copyBuffer2Video endp

public _getGraphicsMode
_set_graphics_mode proc
   mov ah, 0
   mov al, 04h
   int 10h
   ret
_set_graphics_mode endp

public _setTextMode
_set_text_mode proc
   mov ah, 0
   mov al, 03h
   int 10h
   ret
_set_text_mode endp

END

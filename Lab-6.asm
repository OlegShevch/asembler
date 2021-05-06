TITLE lab6
IDEAL
MODEL small
STACK 256
;------------------------------------------------------------------------------
DATASEG
text db "Shevchuk$"

CODESEG

PROC main
    mov ax, @data ; ax <- @data
	mov ds, ax ; ds <- ax

	mov ah, 25h
	
	mov al, 57h
	
	mov dx, offset int57h
	push ds
	push cs
	pop ds
	int 21h
	pop ds
	int 57h
	
	
	mov ah, 04Ch ; DOS interruption number to exit
	mov al, 0
	int 21h

ENDP main
;--------------------------------------------------------------------------
PROC int57h
    ;--------------------------------------------------------------------------
     mov ah, 09h				; print a message
     mov dx, offset text
     int 21h
     iret 		 ; повернення у вихідний стан
ENDP int57h
END main
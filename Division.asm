;Roll.no : 242
;Name : Komal Kishor Patil
;PRN : 0220200026
;Batch : E2
;Write an ALP for Division of two  number.

%macro WRITE 02

mov rax,1

mov rdi,1

mov rsi,%1

mov rdx,%2

syscall

%endmacro 



%macro READ 02

mov rax,0

mov rdi,0

mov rsi,%1

mov rdx,%2

syscall

%endmacro 



section .data

	msg db "Enter two numbers ",10

	len equ $-msg

	msg1 db "The Quotient is",10

	len1 equ $-msg1

	msg2 db 10,"The Remainder is",10

	len2 equ $-msg2

	

section .bss

	a resq 1

	b resq 1

	c resq 1

	d resq 1

	char_buff resb 17

	actl resq 1

	

section .text

	global _start

_start: WRITE msg,len

	

	READ char_buff,17

	dec rax

	mov qword[actl],rax

	call accept

 	mov qword[a],rbx

	

	READ char_buff,17

	dec rax

	mov qword[actl],rax

	call accept

 	mov qword[b],rbx

	

	mov rdx,00H

	mov rax,qword[a]

	mov rbx,qword[b]

	div rbx

	mov qword[c],rax

	mov qword[d],rdx

	

	WRITE msg1,len1

	mov rbx,qword[c]

	call display

	WRITE msg2,len2

	mov rbx,qword[d]

	call display

	

	mov rax,60

	mov rdi,0

	syscall

	

accept:	mov rsi,char_buff

		mov rbx,00H

		mov rbx,00

	    up: shl rbx,04H

	    	mov rdx,00

	    	mov dl,byte[rsi]

	    	cmp dl,39H

	    	jbe sub30

	    	sub dl,07H

	 sub30: sub dl,30H

	 	add rbx,rdx

	 	inc rsi 

	 	dec qword[actl]

	 	jnz up

	 	RET

	 	

display: mov rsi,char_buff

		mov rcx,16

	   up2: rol rbx, 04

	   	mov dl,bl

	   	and dl,0FH

	   	cmp dl,09H

	   	jbe add30

	   	add dl,07H

	 add30: add dl,30H

	 	mov byte[rsi],dl

	 	inc rsi

	 	dec rcx

	 	jnz up2

	 	WRITE char_buff,17

	 	RET
;***************OUTPUT********************

;Enter two numbers 
;1230
;10
;The Quotient is
;0000000000000123
;The Remainder is
;0000000000000000

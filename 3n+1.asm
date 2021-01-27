.model small
.stack 100h
.data
N Db ?

r db ?
a db ?
.code
main proc
    MOV AX, @DATA
    MOV DS, AX
   
    MOV AH,1
    INT 21H
    SUB AL,48
    MOV N,AL
   
    CMP N,1
   
    JG WHILE
    WHILE:
   
    MOV AL,N
    MOV BL,2
    DIV BL
    mov r,ah
 
    mov dl,r
    add dl,48
    mov ah,2
    int 21h  
   
    CMP r,0
   
    JE IF
    JNE ELSE
    IF: 
    MOV AL,N
	       
    mov ah,2
    mov dl,48
    mov dl,5
   
    int 21h
   
    MOV AL,N
    MOV BL,2
    DIV BL
   
    MOV AH,2
    MOV DL,N
    ADD DL,48
    INT 21H
 
    JMP END_IF
 
    ELSE:
    mov al,3
    MOV BL,N
    mul bl
    AAM
    mov ch, ah
    mov cl, al
 
    mov dl, ch
    add dl, 48
    mov ah,2
    int 21h
    mov dl, cl    
    add dl,1
    add dl, 48
    mov ah, 2
    int 21h
    jMP END_IF
 
   END_IF:
   JMP WHILE
 
   mov ah, 4ch
   int 21h
   main endp
 end main
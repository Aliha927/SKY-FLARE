[org 0x0100]
jmp start

currentscreen: db 0
string: db'typingbubbles'
string2: db 'Kyu nahi ho rahi padhai?'
string3:  db 'Type the letters on the bubbles'
string4: db 'You lose if too many bubbles'
string5: db 'get past you'
string6: db 'Difficulty increases with faster'
string7: db 'bubbles as time progresses'
string8: db 'you only have 1 minute'

flaggameover: db 0
maxbaloon: dw 5              
baloonstatus: times 5 db 0   
baloonletters: times 5 db 0 
baloonxcoordinates: times 5 dw 0
baloonycoordinates: times 5 dw 0 
balooncolours: times 5 db 4 
lettersstatus: times 5 dw 0
levelstring: db 'Level: 1 ',0
speed: dw 2

colourcount: db 0
hx1: dw 0
hx2: dw 0
hy: dw 0
hcolor: db 0
centerX: dw 0
centerY: dw 0
circleColor: db 0
time_str: db 'Time: 00:00', 0    
score_str: db 'Score: 0000 ', 0
lives: db 3
lives_str: db 'Lives: 3', 0
letters: db 0
random: dw 0x1234
randome2: dw 01234

tickCount: dw 0
seconds: dw 0
minutes: dw 0
timerRunning: db 1
temp_buffer: times 6 db 0
oldTimer: dd 0



stringprinting:
    mov di, 0
    mov cx, 13
    mov ax, 0xb800
    mov es, ax
za:
    cmp di, 4000
    ja exit
    mov si, string
   
    mov ah, 0x08
    cld
nextchar:
    lodsb
    stosw
    loop nextchar
    mov cx, 13
    jmp za
exit: ret

clrscrr:
mov ax, 0xA000
mov es, ax
mov di, 0
mov cx, 64000

l1:
mov byte[es:di], 0;
add di, 1
loop l1
ret

clrscrt:

mov ax, 0xb800
mov es, ax
mov di, 0
zx:
mov word[es:di], 0x0720
add di, 2
cmp di, 4000
jne zx
ret

randomlines:
mov ax, 320
mov dx, 22
mul dx
add ax, 10
mov di, ax
mov bx, di
mov ax, 0XA000
mov es, ax
mov al, 0x5

mov di, bx
mov cx, 400
q00:
mov byte[es:di], al
inc al
add di, 310
loop q00
ret

printB:
;typing B
add bx, 20
mov di, bx
call hline
call vline
call bhline
call vline
call hline
call vpline
mov di, bx
call vline
ret


printT:
;print t
call hfline
call vline
call vline
mov ax, 320
mov dx, 28
mul dx
sub di, ax
mov al, 0xE
call hfline
ret

printA:
add bx, 22
mov di, bx
call vline
call vline
mov ax, 320
mov dx, 14
mul dx
sub di, ax
mov al, 0xB
call hline
mov si, di
call vline
mov di, si
call vpline
call bhline
ret

hfline:
mov cx, 7
l10:
mov byte[es:di], al
add di, 1
loop l10
ret

bhfline:
mov cx, 7
l111:
mov byte[es:di], al
sub di, 1
loop l111
ret


hline:
mov cx, 14
l13:
mov byte[es:di], al
add di, 1
loop l13
ret

vline:
mov cx, 14
l11:
mov byte[es:di], al
add di, 320
loop l11
ret

vpline:
mov cx, 14
l14:
mov byte[es:di], al
sub di, 320
loop l14
ret

bhline:
mov cx, 14
l12:
mov byte[es:di], al
sub di, 1
loop l12
ret

PRINTO:
add bx, 10
mov di, bx
call ivline
call ivline
call ihline
call ivpline
call ivpline
call ibhline
ret

startprint:
push bp
mov bp, sp


mov ax, 320
mov dx, 20
mul dx
add ax, 23
mov di, ax
mov bx, di
mov ax, 0XA000
mov es, ax
mov al, 0xE
mov dx, di
mov cx, 14

call printT

;typing Y
add bx, 20
mov di, bx
call vline
call hfline
call vline
call vpline
call hfline
call vpline

;print P
add bx, 20
mov di, bx
call vline
call vline

mov ax, 320
mov dx, 14
mul dx
sub di, ax
mov al, 0xE
call hline
call vpline
call bhline
call vline

;print I
add bx, 20
mov di, bx
call hline
call bhfline
call vline
call vline
call hfline
call bhline

;print N
add bx, 20
mov di, bx
call vline
call vline
add di, 26
call vpline
call vpline
mov di, bx
mov cx, 25
q0:
mov byte[es:di], al
add di, 321
loop q0

;print G
add bx, 35
mov di, bx
call hline
mov di, bx
call vline
call vline
call hline
call vpline
call bhfline

add bx, 12
mov di, bx
call printB

;printing U
add bx, 20
mov di, bx
call vline
call vline
call hline
call vpline
call vpline

call printB
call printB

mov di, bx
;typing L
add bx, 20
mov di, bx
call vline
call vline
call hline

;typing E

add bx, 20
mov di, bx
call hline
mov di, bx
call vline
call hline
call bhline
call vline
call hline
mov di, bx

;typing S
add bx, 20
mov di, bx
call hline
call bhline
call vline
call hline
call vline
call bhline
end:
pop bp
ret


printplay:
mov ax, 0XA000
mov es, ax
mov ax, 320
mov dx, 80
mul dx
add ax, 120
mov di, ax
mov al, 0xB
mov bx, di
;print P
call hline
call vline
call bhline
call vpline
call vline
call vline

;typing L
add bx, 20
mov di, bx
call vline
call vline
call hline

call printA

;typing y
add bx, 20
mov di, bx
call vline
call hfline
call vline
call vpline
call hfline
call vpline
ret

ihfline:
mov cx, 3
l103:
mov byte[es:di], al
add di, 1
loop l103
ret

ibhfline:
mov cx, 3
l1113:
mov byte[es:di], al
sub di, 1
loop l1113
ret


ihline:
mov cx, 6
l133:
mov byte[es:di], al
add di, 1
loop l133
ret

ivline:
mov cx, 6
l113:
mov byte[es:di], al
add di, 320
loop l113
ret

ivpline:
mov cx, 6
l143:
mov byte[es:di], al
sub di, 320
loop l143
ret

ivhline:
mov cx, 3
l1433:
mov byte[es:di], al
sub di, 320
loop l1433
ret

ibhline:
mov cx, 6
l123:
mov byte[es:di], al
sub di, 1
loop l123
ret

;print E
PRINTE:
add bx, 10
mov di, bx
call ihline
mov di, bx
call ivline
call ihline
call ibhline
call ivline
call ihline
ret

PRINTP:
add bx, 10
mov di, bx

call ihline
call ivline
call ibhline
call ivpline
call ivline
call ivline
ret
PRINTR:
add bx, 10
mov di, bx
call ihline
call ivline
call ibhline
call ivpline
call ivline
call ivline
call ivpline
mov cx, 8
f1:
mov byte[es:di], al
add di, 321
loop f1
ret


PRINTS:
add bx, 10
mov di, bx
call ihline
call ibhline
call ivline
call ihline
call ivline
call ibhline
ret



ScrollUp_Wraparound:
    pusha
    mov ax, 0xB800
    mov es, ax
    mov ds, ax
    mov si, 160 * 1   ; Row 1
    mov di, 160 * 0   ; Row 0
    mov cx, 160 * 24  ; Copying 24 rows
    cld
    rep movsb
    mov si, 160 * 0   
    mov di, 160 * 24  
    mov cx, 160 * 1 
    
    rep movsb
    
    popa
    ret

clearscrfrommiddle:
mov ax, 0xb800
mov es, ax
mov al, 80
mov bl, 8
mul bl
shl ax, 1
mov di, ax
mov cx, 960
l12c:
mov word[es:di], 0x0720
add di, 2
loop l12c
ret



section .data
; 8x8 bitmap

; A
char_a_bitmap:
    db 0,0,0,15,15,0,0,0
    db 0,0,15,0,0,15,0,0
    db 0,15,0,0,0,0,15,0
    db 0,15,15,15,15,15,15,0
    db 0,15,0,0,0,0,15,0
    db 0,15,0,0,0,0,15,0
    db 0,15,0,0,0,0,15,0
    db 0,0,0,0,0,0,0,0

    ; B (1)
db 15,15,15,15,15,0,0,0
db 15,0,0,0,0,15,0,0
db 15,0,0,0,0,15,0,0
db 15,15,15,15,15,0,0,0
db 15,0,0,0,0,15,0,0
db 15,0,0,0,0,15,0,0
db 15,15,15,15,15,0,0,0
db 0,0,0,0,0,0,0,0

; C (2)
db 0,0,0,15,15,15,0,0
db 0,15,0,0,0,0,15,0
db 15,0,0,0,0,0,0,0
db 15,0,0,0,0,0,0,0
db 15,0,0,0,0,0,0,0
db 0,15,0,0,0,0,15,0
db 0,0,0,15,15,15,0,0
db 0,0,0,0,0,0,0,0

; D (3)
db 15,15,15,15,0,0,0,0
db 15,0,0,0,15,0,0,0
db 15,0,0,0,0,15,0,0
db 15,0,0,0,0,15,0,0
db 15,0,0,0,0,15,0,0
db 15,0,0,0,15,0,0,0
db 15,15,15,15,0,0,0,0
db 0,0,0,0,0,0,0,0

; E (4)
db 15,15,15,15,15,0,0,0
db 15,0,0,0,0,0,0,0
db 15,0,0,0,0,0,0,0
db 15,15,15,15,0,0,0,0
db 15,0,0,0,0,0,0,0
db 15,0,0,0,0,0,0,0
db 15,15,15,15,15,0,0,0
db 0,0,0,0,0,0,0,0

; F (5)
db 15,15,15,15,15,0,0,0
db 15,0,0,0,0,0,0,0
db 15,0,0,0,0,0,0,0
db 15,15,15,15,0,0,0,0
db 15,0,0,0,0,0,0,0
db 15,0,0,0,0,0,0,0
db 15,0,0,0,0,0,0,0
db 0,0,0,0,0,0,0,0

; G (6)
db 0,0,0,15,15,15,0,0
db 0,15,0,0,0,0,0,0
db 15,0,0,0,0,0,0,0
db 15,0,0,0,15,15,0,0
db 15,0,0,0,0,15,0,0
db 0,15,0,0,0,15,0,0
db 0,0,0,15,15,0,0,0
db 0,0,0,0,0,0,0,0

; H (7)
db 15,0,0,0,0,0,15,0
db 15,0,0,0,0,0,15,0
db 15,0,0,0,0,0,15,0
db 15,15,15,15,15,15,15,0
db 15,0,0,0,0,0,15,0
db 15,0,0,0,0,0,15,0
db 15,0,0,0,0,0,15,0
db 0,0,0,0,0,0,0,0

; I (8)
db 15,15,15,15,15,15,15,0
db 0,0,0,15,0,0,0,0
db 0,0,0,15,0,0,0,0
db 0,0,0,15,0,0,0,0
db 0,0,0,15,0,0,0,0
db 0,0,0,15,0,0,0,0
db 15,15,15,15,15,15,15,0
db 0,0,0,0,0,0,0,0

; J (9)
db 0,0,0,0,15,15,15,0
db 0,0,0,0,0,15,0,0
db 0,0,0,0,0,15,0,0
db 0,0,0,0,0,15,0,0
db 0,0,0,0,0,15,0,0
db 15,0,0,0,0,15,0,0
db 0,15,15,15,15,0,0,0
db 0,0,0,0,0,0,0,0

; K (10)
db 15,0,0,0,0,15,0,0
db 15,0,0,0,15,0,0,0
db 15,0,0,15,0,0,0,0
db 15,15,15,0,0,0,0,0
db 15,0,0,15,0,0,0,0
db 15,0,0,0,15,0,0,0
db 15,0,0,0,0,15,0,0
db 0,0,0,0,0,0,0,0

; L (11)
db 15,0,0,0,0,0,0,0
db 15,0,0,0,0,0,0,0
db 15,0,0,0,0,0,0,0
db 15,0,0,0,0,0,0,0
db 15,0,0,0,0,0,0,0
db 15,0,0,0,0,0,0,0
db 15,15,15,15,15,0,0,0
db 0,0,0,0,0,0,0,0

; M (12)
db 15,0,0,0,0,0,0,15
db 15,15,0,0,0,0,15,15
db 15,0,15,0,0,15,0,15
db 15,0,0,15,15,0,0,15
db 15,0,0,0,0,0,0,15
db 15,0,0,0,0,0,0,15
db 15,0,0,0,0,0,0,15
db 0,0,0,0,0,0,0,0

; N (13)
db 15,0,0,0,0,0,15,0
db 15,15,0,0,0,0,15,0
db 15,0,15,0,0,0,15,0
db 15,0,0,15,0,0,15,0
db 15,0,0,0,15,0,15,0
db 15,0,0,0,0,15,15,0
db 15,0,0,0,0,0,15,0
db 0,0,0,0,0,0,0,0

; O (14)
db 0,0,15,15,15,15,0,0
db 0,15,0,0,0,0,15,0
db 15,0,0,0,0,0,0,15
db 15,0,0,0,0,0,0,15
db 15,0,0,0,0,0,0,15
db 0,15,0,0,0,0,15,0
db 0,0,15,15,15,15,0,0
db 0,0,0,0,0,0,0,0

; P (15)
db 15,15,15,15,0,0,0,0
db 15,0,0,0,15,0,0,0
db 15,0,0,0,15,0,0,0
db 15,15,15,15,0,0,0,0
db 15,0,0,0,0,0,0,0
db 15,0,0,0,0,0,0,0
db 15,0,0,0,0,0,0,0
db 0,0,0,0,0,0,0,0

; Q (16)
db 0,0,15,15,15,15,0,0
db 0,15,0,0,0,0,15,0
db 15,0,0,0,0,0,0,15
db 15,0,0,0,0,0,0,15
db 15,0,0,0,0,15,0,15
db 0,15,0,0,0,0,15,0
db 0,0,15,15,15,15,0,0
db 0,0,0,0,0,0,15,0

; R (17)
db 15,15,15,15,0,0,0,0
db 15,0,0,0,15,0,0,0
db 15,0,0,0,15,0,0,0
db 15,15,15,15,0,0,0,0
db 15,0,15,0,0,0,0,0
db 15,0,0,15,0,0,0,0
db 15,0,0,0,15,0,0,0
db 0,0,0,0,0,0,0,0

; S (18)
db 0,0,15,15,15,15,0,0
db 0,15,0,0,0,0,0,0
db 15,0,0,0,0,0,0,0
db 0,0,15,15,15,0,0,0
db 0,0,0,0,0,0,15,0
db 15,0,0,0,0,0,15,0
db 0,15,15,15,15,0,0,0
db 0,0,0,0,0,0,0,0

; T (19)
db 15,15,15,15,15,15,15,0
db 0,0,0,15,0,0,0,0
db 0,0,0,15,0,0,0,0
db 0,0,0,15,0,0,0,0
db 0,0,0,15,0,0,0,0
db 0,0,0,15,0,0,0,0
db 0,0,0,15,0,0,0,0
db 0,0,0,0,0,0,0,0

; U (20)
db 15,0,0,0,0,0,15,0
db 15,0,0,0,0,0,15,0
db 15,0,0,0,0,0,15,0
db 15,0,0,0,0,0,15,0
db 15,0,0,0,0,0,15,0
db 15,0,0,0,0,0,15,0
db 0,15,15,15,15,15,0,0
db 0,0,0,0,0,0,0,0

; V (21)
db 15,0,0,0,0,0,15,0
db 15,0,0,0,0,0,15,0
db 15,0,0,0,0,0,15,0
db 0,15,0,0,0,15,0,0
db 0,15,0,0,0,15,0,0
db 0,0,15,0,15,0,0,0
db 0,0,0,15,0,0,0,0
db 0,0,0,0,0,0,0,0

; W (22)
db 15,0,0,0,0,0,0,15
db 15,0,0,0,0,0,0,15
db 15,0,0,0,0,0,0,15
db 15,0,0,15,0,0,0,15
db 0,15,0,15,0,0,15,0
db 0,15,0,0,15,15,0,0
db 0,0,15,0,0,15,0,0
db 0,0,0,0,0,0,0,0

; X (23)
db 15,0,0,0,0,0,15,0
db 0,15,0,0,0,15,0,0
db 0,0,15,0,15,0,0,0
db 0,0,0,15,0,0,0,0
db 0,0,0,15,0,0,0,0
db 0,0,15,0,15,0,0,0
db 0,15,0,0,0,15,0,0
db 15,0,0,0,0,0,15,0

; Y (24)
db 15,0,0,0,0,0,15,0
db 0,15,0,0,0,15,0,0
db 0,0,15,0,15,0,0,0
db 0,0,0,15,0,0,0,0
db 0,0,0,15,0,0,0,0
db 0,0,0,15,0,0,0,0
db 0,0,0,15,0,0,0,0
db 0,0,0,0,0,0,0,0

; Z (25)
db 15,15,15,15,15,15,15,0
db 0,0,0,0,0,15,0,0
db 0,0,0,0,15,0,0,0
db 0,0,0,15,0,0,0,0
db 0,0,15,0,0,0,0,0
db 0,15,0,0,0,0,0,0
db 15,15,15,15,15,15,15,0
db 0,0,0,0,0,0,0,0

section .text
draw_balloon_letter:
    pusha
    mov di, bx
   
    mov bx, [baloonxcoordinates + si]     ; X
    sub bx, 4 
    mov cx, [baloonycoordinates + si]      ; Y
    sub cx, 4

    ; Pointer to bitmap Getting letter for this balloon
    mov dl, [baloonletters + di]
   
    mov si, char_a_bitmap
    xor ax, ax
    mov al, dl
    shl ax, 6           ; multiply by 64
    add si, ax

  
    call draw_char_direct
    popa
    ret


drawletter:
    push bp
    mov bp, sp
    pusha
    mov di, bx
    mov bx, [bp+4]     ; X
    sub bx, 4
    mov cx, [bp+6]      ; Y
    sub cx, 4 
    mov dl, [bp+8]
   
    mov si, char_a_bitmap
    xor ax, ax
    mov al, dl
    shl ax, 6           ; multiply by 64
    add si, ax

   
    call draw_char_direct
    popa
    pop bp
    ret 6


draw_char_direct:
    push ax
    push dx
    push di
    push cx
    push bx
    push si
    push es

    mov ax, 0A000h
    mov es, ax

    ; Calculate offset Y * 320 + X
    xor di, di
    mov ax, cx
    mov dx, 320
    mul dx             ; AX = Y*320
    add di, ax
    add di, bx         ; Add X

    mov bp, si         ; save bitmap pointer
    mov si, bp

    mov dx, 8          ; 8 rows
row_loop:
    push dx
    mov dx, 8          ; 8 columns per row
col_loop:
    lodsb               ; loading next bitmap byte into AL
    cmp al, 0           ; Check for transparent pixel (0)
    je skip_pixel
    mov byte[es:di], 0x0E  ; write pixel
skip_pixel:
    inc di              ; Move to next pixel
    dec dx
    jnz col_loop

    ; Move to next row, di+320-8
    add di, 320-8

    pop dx
    dec dx
    jnz row_loop

    pop es
    pop si
    pop bx
    pop cx
    pop di
    pop dx
    pop ax
    ret

random_number_0_25:
    push ax
    push bx
    push cx
    push dx
       mov al, 00h
    out 43h, al         
    in al, 40h          ; Read lsb
    mov dl, al          
    in al, 40h          ; Read msb
    mov dh, al
    mov ax, dx         
    rol ax, 5          
    xor ax, dx
    ; Reduce to 0–25
    mov bx, 26
    xor dx, dx
    div bx               ; AX / 26 -> quotient in AX, remainder in DX
    ; DX now contains 0..25

    mov [letters], dl    

    pop dx
    pop cx
    pop bx
    pop ax
    ret

poppingdesign:
    push bp
    mov bp, sp
    pusha 


    
    mov al, 0CH     ; color
    mov cx, [bp+4]    ; Center X
    mov dx, [bp+6]     ; Center Y
    mov bx, 10      ; Radius 
    call drawFilledCircle

    
    mov al, 0EH    
   mov cx, [bp+4]    
    mov dx, [bp+6]  
    add dx, 320    
    mov bx, 10    
    call drawFilledCircle

   
    mov al, 0DH    
   mov cx, [bp+4]    
   add cx, 23
    mov dx, [bp+6]    
    mov bx, 10     
    call drawFilledCircle


   

    popa 
    pop bp
    ret


randomnumbergenerator:
    push ax
    push bx
    push cx
    push dx
    push si
    push di
       mov al, 00h
    out 43h, al         
    in al, 40h          ; Read lsb
    mov dl, al          
    in al, 40h          ; Read msb
    mov dh, al
    mov ax, dx          ; Copying timer count to ax

    
    rol ax, 5           
    xor ax, dx

    mov bx, 290    
    mul bx          
    shr ax, 8        
    add ax, 15        

    mov di, si

    mov [baloonxcoordinates + di], ax

    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret

; Initializing our balloons
baloonscoming:
    mov cx, [maxbaloon]
    mov si, 0
    mov di, 0
    q1:
       call spawn_single_balloon
       add si, 2
       add di, 1
       loop q1
    ret

; func to spawn a single balloon at index DI (byte) / SI (word)
spawn_single_balloon:
    push ax
    push bx
   
    ; Random X
    call randomnumbergenerator ; Uses si to store X
   
    ; Set Y to bottom (190)
    mov word [baloonycoordinates + si], 190
   
    ; Set Status to Active
    mov byte [baloonstatus + di], 1
   
    ; Assign random letter
    call random_number_0_25
    mov al, [letters]
    mov [baloonletters + di], al
   
    ; Assign random color
      mov al, [colourcount]
    inc al
    and al, 0x0F        ; range 0–15

check_color:
    cmp al, 0
    je  next_color
    cmp al, 14      
    je  next_color
    cmp al, 15    
    je  next_color
    cmp al, 9        
    je  next_color
    cmp al, 10         
    je  next_color
    jmp store_color
next_color:
    inc al
    and al, 0x0F
    jmp check_color

store_color:
    mov [colourcount], al
    mov [balooncolours + di], al
  pop bx
    pop ax
    ret

updatebaloon:
    mov cx, [maxbaloon]
    mov si, 0
    mov bx, 0 ; Index
q2:
    push cx
   
    ; Check if active
    cmp byte [baloonstatus + bx], 1
    je is_active
   
    ; If inactive, remove and redraw new balloon
    mov di, bx ; DI needed for spawn
    call spawn_single_balloon
    jmp next_update
   
is_active:
    ; Move up


lkk:
    mov dx, [speed]
    sub word [baloonycoordinates + si], dx ; Speed
   
    ; Check if reached top
    cmp word [baloonycoordinates + si], 18
    jg next_update
   
    ; If reached top, remove and redraw new balloon
    dec byte [lives]
    mov al, [lives]
    add al, '0'
    mov [lives_str + 7], al
    
    cmp byte [lives], 0
    jg respawn_balloon
    
    mov byte [flaggameover], 1
    jmp next_update

respawn_balloon:
    mov di, bx
    call spawn_single_balloon
   
next_update:  
    pop cx
    add si, 2
    add bx, 1
    loop q2
    ret


drawall:
   
    mov cx, [maxbaloon]
    mov si, 0
    mov bx, 0
q3:
    push bx
    push cx
    cmp byte[baloonstatus + bx], 1
    jne skip
   
    ; Get color
    mov al, [balooncolours + bx]
   
    qa:
    mov bx, 10
    mov cx, [baloonxcoordinates+si]
    mov dx, [baloonycoordinates+si]
    call drawFilledCircle
    mov bx, 10
    mov cx, [baloonxcoordinates+si]
    mov dx, [baloonycoordinates+si]
    mov al, 0x00
    call drawCircleOutline
    mov bx, 10
    push bx
    push word [baloonxcoordinates+si]
    push word [baloonycoordinates+si]
    mov ah, 0
    mov al, 0x00
    push ax
    call drawString
   
    ; Draw the letter for this balloon
    mov bp, sp
    mov bx, [bp+2]             ; Restore index to bx
    call draw_balloon_letter

 
    skip:
       
          pop cx
          pop bx
        add si, 2
        add bx, 1
       
        loop q3
       
        ret
   

timer:
    push ax
    push ds
   
    push cs
    pop ds
   
    cmp byte [timerRunning], 1
    jne timer_end
   
    inc word [tickCount]
    cmp word [tickCount], 18
    jb timer_end
   
    mov word [tickCount], 0
    inc word [seconds]

    
call check_20_seconds_passed
call check_40_seconds_passed
call check1minute
   
    cmp word [seconds], 60
    jb update_display
   
    mov word [seconds], 0
    inc word [minutes]
   
    cmp word [minutes], 2
    jb update_display
   
    mov byte [timerRunning], 0
    jmp timer_end


update_display:
    call update_time_display

timer_end:
    mov al, 0x20
    out 0x20, al
    pop ds
    pop ax
    iret

update_time_display:
    push ax
    push bx
    push cx
    push dx
    push si
    push di
   
    mov ax, [minutes]
    mov si, temp_buffer
    call word_to_string
   
    mov di, time_str + 6
    mov al, [temp_buffer]
    mov [di], al
    mov al, [temp_buffer + 1]
    mov [di + 1], al
   
    mov ax, [seconds]
    mov si, temp_buffer
    call word_to_string
   
    mov di, time_str + 9
    mov al, [temp_buffer]
    mov [di], al
    mov al, [temp_buffer + 1]
    mov [di + 1], al
   
 
   
    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret

word_to_string:
    push ax
    push bx
    push dx
   
    mov bx, 10
    xor dx, dx
    div bx
   
    add al, '0'
    mov [si], al
   
    add dl, '0'
    mov [si + 1], dl
   
    mov byte [si + 2], 0
   
    pop dx
    pop bx
    pop ax
    ret
check_20_seconds_passed:
    cmp word [seconds], 20
    je cv           ; jump to end if seconds < 20
 level_done1:   
skiptimer20:
    ret

cv:     mov si, levelstring + 7 
    inc byte [si]
    cmp byte [si], '9'
    jle level_done1      
    
    mov byte [si], '1'  
    add word[speed], 10

    
jmp skiptimer20

check_40_seconds_passed:
    cmp word [seconds], 40
    je cvv        
 level_done2:   
skiptimer40:
    ret


cvv:    
    mov si, levelstring + 7 
    inc byte [si]
    cmp byte [si], '9'
    jle level_done2         
    
    mov byte [si], '1'   
    add word[speed], 10
jmp skiptimer40


check1minute:
    cmp word [minutes], 1
    je dothis
    ret

dothis:
    mov byte [flaggameover],1 
    ret


check_time_up:
    cmp word [minutes], 2
    jb time_not_up
    mov ax, 0x0003
    int 0x10
    mov ax, 0x4C00
    int 0x21
time_not_up:
    ret

putpixel:
    push ax
    push bx
    push cx
    push dx
    push di
    push es
    mov ax, 0A000h
    mov es, ax
    mov ax, 320
    mul dx
    add ax, cx
    mov di, ax
    mov [es:di], al
    pop es
    pop di
    pop dx
    pop cx
    pop bx
    pop ax
    ret

drawHLine:
    push ax
    push cx
    push dx
    push di
    push es
   
    ; Save parameters
    mov [hx1], cx
    mov [hx2], bx
    mov [hy], dx
    mov [hcolor], al
   
    mov ax, 0A000h
    mov es, ax
   
    mov ax, [hy]      
    mov dx, 320
    mul dx          
    add ax, [hx1]  
    mov di, ax      
   
    ; Getting line length
    mov cx, [hx2]  
    sub cx, [hx1]    ; cx = x2 - x1
    inc cx           ; cx = number of pixels
   
    mov al, [hcolor]
   
hloop:
    mov [es:di], al
    inc di
    loop hloop

    pop es
    pop di
    pop dx
    pop cx
    pop ax
    ret

drawFilledCircle:
    pusha
    push si
    push di
    push bp

    mov [circleColor], al
    mov [centerX], cx
    mov [centerY], dx
   
    mov si, 0          
    mov di, bx        
   
    ; d = 3 - 2 * radius
    mov bp, 3
    mov ax, bx
    shl ax, 1        
    sub bp, ax         ; bp = d = 3 - 2*radius

fill_loop:
   
    mov cx, [centerX]
    sub cx, si         ; left = cx - x
    mov bx, [centerX]
    add bx, si         ; right = cx + x
    mov dx, [centerY]
    add dx, di         ; y = cy + y
    mov al, [circleColor]
    call drawHLine
   
    mov cx, [centerX]
    sub cx, si         ; left = cx - x
    mov bx, [centerX]
    add bx, si         ; right = cx + x
    mov dx, [centerY]
    sub dx, di         ; y = cy - y
    mov al, [circleColor]
    call drawHLine
   
    mov cx, [centerX]
    sub cx, di         ; left = cx - y
    mov bx, [centerX]
    add bx, di         ; right = cx + y
    mov dx, [centerY]
    add dx, si         ; y = cy + x
    mov al, [circleColor]
    call drawHLine
   
    mov cx, [centerX]
    sub cx, di         ; left = cx - y
    mov bx, [centerX]
    add bx, di         ; right = cx + y
    mov dx, [centerY]
    sub dx, si         ; y = cy - x
    mov al, [circleColor]
    call drawHLine

    ; Update decision parameter
    cmp bp, 0
    jl skip_update
        ; if d >= 0
        dec di          
        mov ax, si
        sub ax, di      
        shl ax, 2        
        add ax, 10        
        add bp, ax         ; d = d + 4*(x - y) + 10
        jmp cont_fill
skip_update:
    ; if d < 0
    mov ax, si
    shl ax, 2            
    add ax, 6            
    add bp, ax             ; d = d + 4*x + 6

cont_fill:
    inc si              
    cmp si, di
    jle fill_loop

    pop bp
    pop di
    pop si
    popa
    ret

drawCircleOutline:
    pusha
    push si
    push di
    push bp

    mov [circleColor], al
    mov [centerX], cx
    mov [centerY], dx
   
    mov si, 0        
    mov di, bx      
   
    ; d = 3 - 2 * radius
    mov bp, 3
    mov ax, bx
    shl ax, 1        
    sub bp, ax         ; bp = d = 3 - 2*radius

circle_loop:
    mov al, [circleColor]
   
    ; (x, y)
    mov cx, [centerX]
    add cx, si
    mov dx, [centerY]
    add dx, di
    call putpixel
   
    ; (-x, y)
    mov cx, [centerX]
    sub cx, si
    mov dx, [centerY]
    add dx, di
    call putpixel
   
    ; (x, -y)
    mov cx, [centerX]
    add cx, si
    mov dx, [centerY]
    sub dx, di
    call putpixel
   
    ; (-y, -x)
    mov cx, [centerX]
    sub cx, si
    mov dx, [centerY]
    sub dx, di
    call putpixel
   
    ; (y, x)
    mov cx, [centerX]
    add cx, di
    mov dx, [centerY]
    add dx, si
    call putpixel
   
    ; (-y, x)
    mov cx, [centerX]
    sub cx, di
    mov dx, [centerY]
    add dx, si
    call putpixel
   
    ; (y, -x)
    mov cx, [centerX]
    add cx, di
    mov dx, [centerY]
    sub dx, si
    call putpixel
   
    ; (-y, -x)
    mov cx, [centerX]
    sub cx, di
    mov dx, [centerY]
    sub dx, si
    call putpixel

    ; Updating the decision parameter
    cmp bp, 0
    jl skip_update2
        ; if d >= 0
        dec di            
        mov ax, si
        sub ax, di        
        shl ax, 2        
        add ax, 10      
        add bp, ax         ; d = d + 4*(x - y) + 10
        jmp cont2
skip_update2:
    ; if d < 0
    mov ax, si
    shl ax, 2              
    add ax, 6              
    add bp, ax             ; d = d + 4*x + 6

cont2:
    inc si                
    cmp si, di
    jle circle_loop

    pop bp
    pop di
    pop si
    popa
    ret
drawString:
    push bp
    mov bp, sp
    pusha
    mov ax, [bp+10]
    add ax, [bp+6]
    mov [bp+6], ax
    mov ax, 320
    mul word [bp+6] ; y coor
    add ax, [bp+8] ;x coor
    mov di, ax
    mov ax, 0xA000
    mov es, ax
    mov cx, 10
    mov al, [bp+4]; colour
    l1z:
        mov [es:di], al
        add di, 320
        loop l1z
    popa
    pop bp
    ret 8

print_text:
    push bp
    mov bp, sp
    pusha
   
    mov si, [bp+6]  
    mov dx, [bp+4]    
    mov bl, [bp+8]    
   
    mov ah, 0x02
    mov bh, 0x00
    int 0x10
   
print_loop:
    lodsb            
    cmp al, 0
    je done_print
   
    mov ah, 0x09    
    mov bh, 0x00
    mov bl, 0x3F    
    mov cx, 1        
    int 0x10
   
    mov ah, 0x02
    inc dl
    int 0x10
   
    jmp print_loop
   
done_print:
    popa
    pop bp
    ret 6

; Setting Cyan background
FillScreenCyan:
    push es
    push di
    push cx
    push ax
   
    mov ax, 0xA000
    mov es, ax
    mov di, 0
    mov cx, 32000    
    mov ax, 0x0B0B  
    rep stosw
   
    pop ax
    pop cx
    pop di
    pop es
    ret

print_letter:
    push es
    push di
    push ax
    push bx
    push cx
   
    mov ax, 0A000h
    mov es, ax
   
    mov cx, 3
letter_loop:
    mov [es:di], bl  
    add di, 320      
    loop letter_loop
   
    pop cx
    pop bx
    pop ax
    pop di
    pop es
    ret

; Clear Game Area (ScrollUp)
ClearGameArea:
    push es
    push di
    push cx
    push ax
   
    mov ax, 0xA000
    mov es, ax
   
    ; Start from line 8 (320 * 8 = 2560)
    mov di, 2560
   
    ; Clear until line 200 (192 lines) 192 * 320 = 61440 bytes 61440 / 2 = 30720 words
    mov cx, 30720
    mov ax, 0x0B0B ; Cyan
    rep stosw
   
    pop ax
    pop cx
    pop di
    pop es
    ret


Delay:
    push cx
    push dx
    push bx

    mov bx, 0x0002    ; outer loop
delay_outer:
    mov cx,0x009F    ; middle loop
delay_middle:
    mov dx, 0x089F    ; inner loop
delay_inner:
    dec dx
    jnz delay_inner
    loop delay_middle
    dec bx
    jnz delay_outer
   
    pop bx
    pop dx
    pop cx
    ret

Delayversion2:
    push cx
    push dx
    push bx

    mov bx, 0x0002    ; outer loop
delayv_outer:
    mov cx,0x01FF    ; middle loop
delayv_middle:
    mov dx, 0x09FF    ; inner loop
delayv_inner:
    dec dx
    jnz delayv_inner
    loop delayv_middle
    dec bx
    jnz delayv_outer
   
    pop bx
    pop dx
    pop cx
    ret



clrscr:
    push es
    push ax
    push di
    mov ax, 0xb800
    mov es, ax

    looping:
        mov word[es:di], 0x0720
        add di, 2
        cmp di, 4000
        jnz looping

pop di
pop ax
pop es
        ret

eraseall:
    mov cx, [maxbaloon]
    mov si, 0
    mov bx, 0

e_loop:
    push cx
    cmp byte [baloonstatus + bx], 1
    jne e_skip

    mov di, 15          
    mov cx, [baloonxcoordinates + si]
    mov dx, [baloonycoordinates + si]
    mov al, 0x0B
    mov bx, di
    call drawFilledCircle
    mov bx, 10
    push bx
    push word [baloonxcoordinates+si]
    push word [baloonycoordinates+si]
    mov ah, 0
    mov al, 0x0B
    push ax
    call drawString

e_skip:
    pop cx
    add si, 2
    inc bx
    loop e_loop
    ret


update_level:
     push ax
    push si
     mov si, levelstring + 7 
       inc byte [si]
        cmp byte [si], '9'
    jle level_done 
    mov byte [si], '1'
level_done:
    pop si
    pop ax
    ret

update_score:
    push ax
    push bx
    push si
   
    mov si, score_str + 9    ; Last digit of score str
   
    inc byte [si]
    cmp byte [si], '9'
    jle score_done
   
    mov byte [si], '0'
    dec si
    inc byte [si]
    cmp byte [si], '9'
    jle score_done
   
    mov byte [si], '0'
    dec si
    inc byte [si]
    cmp byte [si], '9'
    jle score_done
   
    mov byte [si], '0'
    dec si
    inc byte [si]
   
score_done:
    pop si
    pop bx
    pop ax
    ret

check_keyboard:
    mov ah, 01h
    int 16h
    jz ck_done
   
    mov ah, 00h
    int 16h
    ; AL has char
   
    
    cmp al, 'a'
    jb ck_upper
    cmp al, 'z'
    ja ck_done
    sub al, 'a'
    jmp ck_process
ck_upper:
    cmp al, 'A'
    jb ck_done
    cmp al, 'Z'
    ja ck_done
    sub al, 'A'
ck_process:
    ; AL is 0-25
    mov cx, [maxbaloon]
    mov bx, 0
ck_loop:
    cmp byte [baloonstatus + bx], 1
    jne ck_next
    cmp [baloonletters + bx], al
    jne ck_next
   
    ; Match
    mov byte [baloonstatus + bx], 0
call play_pop_sound
    call update_score
    jmp ck_done          ; Remove one and return
   
ck_next:
    inc bx
    loop ck_loop
   
ck_done:
    ret

play_simple_beep:
    mov ah, 0Eh
    mov al, 7
    int 10h
    ret
play_shoot_sound:
    push ax
    push cx
    mov al, 182
    out 43h, al
    mov ax, 2000
    out 42h, al
    mov al, ah
    out 42h, al
    in al, 61h
    or al, 3
    out 61h, al
    mov cx, 8000
shoot_delay:
    loop shoot_delay
    in al, 61h
    and al, 0FCh
    out 61h, al
    pop cx
    pop ax
    ret

play_pop_sound:
    push ax
    push cx
    mov al, 182
    out 43h, al
    mov ax, 800
    out 42h, al
    mov al, ah
    out 42h, al
    in al, 61h
    or al, 3
    out 61h, al
    mov cx, 000
pop_delay:
    loop pop_delay
    in al, 61h
    and al, 0FCh
    out 61h, al
    pop cx
    pop ax
    ret

startbaloon: 
    pusha

;baloon 1
    mov bx, 13
    mov cx, 40
    mov dx, 140
    mov al, 0x02
    call drawFilledCircle
    mov bx, 13
    mov cx, 40
    mov dx, 140
    mov al, 0x00
    call drawCircleOutline
    mov bx, 13
    push bx
    push word 40
    push word 140
    mov ah, 0
    mov al, 0x0e
    push ax
    call drawString
    mov ax, 0
    mov al, 22
    push ax
    mov ax, 140
    push ax
    mov ax, 40
    push ax
    call drawletter

;baloon 2
    mov bx, 13
    mov cx, 80
    mov dx, 150
    mov al, 0x03
    call drawFilledCircle
    mov bx, 13
    mov cx, 80
    mov dx, 150
    mov al, 0x00
    call drawCircleOutline
    mov bx, 13
    push bx
    push word 80
    push word 150
    mov ah, 0
    mov al, 0x0e
    push ax
    call drawString
    mov ax, 0
    mov al, 4
    push ax
    mov ax, 150
    push ax
    mov ax, 80
    push ax
    call drawletter
;baloon 3 
    mov bx, 13
    mov cx, 120
    mov dx, 140
    mov al, 0x02
    call drawFilledCircle
    mov bx, 13
    mov cx, 120
    mov dx, 140
    mov al, 0x00
    call drawCircleOutline
    mov bx, 13
    push bx
    push word 120
    push word 140
    mov ah, 0
    mov al, 0x0e
    push ax
    call drawString
    mov ax, 0
    mov al, 11
    push ax
    mov ax, 140
    push ax
    mov ax, 120
    push ax
    call drawletter

;baloon 2
    mov bx, 13
    mov cx, 160
    mov dx, 150
    mov al, 0x03
    call drawFilledCircle
    mov bx, 13
    mov cx, 160
    mov dx, 150
    mov al, 0x00
    call drawCircleOutline
    mov bx, 13
    push bx
    push word 160
    push word 150
    mov ah, 0
    mov al, 0x0e
    push ax
    call drawString
    mov ax, 0
    mov al, 2
    push ax
    mov ax, 150
    push ax
    mov ax, 160
    push ax
    call drawletter
;baloon 5 
    mov bx, 13
    mov cx, 200
    mov dx, 140
    mov al, 0x02
    call drawFilledCircle
    mov bx, 13
    mov cx, 200
    mov dx, 140
    mov al, 0x00
    call drawCircleOutline
    mov bx, 13
    push bx
    push word 200
    push word 140
    mov ah, 0
    mov al, 0x0e
    push ax
    call drawString
    mov ax, 0
    mov al, 14
    push ax
    mov ax, 140
    push ax
    mov ax, 200
    push ax
    call drawletter

;baloon 6
    mov bx, 13
    mov cx, 240
    mov dx, 150
    mov al, 0x03
    call drawFilledCircle
    mov bx, 13
    mov cx, 240
    mov dx, 150
    mov al, 0x00
    call drawCircleOutline
    mov bx, 13
    push bx
    push word 240
    push word 150
    mov ah, 0
    mov al, 0x0e
    push ax
    call drawString
    mov ax, 0
    mov al, 12
    push ax
    mov ax, 150
    push ax
    mov ax, 240
    push ax
    call drawletter

;baloon 7
    mov bx, 13
    mov cx, 280
    mov dx, 140
    mov al, 0x02
    call drawFilledCircle
    mov bx, 13
    mov cx, 280
    mov dx, 140
    mov al, 0x00
    call drawCircleOutline
    mov bx, 13
    push bx
    push word 280
    push word 140
    mov ah, 0
    mov al, 0x0e
    push ax
    call drawString
    mov ax, 0
    mov al, 4
    push ax
    mov ax, 140
    push ax
    mov ax, 280
    push ax
    call drawletter


popa
    ret

instructionpage:
    pusha
    call randomlines
    mov ah, 0x13
    mov al, 1
    mov bh,0
    mov bl, 7
    mov dx, 0x0C06
    mov cx, 24
    push cs
    pop es
    mov bp, string2
    int 0x10
    call Delayversion2
    call clrscrr
    call randomlines
    mov ah, 0x13
    mov al, 1
    mov bh,0
    mov bl, 3
    mov dx, 0x0804
    mov cx, 31
    push cs
    pop es
    mov bp, string3
    int 0x10
    mov ah, 0x13
    mov al, 1
    mov bh,0
    mov bl, 4
    mov dx, 0x0A05
    mov cx, 27
    push cs
    pop es
    mov bp, string4
    int 0x10
        mov ah, 0x13
    mov al, 1
    mov bh,0
    mov bl, 4
    mov dx, 0x0C0C
    mov cx, 12
    push cs
    pop es
    mov bp, string5
    int 0x10
        mov ah, 0x13
    mov al, 1
    mov bh,0
    mov bl, 3
    mov dx, 0x0E04
    mov cx, 32
    push cs
    pop es
    mov bp, string6
    int 0x10
    mov ah, 0x13
    mov al, 1
    mov bh,0
    mov bl, 3
    mov dx, 0x1008
    mov cx, 26
    push cs
    pop es
    mov bp, string7
    int 0x10
     mov ah, 0x13
    mov al, 1
    mov bh,0
    mov bl, 4
    mov dx, 0x1208
    mov cx, 23
    push cs
    pop es
    mov bp, string8
    int 0x10
popa
    ret


startscreen: 
pusha
mov ax, 13h
int 10h
 call clrscr
  call randomlines
  call startprint
  call printplay
  call startbaloon
call clrscr
mov ah, 00h
int 16h 
call clrscrr
call instructionpage
call Delayversion2
mov ah, 00h
int 16h 
popa
ret

endgame: 
    mov ax, 0003h
    int 10h
    ;ending 
 ret



start:
    call startscreen

    xor ax, ax
    mov es, ax
    mov ax, [es:8*4]
    mov [oldTimer], ax
    mov ax, [es:8*4+2]
    mov [oldTimer+2], ax
   
    cli
    mov word [es:8*4], timer
    mov [es:8*4+2], cs
    sti

game_init:
    mov ax, 0013h
    int 10h
   
    call FillScreenCyan

    mov ax, 0A000h
    mov es, ax

    ; Reset Game State
    mov byte [lives], 3
    mov byte [lives_str + 7], '3'
    mov word [score_str + 7], '00' ; Reset score digits
    mov word [score_str + 9], '00'
    mov word [time_str + 6], '00'  ; Reset time digits
    mov word [time_str + 9], '00'
    mov word [seconds], 0
    mov word [minutes], 0
    mov word [tickCount], 0
    mov byte [timerRunning], 1
    mov byte [levelstring + 7], '1'
    mov word [speed], 2
    mov byte [flaggameover], 0
    
    ; Clear balloons
    mov cx, 5
    mov bx, 0
clear_balloons_loop:
    mov byte [baloonstatus + bx], 0
    inc bx
    loop clear_balloons_loop

    ; Initial Draw
    mov dx, 0x0000 ; Row 0 Col 0
    mov bl, 0x3F      
    mov si, score_str
    push bx
    push si
    push dx
    call print_text

    mov dx, 0x000C ; Row 0 Col 12
    mov bl, 0x3F      
    mov si, levelstring
    push bx
    push si
    push dx
    call print_text

    mov dx, 0x0015 ; Row 0 Col 21
    mov bl, 0x3F
    mov si, lives_str
    push bx
    push si
    push dx
    call print_text

    mov dx, 0x001D ; Row 0 Col 29
    mov bl, 0x3F      
    mov si, time_str
    push bx
    push si
    push dx
    call print_text

    call baloonscoming
 gameloop:
    mov dx, 0x001D ; Row 0 Col 29
    mov bl, 0x3F      
    mov si, time_str
    push bx
    push si
    push dx
    call print_text

    mov dx, 0x0015 ; Row 0 Col 21
    mov bl, 0x3F
    mov si, lives_str
    push bx
    push si
    push dx
    call print_text

    mov dx, 0x000C ; Row 0 Col 12
    mov bl, 0x3F      
    mov si, levelstring
    push bx
    push si
    push dx
    call print_text
   
    call ClearGameArea ; ScrollUp
    call updatebaloon

    call drawall
    call check_keyboard ; check for input

    ; process key and pop matching balloon
     mov dx, 0x0000 ; Row 0, Col 0
    mov bl, 0x3F      
    mov si, score_str
    push bx
    push si
    push dx
    call print_text

    call Delay
        cmp byte[flaggameover], 1
        je moveout
    jmp gameloop
moveout:
    call clrscrr
    mov ax, 0003h
    int 10h
    call game_over_start

exitgame: 
    mov ax, 4C00h
    int 21h




game_over:
    db '  GGGG    AAAA   M    M  EEEEE        OOO   V    V  EEEEE  RRRR  ', 0
    db ' G       A    A  MM  MM  E           O   O  V    V  E      R   R ', 0
    db ' G  GGG  AAAAAA  M MM M  EEEE        O   O  V    V  EEEE   RRRR  ', 0
    db ' G    G  A    A  M    M  E           O   O   V  V   E      R R   ', 0
    db '  GGGG   A    A  M    M  EEEEE        OOO     VV    EEEEE  R   R ', 0
    db 0

game_over_block:
    db ' @@@@@@  @@@@@@  @@@  @@@  @@@@@@@    @@@@@@   @@@  @@@ @@@@@@@ @@@@@@ ', 0
    db '@@      @@    @@ @@@@ @@@@ @@         @@    @@ @@@  @@@ @@      @@  @@', 0
    db '@@  @@@ @@@@@@@@ @@ @@@ @@ @@@@@      @@    @@ @@@  @@@ @@@@@   @@@@@ ', 0
    db '@@   @@ @@    @@ @@    @@  @@         @@    @@  @@  @@  @@      @@ @@ ', 0
    db ' @@@@@@ @@    @@ @@    @@  @@@@@@@    @@@@@@     @@@@   @@@@@@@ @@  @@', 0
    db 0

game_over_shadow:
    db ' ######  ######  ###  ###  #######    #####   ###  ### ####### ###### ', 0
    db '##      ##    ## #### #### ##        ##    ## ###  ### ##      ##  ##', 0
    db '##  ### ######## ## ### ## #####     ##    ## ###  ### #####   ##### ', 0
    db '##   ## ##    ## ##     ## ##        ##    ##  ##  ##  ##      ## ## ', 0
    db ' ###### ##    ## ##     ## #######    ######    ####   ####### ##  ##', 0
    db 0

game_over1:
    db ' ======  ======   ====   ===  ======    ======   =   ==   ========  ====== ', 0
    db '==      ==    ==  ===    ===  ==        ==    =  =   ==   ==        ==    = ', 0
    db '=  ==== =======   ==  ===  =  ======    ==    =  =   ==   =======   =====  ', 0
    db '==    = ==    ==  ==   =   =  ==        ==    =  =   ==   ==        ==  ==   ', 0
    db ' ====== ==    ==  ==   =   =  ======    ======     ==     ========  ==    ==  ', 0
    db 0

game_over2:
    db ' ++++++  ++++++  ++++  ++++ ++++++     ++++++  ++++  ++++ ++++++  +++++ ', 0
    db '+        +    + +  ++  ++ + ++         +    ++  ++    ++  ++      +    + ', 0
    db '+  ++++ +++++++ +   +++   + +++++      +    ++   ++  ++   +++++   +++++  ', 0
    db '+    +  +      + +    +   + ++         +    ++    +  +    ++      +   +  ', 0
    db ' ++++++ +      + +    +   + ++++++     +++++++     ++     ++++++  +     +  ', 0
    db 0

game_over3:
    db ' ******  ******  ****  ****  ******    ******   ***    *** ****** ****** ', 0
    db '*       **    *  *  **  ***  **        **   **  **     **  **     *   ** ', 0
    db '*  **** *******  *   **   *  *****     **   **   **    **  ****   *****  ', 0
    db '*    *  *      * *    *   *  **        **   **     *  *    **      *   **  ', 0
    db ' ****** *      * *    *   *  *****     ******       **     ******  *     **', 0
    db 0

game_over4:
    db ' %%%%%%  %%%%%%  %%%%  %%%% %%%%%%     %%%%%% %    % %%%%% %%%%%%  ', 0
    db '%       %    %   %  %%  %%  %         %     % %    % %%    %    % ', 0
    db '%  %%%% %%%%%%%  %   %%   % %%%%%     %     % %    % %%%%% %%%%%  ', 0
    db '%    %  %      % %    %   % %         %     % %    % %      %   %   ', 0
    db ' %%%%%% %      % %    %   % %%%%%     %%%%%%    %%   %%%%%% %     %  ', 0
    db 0

game_over5:
    db ' &&&&&&  &&&&&&  &&&&  &&&& &&&&&&     &&&&&& &      &  &&&&&& &&&&& ', 0
    db '&        &     & &   &&   & &         &     &  &     &  &      &    & ', 0
    db '&  &&&&  &&&&&&& &   &&   & &&&&&     &     &   &   &   &&&&&  &&&&&  ', 0
    db '&    &   &      & &   &   & &         &     &    & &    &      &   &   ', 0
    db ' &&&&&&  &      & &   &   & &&&&&&    &&&&&&      &     &&&&&& &     &  ', 0
    db 0

game_over6:
    db ' $$$$$$  $$$$$$ $$$$$  $$$$ $$$$$$     $$$$$$  $       $ $$$$$$ $$$$$ ', 0
    db '$        $   $  $  $$  $$ $ $          $    $   $     $  $      $    $ ', 0
    db '$  $$$$ $$$$$$$ $   $$$   $ $$$$$$     $    $    $   $   $$$$   $$$$$  ', 0
    db '$    $  $     $ $    $    $ $          $    $     $ $    $      $   $   ', 0
    db ' $$$$$$ $     $ $    $    $ $$$$$$     $$$$$$      $     $$$$$$ $    $  ', 0
    db 0

game_over8:
    db ' |||||   ||||||  ||||   |||| ||||||    |||||||  |     | |||||| ||||| ', 0
    db '|        |    |  |  ||  || | | |       |     |  |     | |      |   |  ', 0
    db '|  |||   ||||||  |    ||   | |||||     |     |   |   |  |||||  |||||  ', 0
    db '|    |   |    |  |    |    | | |       |     |    | |   |      |  |   ', 0
    db ' |||||   |    |  |    |    | ||||||    |||||||     |    |||||| |   |  ', 0
    db 0

press_key: db '>> PRESS ANY KEY <<', 0
border:    db '========================================', 0

game_over_styles:
    dw game_over, game_over_block, game_over_shadow, game_over1, game_over2
    dw game_over3, game_over4, game_over5, game_over6, game_over8
total_styles: db 10

colors:
    db 0x0C, 0x09, 0x0D, 0x0F, 0x01, 0x02, 0x03, 0x04, 0x06, 0x07,0x0E, 0x0B , 0x0A
color_index: db 0
current_row: db 10
current_col: db 4
total_colors: db 13
current_style: db 0
Delay_GO_Long:
    push cx
    push dx
    push bx
    mov bx, 0x0002
delay_outer_go:
    mov cx, 0x02FF
delay_middle_go:
    mov dx, 0x0FFF
delay_inner_go:
    dec dx
    jnz delay_inner_go
    loop delay_middle_go
    dec bx
    jnz delay_outer_go
    pop bx
    pop dx
    pop cx
    ret

Delay_GO_Short:
    push cx
    mov cx, 0x5FFF
delay_loop_go:
    dec cx
    jnz delay_loop_go
    pop cx
    ret

set_cursor:
    mov ah, 0x02
    mov bh, 0x00
    int 0x10
    ret

print_char_color:
    mov ah, 0x09
    mov bh, 0x00
    mov cx, 0x0001
    int 0x10
    ret

clear_screen_purple:
    push es
    mov ax, 0xB800
    mov es, ax
    mov di, 0
    mov cx, 2000
    mov al, '.'
    mov ah, 0x8F
   
clear_loop_go:
    mov [es:di], ax
    add di, 2
    loop clear_loop_go
    pop es
    ret

print_border:
    mov si, border
    mov dh, 3
    mov dl, 18
    call set_cursor
border_loop:
    lodsb
    cmp al, 0
    je border_done
    mov bl, 0x0A
    call print_char_color
    inc dl
    call set_cursor
    jmp border_loop
border_done:
    mov si, border
    mov dh, 20
    mov dl, 18
    call set_cursor
border_loop2:
    lodsb
    cmp al, 0
    je border_done2
    mov bl, 0x0A
    call print_char_color
    inc dl
    call set_cursor
    jmp border_loop2
border_done2:
    ret

clear_game_area:
    mov dh, 9
    mov cx, 7
clear_rows:
    mov dl, 0
    push cx
    mov cx, 80
clear_cols:
    push cx
    call set_cursor
    mov al, ' '
    mov bl, 0x0F
    call print_char_color
    inc dl
    pop cx
    loop clear_cols
    pop cx
    inc dh
    loop clear_rows
    ret

print_animated:
    call Delay_GO_Long
    call clear_game_area
    mov al, [current_style]
    mov ah, 0
    mov bx, ax
    shl bx, 1
    mov si, [game_over_styles + bx]
    mov dh, [current_row]
print_lines:
    mov dl, [current_col]
print_chars:
    lodsb
    cmp al, 0
    je next_line
    push si
    push ax
    call set_cursor
    pop ax
   
    mov bl, [color_index]
    mov bh, 0
    mov di, colors
    add di, bx
    mov bl, [di]
   
    call print_char_color
    inc dl
    call set_cursor
    pop si
    call Delay_GO_Short
    mov ah, 0x01
    int 0x16
    jnz exit_program_jmp
    jmp print_chars
next_line:
    lodsb
    cmp al, 0
    je print_done_go
    dec si
    inc dh
    jmp print_lines
print_done_go:
    ret

exit_program_jmp:
    jmp exit_program

print_press_key:
    mov si, press_key
    mov dh, 22
    mov dl, 28
    call set_cursor
press_loop:
    lodsb
    cmp al, 0
    je press_done
    mov bl, 0x0A
    call print_char_color
    inc dl
    call set_cursor
    jmp press_loop
press_done:
    ret

check_key_press:
    mov ah, 0x01
    int 0x16
    ret

clear_keyboard_buffer:
    mov ah, 0x0C
    mov al, 0x00
    int 0x21
    ret

exit_program:
    ; Cchecking which key was pressed
    mov ah, 0x00
    int 0x16 ; Get the key
    
    cmp al, 'r'
    je restart_game_jump
    cmp al, 'R'
    je restart_game_jump

    call clear_keyboard_buffer
    mov ax, 0x0003
    int 0x10
    mov ax, 0x4C00
    int 0x21

restart_game_jump:
    jmp game_init

game_over_start:
    cli
    mov byte [timerRunning], 0
    sti

    call clear_screen_purple
    call print_border
    mov dx, 0x0000 ; Row 0, Col 0
    mov bl, 0x3F      
    mov si, score_str
    push bx
    push si
    push dx
    call print_text


main_loop_go:
    mov byte [color_index], 0
color_cycle:
    call check_key_press
    jnz exit_program
    mov byte [current_style], 0
style_cycle:
    call check_key_press
    jnz exit_program
    call print_animated
    call print_press_key
    mov cx, 3
wait_style:
    call Delay_GO_Short
    call check_key_press
    jnz exit_program
    loop wait_style
    inc byte [current_style]
    mov al, [current_style]
    cmp al, [total_styles]
    jb style_cycle
    mov cx, 5
wait_color:
    call Delay_GO_Short
    call check_key_press
    jnz exit_program
    loop wait_color
    inc byte [color_index]
    mov al, [color_index]
    cmp al, [total_colors]
    jb color_cycle
    mov byte [color_index], 0
    call check_key_press
    jz main_loop_go
    
    ; Checking for game restart request 
    mov ah, 0x00
    int 0x16
    cmp al, 'r'
    je restart_game_jump
    cmp al, 'R'
    je restart_game_jump
    
    jmp exit_program


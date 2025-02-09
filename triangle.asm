;  Program name: "Triangle Assignment". Calculates the 3rd Side of a Triangle given the other information of the Triangle
;  Copyright (C) 2025  Brian Ayala

;  This file is part of the software program "Triangle Assignment".

;  "Triangle Assignment" is free software: you can redistribute it and/or modify
;  it under the terms of the GNU General Public License as published by
;  the Free Software Foundation, either version 3 of the License, or
;  (at your option) any later version.

;  "Triangle Assignment" is distributed in the hope that it will be useful,
;  but WITHOUT ANY WARRANTY; without even the implied warranty of
;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;  GNU General Public License for more details.

;  You should have received a copy of the GNU General Public License
;  along with this program.  If not, see <hFttps:; www.gnu.org/licenses/>. 

;  Author information
;    Author name : Brian Ayala
;    Author email: brianayala2050@gnmail.com
;    Author section: 240-09
;    Author CWID : 884641556

;  For research purpose only. Please don't copy word for word. Avoid academic dishonesty. 

global triangle

extern printf
extern fgets
extern stdin
extern cos
extern sqrt
extern strlen
extern scanf

segment .data
    floatform db "%lf", 0
    sideinputform db "%lf %lf", 0
    stringform db "%s", 0
    prompt_name db "Please enter Last Name: ", 0
    prompt_Title db "Please enter your Title: ", 0
    prompt_side1 db "Please enter 2 sides with ws in between: ", 0
    prompt_angle db "Please enter the angle between the sides (in degrees): ", 0
    output_side3 db "The last side is %lf units", 10, 0
    output_farewell db "Please enjoy your triangle, %s %s", 10, 0
    toRadians dq 0.017453292519943295, 0
    two dq 2.0, 0

segment .bss
    name resb 32    ; Declare 32 bytes to store first and last name
    title resb 32   ; Declare 32 bytes for Title
    side1 resq 1    ; Declare 1 bytes for 1st side of a Triangle
    side2 resq 1    ; Declare 1 bytes for 2nd side of a Triangle
    angle resq 1    ; Declare 1 bytes for angle between sides
    squared resq 1  ; Declare 1 bytes for a^2 + b^2
    side3 resq 1    ; Declare 1 bytes for the answer to the final side;

segment .text
triangle:
    ; Save the base pointer
    push    rbp
    mov     rbp, rsp

    ; Save the general purpose registers
    push    rbx
    push    rcx
    push    rdx
    push    rsi
    push    rdi
    push    r8 
    push    r9 
    push    r10
    push    r11
    push    r12
    push    r13
    push    r14
    push    r15
    pushf

    ; Introduction
    ; Prompt User for last name
    mov     rax, 0
    mov     rdi, stringform
    mov     rsi, prompt_name
    call    printf

    ; Get Last Name Input
    mov     rax, 0
    mov     rdi, name
    mov     rsi, 31
    mov     rdx, [stdin]
    call    fgets

    ; Remove newline char
    mov     rax, 0
    mov     rdi, name
    mov     rsi, 31
    call    strlen
    mov     byte[title + rax - 1], 0

    ; Prompt User for Title
    mov     rax, 0
    mov     rdi, stringform
    mov     rsi, prompt_Title
    call    printf

    ; Get Full Name Input
    mov     rax, 0
    mov     rdi, title
    mov     rsi, 31
    mov     rdx, [stdin]
    call    fgets

    ; Remove newline char
    mov     rax, 0
    mov     rdi, title
    mov     rsi, 31
    call    strlen
    mov     byte[title + rax - 1], 0

    ; Getting Triangle Info
    ; Prompt for Side 1
    mov     rax, 0
    mov     rdi, prompt_side1
    call    printf

    ; Get Side 1
    mov     rax, 0
    mov     rdi, sideinputform
    mov     rsi, side1
    mov     rdx, side2
    call    scanf

    ; Prompt for Angle
    mov     rax, 0
    mov     rdi, prompt_angle
    call    printf

    ; Get Angle
    mov     rax, 0
    mov     rdi, floatform
    mov     rsi, angle
    call    scanf

    ; Store sides into XMM registers
    movsd   xmm0, [side1]
    movsd   xmm1, [side2]

    ; Square each number
    mulsd   xmm0, xmm0          ; a^2
    mulsd   xmm1, xmm1          ; b^2

    ; add both squares together, and store it in xmm4
    addsd   xmm1, xmm0          ; xmm1 = a^2 + b^2
    movsd   [squared], xmm1     ; stores a^2 + b^2 in squared

    ; store angle in xmm0
    movsd   xmm0, [angle]       ; xmm0 = angle

    ; convert degrees to radians
    movsd   xmm2, qword [toRadians]
    mulsd   xmm0, xmm2          ; xmm0 = angle * (pi/180)


    ; cos(angle)
    call    cos                 ; xmm0 = cos(angle)
    movsd   xmm2, xmm0          ; move answer to xmm2

    ; Multiply cos(angle) by 2 * side1 * side 2
    movsd   xmm3, [side1]
    mulsd   xmm3, [side2]       ; a * b
    mulsd   xmm3, qword [two]   ; ab * 2
    mulsd   xmm3, xmm2          ; xmm3 = cos(angle) * 2ab

    ; Compute final part of equation side1^2 side2^2 - 2(side1)(side2)*cos(angle)
    movsd   xmm0, [squared]     ; a^2 + b^2 -> xmm0
    subsd   xmm0, xmm3          ; a^2 + b^2 - (2ab * cos(angle))

    ; compute sqrt and store result in side3
    call sqrt
    movsd [side3], xmm0         ; move answer to side3

    ; print result
    mov     rax, 1
    mov     rdi, output_side3
    movsd   xmm0, [side3]
    call    printf

    ; output farewell message
    mov     rax, 0
    mov     rdi, output_farewell
    mov     rsi, title
    mov     rdx, name
    call    printf

    ; Makes sure return value is side 3
    movsd   xmm0, [side3]
    
    ; Restore the general purpose registers
    popf          
    pop     r15
    pop     r14
    pop     r13
    pop     r12
    pop     r11
    pop     r10
    pop     r9 
    pop     r8 
    pop     rdi
    pop     rsi
    pop     rdx
    pop     rcx
    pop     rbx

    ; Return result
    pop     rbp
    ret
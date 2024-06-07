# Zadaca4-8086

Да се напише асемблерска програма која од 12 битен АД конвертор на растојание од 1ms чита 100 одбирока,
истите ги сместува на последователни локации од меморијата. 


**Resenie:** 

```
IN_PORT EQU 0FFF8h ;адреса на АД конверторот
D_S SEGMENT
IN POLE DW 100 DUP(?) ;поле за 100 одбирока
D_S ENDS
S_S SEGMENT
STACK DW 40 DUP(?)
S_TOP LABEL WORD ;дефинирање стек сегмент
S_S ENDS
C_S SEGMENT
ASSUME CS: C_S,DS:D_S,SS:S_S
MOV AX, D_S ;иницијализација на сегментните рег.
MOV DS, AX
MOV AX, S_S
MOV SS, AX
MOV SP, OFFSET S_TOP
LEA SI, IN_POLE ;позиционирање на SI
MOV BX,100d ;бројач на одбироци
MOV DX, IN_PORT
PAK: IN AX, DX ;читање на 12 битна вредност
AND AX, 0FFFh ;губење на првите 4 бита
MOV [SI],AX ;вредноста од AX се сместува таму каде што покажува SI
CALL WAIT_1MS ;се чека 1ms
INC SI
INC SI ;SI покажува на наредна локација
DEC BX ;сместен е еден одбирок
JNZ PAK ;се додека BX<>0
WAIT_1MS PROC NEAR ;процедура за доцнење
MOV CX, 23F2h ;од INTEL спецификација
OVDE:LOOP OVDE ;се додека CX<>0
RET ;крај на процедурата
WAIT_1MS:ENDP
C_S ENDS ;крај на сегментот
END ;крај на програмата

```
![Screenshot (1)](https://github.com/Ristova123/Zadaca4-8086/blob/main/Zadaca4%20code.png)

**Develop by:**

[Tamara Ristova ](https://github.com/Ristova123)


**Subject**

Microcomputer's systems

**Built With**

This project is built using the following tools:

- [8086 simulator](https://emu8086-microprocessor-emulator.en.softonic.com/?ex=RAMP-2046.0): Assembler and emulator for the Intel 8085 microprocessor.

**Getting Started**

To get a local copy up and running, follow these steps.

**Prerequisites**

In order to run this project you need:

A working computer
Connection to internet
Setup

**How to Run**

To run the program, you need an 8086 emulator or assembler. You can use emulators like DOSBox or TASM (Turbo Assembler). Here's how to run the program using 8086 simulator:

1. Download and install 8086 simulator from [here](https://emu8086-microprocessor-emulator.en.softonic.com/?ex=RAMP-2046.0).
2. Clone this repository to your local machine.
3. Open 8086 simulator and load the `Zadaca4 8086.asm` file.
4. Assemble the code by pressing the Assemble button.
5. Run the program by pressing the Run button or by pressing F10.

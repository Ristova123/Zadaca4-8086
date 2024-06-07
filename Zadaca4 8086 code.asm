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

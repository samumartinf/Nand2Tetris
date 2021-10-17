// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.
// Define variables and set 
@R0
D = M
@n
M = D
@R1
D = M
@R2
M = 0
@m
M = D
@mult 
M = 0
@count 
M = 0

(LOOP)
    @count
    D = M
    @n
    D = M - D
    @SETVAL
    D;JEQ  // if M-D = 0 -> we finished the loop -> jump to setval
    @m
    D = M
    @mult
    M = M + D //mult = mult + m
    @count
    M = M + 1 //increase counter by 1
    @LOOP
    0;JMP

(SETVAL)
    @mult
    D = M
    @R2
    M = D
    @END
    0;JMP

(END)
    @END
    0;JMP


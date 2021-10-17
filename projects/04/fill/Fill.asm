// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
// set end of screen
@24576
D = A
@R0
M = D
@MAIN
0;JMP

(MAIN)
    @count
    M = 0
    @KBD
    D = M
    @BLACKEN
    D;JGT
    @WHITEN
    D;JMP

(WHITEN)
    @SCREEN
    D = A
    @count
    D = D + M
    @R0
    D = M - D
    @MAIN
    D;JEQ //If we have parsed through the whole screen -> jump to main again
    @SCREEN
    D = A
    @count
    A = D + M  // Move to the next address for the screen
    M = 0 // Set to black
    @count 
    M = M + 1
    @WHITEN
    0;JMP

(BLACKEN)
    @SCREEN
    D = A
    @count
    D = D + M
    @R0
    D = M - D
    @MAIN
    D;JEQ //If we have parsed through the whole screen -> jump to main again
    @SCREEN
    D = A
    @count
    A = D + M  // Move to the next address for the screen
    M = -1 // Set to black
    @count 
    M = M + 1
    @BLACKEN
    0;JMP
    

// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

// Pseudocode: 
// R2 = 0; 
// counter = R1; 
// while counter > 0: 
// 	R2 = R2 + R0; 
//	counter = counter - 1; 
// End loop

// sets result to 0
@R2 
M=0 

// sets the counter to R1
@R1
D=M
@counter 
M=D

// mult_loop
(MULT_LOOP)
@counter 
D=M
// test if counter is zero
@INF_LOOP
D;JEQ
@R0
D=M
@R2
M=D+M
@counter
M=M-1
// jumps back to the top of the loop
@MULT_LOOP
0;JMP

// end loop
(INF_LOOP)
@INF_LOOP
0;JMP
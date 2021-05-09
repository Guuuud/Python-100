

//Write a program in HACK assembly, without using symbols, that implements the described Feistel encryption system. 
//The initial key, K0, will be stored in RAM[1], and the 16-bit plaintext will be stored in RAM[2]. 
//The result of the encryption should be stored in RAM[0].

@255
D = A

//now we get the value of R0
@2
D = D & M


//we need to use (not A and B) or (not B and A) to get the F(R0,K0)

//get the value of not R0 
@FR0K0
D = !D
M = D//assign !R0 to M

@R00
M = !D

//get the value of !R0 and key[0]
//
@1
D = M


//

//get !R0 and key[0]
(FFFF)
@FR0K0
D = M & D


//store the value of !R0 and key[0] into a anonymous
@store
M = D

//assign the value of !key[0] to D
@1
D = !M

//get the value of !key[0] and R0
@FR0K0
M = !M
M = D & M
D = M

//store the value of  F(R,K) into  anonymous
@store
M = M | D

//get the value or F(R0,K0)
//@store
//M = D & M


//now we need to get the left part of the plaintext
@32512
D = A

//let's get L
@2
D = M & D

//store left
@left
M = D

//now another XOR L xor F(R0,K0)

//let's get not L and F firstly
//note:store is F(R,K)
@store
D = !D
D = D & M
//M = D//store the value into itself

//store not L and F firstly
@store2
M = D

@store//get the value of not F
D = !M

//let's get not F and L
@left
D = D & M

//let's get R1
@store2
D = D | M
M = D

@storeR1
M = D

@storeR1R1
M = D

@storeR1R1R1
M = D

@storeR1R1R1R1
M = D

@storeR1R1R1R1R1
M = D
//---------------------------------
//let's get key[1]
@1
D = M

@128
D = D - A

@key11
D;JGE
@key12
D;JLT

(key12)
@1
D = M
D = D + M
M = D

@jump
D;JMP

(key11)
@1
D = D
M = D
D = D + M
D = D + 1
M = D
//let's store key[1]
(jump)
@key
M = D
D = M

//--------------------------------------------
//let's get F(R1,K1)
//let's get not R1 and K1
//note:storeR1 is R1
//now let's store (not R1 and K1)
@storeR1
M = !M//not R1
D = D & M
M = D

//let's get not K1 and R1
@storeR1R1
D = M

//let's get not K1 and R1
@key
M = !M
D = D & M


//let's get F(R1,K1) and store it
@storeR1
D = M | D
M = D

//get L and not F
//note that L is now R0 and store it
@R00
D = !D
D = M & D

@LnotF
M = D


//get R0
@R00
D = M

//get not L and F
//namely, not R0 and F
@storeR1
D = !D
D = D & M


//get R2 and store it-----
@LnotF
D = D | M
M = D



@storeR1R1R1
M = D
D = M



//---------------get R3


//store R2
@storeR1
M = D

@storeR2
M = D

//lst's get key[2] first
@1
D = M
@128
D = D -A

@key21
D;JGE
@key22
D;JLT

(key22)
@1
D = M
D = D + M
M = D

@jump2
D;JMP

(key21)
@1
D = D
M = D
D = D + M
D = D + 1
M = D
//let's store key[1]
(jump2)
@key
M = D


//let's get F(R2,K2)
//let's get not R2 and K2
//store it into storeR1
@storeR1
M = !M
D = D & M
M = D


//let's get not K2 and R2
@1
D = !M

@storeR2// !k2 & R2
D = D & M

//get F and store and use
@storeR1
D = D | M
M = D

//now let's get R3-----
//let's get R1 and !F

@storeR1R1R1R1R1// R1 & !F
D = !D
D = M & D

@R1notF//R1 and not F
M = D

//let's get not R1 and F
@storeR1R1R1R1R1
D = !M

@storeR1//not R1 and F and store
D = D & M
M = D



@R1notF//that's R3
D = M | D
M = D

@storeR3
M = D



@storeR2
D = M
M = D + M
D = M
M = D + M
D = M 
M = D + M
D = M
M = D + M

D = M
M = D + M
D = M
M = D + M
D = M
M = D + M
D = M
M = D + M
D = M



@storeR3
D = D + M

@0
M = D

(end)
@end
0;JMP












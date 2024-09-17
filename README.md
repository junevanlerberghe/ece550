# ECE 550 Project Checkpoint 1: Simple ALU
- June Vanlerberghe
- netid: jlv46
- date: September 17, 2024

## Design Implementation
This simple ALU performs addition and subtraction in Verilog. 

### Addition
I built the adder module using Carry Select Adders (CSAs). I built a 32-bit and 16-bit CSA. 
These CSAs used 8-bit RCAs which consist of 4-bit RCAs and full adders. The carry out of the second to last bit is always stored
in each RCA and CSA so that we can keep track of the carry-in to the last bit addition. This is done so I can correctly
calculate the overflow after the addition. Data_operandA, data_operandB and carry_in are given into the adder module in order
to calculate the sum of A and B. 

### Subtraction
Subtraction uses the adder module just like the addition does, but has a couple extra steps before the addition occurs. Since subtracting 
is the same as adding a negative number, we use 2's complement to make data_operandB negative. To achieve this, I flip the bits of B
using a generate for loop, then pass 1 as the carry in to the addition. Now that B is negative, we can simply use the adder module 
to add data_operandA and -data_operandB. 

### Overflow
I calculate overflow after the addition and/or subtraction happens. Since the adder returns the carry_in of the last bit addition, 
we can simply calculate the overflow checking if the carry_in of the last bit addition is the same as the carry_out. If these are 
not equal, we set overflow to 1. If they are equal, overflow will be 0.

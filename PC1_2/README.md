# ECE 550 Project Checkpoints 1 and 2: Full ALU
- June Vanlerberghe
- netid: jlv46
- date: September 25, 2024

## Design Implementation
This full ALU performs addition, subtraction, bitwise AND and OR, logical left shift and arithmetic right shift in Verilog. It also tests for isNotEqual and isLessThan for the input data.

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

### Bitwise AND and OR
To implement the bitwise AND and OR, I simply did a generate for loop over the data operands and applied an and/or gate on the corresponding bits. Each gate operation was saved in the corresponding bit in the output.

### isNotEqual
To compare if two data operands are notequal to each other, I used the subtraction results of the two operands. If A-B is not 0 for all bits, then the numbers are not equal to each other. In order to implement this, I used an or gate to or each bit in the subtraction result (so if there are any 1s in the subtraction result, the result of the or gate would be 1). If the result of the or is 1, then isNotEqual is 1.

### isLessThan
isLessThan is similar to but slightly more complex than evaluating isNotEqual. I also used the subtraction result to compute isLessThan as well as the overflow value from the subtraction result. If the subtraction result is negative with no overflow, we know that data operandA is less than B. When there is an overflow and data operandA is negative, then we also know that A is less than B. I implemented these two cases using and gates to check for the correct case then using an or gate to see if either one of the cases is true, then we know that isLessThan is 1.

### Logical Left Shift

### Arithmetic Right Shift

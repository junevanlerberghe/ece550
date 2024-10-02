# ECE 550 Project Checkpoints 1 and 2: Full ALU
- June Vanlerberghe
- netid: jlv46
- date: September 26, 2024

## Design Implementation
This full ALU performs addition, subtraction, bitwise AND and OR, logical left shift and arithmetic right shift in Verilog. It also tests for isNotEqual and isLessThan for the input data.

### Addition
I built the adder module using Carry Select Adders (CSAs). I built a 32-bit and 16-bit CSA. 
These CSAs used 8-bit RCAs which consist of 4-bit RCAs and full adders. The carry out of the second to last bit is always stored
in each RCA and CSA so that we can keep track of the carry-in to the last bit addition. This is done so I can correctly
calculate the overflow after the addition. 

### Subtraction
Subtraction uses the adder module just like the addition does, but has a couple extra steps before the addition occurs. Since subtracting is the same as adding a negative number, we use 2's complement to make data_operandB negative. To achieve this, I flip the bits of B using a generate for loop, then pass 1 as the carry in to the addition. Now that B is negative, we can simply use the adder module to add data_operandA and -data_operandB. 

### Overflow
I calculate overflow after the addition and/or subtraction happens. Since the adder returns the carry_in of the last bit addition, we can simply calculate the overflow checking if the carry_in of the last bit addition is the same as the carry_out. If these are not equal, we set overflow to 1. If they are equal, overflow will be 0.

### Bitwise AND and OR
To implement the bitwise AND and OR, I simply did a generate for loop over the data operands and applied an and/or gate on the corresponding bits. Each gate operation was saved in the corresponding bit in the output.

### isNotEqual
To compare if two data operands are notequal to each other, I used the subtraction results of the two operands. If A-B is not 0 for all bits, then the numbers are not equal to each other. In order to implement this, I used an or gate to or each bit in the subtraction result (so if there are any 1s in the subtraction result, the result of the or gate would be 1).

### isLessThan
isLessThan is similar to but slightly more complex than evaluating isNotEqual. I also used the subtraction result to compute isLessThan as well as the overflow value from the subtraction result. If the subtraction result is negative with no overflow, we know that data operandA is less than B. When there is an overflow and data operandA is negative, then we also know that A is less than B. 

### Logical Left Shift
The logical left shifts takes in a data operand and a shift amount. The module shifts the data by the given shift amount to the left. The data gets filled in with 0s on the right. This is implemented using a generate for loop for each bit of the shift amount. 

### Arithmetic Right Shift
The arithmetic right shift also takes in a data operand and a shift amount. The module shifts the data by the given shift amount to the right. The bits on the left then get filled in with the most significant bit (MSB) of the data operand. This module works similarly to the left shift, the main difference being needing to perform the generate for loops twice, each one once with the most significant bit being 1, and the others for the most significant bit being 0. Once we have the result of the right shift with the MSB of 0 and 1, we can use a mux to determine which result we need to return based on the MSB of the given data operand.

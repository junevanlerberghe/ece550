# ECE 550 Project Checkpoint 3: Register File
- June Vanlerberghe
- netid: jlv46
- date: October 8, 2024

## Design Implementation
The register file is able to write data to one register and read data from 2 registers with one call to the module.
It is built using 32 registers that are each 32 bits. A decoder is used to enable one register from the ctrl_register given 
as input.

### Writing
Given a write enable, write data and a write register, the regfile will write the data to the correct register. 
It uses the decoder to transform the 5 bit write enable to a one hot encoding, which we can then pass into 
each register in the loop. Each output from the registers is stored so that we can later read from them.
It will only write if the write enable is 1 and if the register is not 0 (register 0 will never get written to).

### Reading
This register file can read twice, from two registers. The behavior for each read module is the same.
Given a read register, it will read the data from that register and store it in the output readData. 
Using the one hot encoding from the decoder, I used tri-state buffers to ensure only one read output is driven.

### Decoder
I build a 5 to 32 decoder which takes as input a 5 bit control, and gives as output the one hot encoding of
this 5 bit control. It uses and gates to find each bit of the output.

### 32-bit Register
The 32-bit register creates 32 D Flip-Flops with the same inputs as to the register.

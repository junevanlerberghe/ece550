module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow, carry_30, c_out);

   input [31:0] data_operandA, data_operandB;
   input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

   output [31:0] data_result;
   output isNotEqual, isLessThan, overflow, carry_30, c_out;

	wire [31:0] not_b, new_b, sum;
	
	// flipping bits of data_operandB
   genvar i;
   generate
      for (i = 0; i < 32; i = i + 1) begin: not_loop
         not n1(not_b[i], data_operandB[i]);
      end
   endgenerate
	
	assign new_b = ctrl_ALUopcode[0] ? not_b : data_operandB;
	
	// add A and B (or A and -B)
	adder add(data_operandA[31:0], new_b[31:0], ctrl_ALUopcode[0], c_out, carry_30, data_result);
	 
	xor(overflow, c_out, carry_30);
	
endmodule

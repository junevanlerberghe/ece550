module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

   input [31:0] data_operandA, data_operandB;
   input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

   output [31:0] data_result;
   output isNotEqual, isLessThan, overflow;

	wire [31:0] not_b, new_b, sum;
	wire c_out;
	
	// flipping bits of data_operandB
   genvar i;
   generate
      for (i = 0; i < 32; i = i + 1) begin: not_loop
         not n1(not_b[i], data_operandB[i]);
      end
   endgenerate
	
	assign new_b = ctrl_ALUopcode[0] ? not_b : data_operandB;
	
	// add A and B (or A and -B)
	adder add(data_operandA[31:0], new_b[31:0], ctrl_ALUopcode[0], c_out, data_result);
	 
	// can't have overflow with subtraction so set to 0
	assign overflow = ctrl_ALUopcode[0] ? 1'b0 : c_out;
endmodule

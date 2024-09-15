module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

   input signed [31:0] data_operandA, data_operandB;
   input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

   output [31:0] data_result;
   output isNotEqual, isLessThan, overflow;

	wire signed [31:0] not_b, new_b;
	
   genvar i;
   generate
      for (i = 0; i < 32; i = i + 1) begin: not_loop
         not n1(not_b[i], data_operandB[i]);
      end
   endgenerate
	
	assign new_b = ctrl_ALUopcode[0] ? not_b : data_operandB;
	
	adder add(data_operandA, new_b, ctrl_ALUopcode[0], overflow, data_result);

endmodule

module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

   input [31:0] data_operandA, data_operandB;
   input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

   output [31:0] data_result;
   output isNotEqual, isLessThan, overflow;
	wire carry_30, c_out;

	wire [31:0] not_b, new_b, sum;
	wire [31:0] add_result, left_shift_result, right_shift_result, and_result, or_result;
	
	// flipping bits of data_operandB
   genvar i;
   generate
      for (i = 0; i < 32; i = i + 1) begin: not_loop
         not n1(not_b[i], data_operandB[i]);
      end
   endgenerate
	
	assign new_b = ctrl_ALUopcode[0] ? not_b : data_operandB;
	
	// add A and B (or A and -B)
	adder add(data_operandA[31:0], new_b[31:0], ctrl_ALUopcode[0], c_out, carry_30, add_result);
	
	 
	// calculate overflow
	xor(overflow, c_out, carry_30);
	
	isNotEqual equal(add_result, isNotEqual);
	isLessThan less(add_result, overflow, data_operandA, isLessThan);
	
	left_shift ls(data_operandA, ctrl_shiftamt, left_shift_result);
	right_shift rs(data_operandA, ctrl_shiftamt, right_shift_result);
	
	bitwise_and b_and(data_operandA, data_operandB, and_result);
	bitwise_or b_or(data_operandA, data_operandB, or_result);
	
	// figuring out what the data_result should be
	wire [31:0] mux_and_or, mux1, mux_left_right;
	
	assign mux_and_or = ctrl_ALUopcode[0] ? or_result : and_result;
	assign mux1 = ctrl_ALUopcode[1] ? mux_and_or : add_result;
	
	assign mux_left_right = ctrl_ALUopcode[0] ? right_shift_result : left_shift_result;
	assign data_result = ctrl_ALUopcode[2] ? mux_left_right : mux1;
	
	
endmodule

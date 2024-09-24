module bitwise_and(data_A, data_B, and_result);
	input[31:0] data_A, data_B;
	output[31:0] and_result;
	
	genvar i;
   generate
      for (i = 0; i < 32; i = i + 1) begin: and_loop
         and and1(and_result[i], data_A[i], data_B[i]);
      end
   endgenerate
	
endmodule

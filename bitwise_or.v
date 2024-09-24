module bitwise_or(data_A, data_B, or_output);
	input[32:0] data_A, data_B;
	output[32:0] or_output;
	
	genvar i;
   generate
      for (i = 0; i < 32; i = i + 1) begin: or_loop
         or or1(or_output[i], data_A[i], data_B[i]);
      end
   endgenerate
	
endmodule

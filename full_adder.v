module full_adder(a, b, carry_in, sum, carry_out);
	input carry_in, a, b;
	output carry_out, sum;
	
	assign sum = (a ^ b) ^ carry_in;
	assign carry_out = ((a ^ b) & carry_in) | (a & b);
endmodule
	
	

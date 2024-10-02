module full_adder(a, b, carry_in, sum, carry_out);
	input carry_in, a, b;
	output carry_out, sum;
	
	wire xor_sum, and_sum1, and_sum2;
	xor xor_gate(xor_sum, a, b);
	xor xor_gate2(sum, xor_sum, carry_in);
	
	and and_gate(and_sum1, xor_sum, carry_in);
	and and_gate2(and_sum2, a, b);
	or or_gate(carry_out, and_sum1, and_sum2);
endmodule
	
	

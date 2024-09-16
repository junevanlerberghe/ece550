module rca_4(a, b, carry_in, carry_out, carry_30, sum);
	input [3:0] a, b;
	input carry_in;
	output [3:0] sum;
	output carry_out, carry_30;
	
	
	wire carry1, carry2;
	full_adder fa0(a[0], b[0], carry_in, sum[0], carry1);
	full_adder fa1(a[1], b[1], carry1, sum[1], carry2);
	full_adder fa2(a[2], b[2], carry2, sum[2], carry_30);
	full_adder fa3(a[3], b[3], carry_30, sum[3], carry_out);
endmodule

module rca(a, b, carry_in, carry_out, carry_30, sum);
	input [7:0] a, b;
	input carry_in;
	
	output [7:0] sum;
	output carry_out, carry_30;
	
	wire carry1, carry_not_needed;
	rca_4 first_four(a[3:0], b[3:0], carry_in, carry1, carry_not_needed, sum[3:0]);
	rca_4 second_four(a[7:4], b[7:4], carry1, carry_out, carry_30, sum[7:4]);
endmodule

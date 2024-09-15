module carry_select_adder(a, b, carry_in, carry_out, sum);
	input [15:0] a, b;
	input carry_in;
	
	output [15:0] sum;
	output carry_out;
	
	wire carry_out_first_eight, carry_out1, carry_out0;
	wire [7:0] sum1, sum0;
	rca first_eight(a[7:0], b[7:0], carry_in, carry_out_first_eight, sum[7:0]);
	rca second_carry0(a[15:8], b[15:8],1'b0, carry_out0, sum0);
	rca second_carry1(a[15:8], b[15:8],1'b1, carry_out1, sum1);
	
	assign sum[15:8] = carry_out_first_eight ? sum1 : sum0;
	assign carry_out = carry_out_first_eight ? carry_out1 : carry_out0;
endmodule
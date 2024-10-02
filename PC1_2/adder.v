module adder(a, b, carry_in, carry_out, carry_30, sum);
	input [31:0] a, b;
	input carry_in;
	
	output [31:0] sum;
	output carry_out, carry_30;
	
	wire [15:0] sum0, sum1;
	wire carry_first_half, carry0, carry1, carry_not_needed, carry2, carry3;
	carry_select_adder  first_half(a[15:0], b[15:0], carry_in, carry_first_half, carry_not_needed, sum[15:0]);
	carry_select_adder second_carry0(a[31:16], b[31:16],1'b0, carry0, carry2, sum0);
	carry_select_adder second_carry1(a[31:16], b[31:16],1'b1, carry1, carry3, sum1);
	
	assign sum[31:16] = carry_first_half ? sum1 : sum0;
	assign carry_out = carry_first_half ? carry1 : carry0;
	assign carry_30 = carry_first_half ? carry3 : carry2;
endmodule

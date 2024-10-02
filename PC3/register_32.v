module register_32(enable, data, clk, clr, result);
	input enable, clk, clr;
	wire clr;
	input [31:0] data;
	
	output [31:0] result;
	
	genvar i;

	generate 
		for (i = 0; i < 32; i = i + 1) begin: dffe_loop
			dffe_ref dffe1(result[i], data[i], clk, enable, clr);
		end
	endgenerate
	
endmodule

module regfile (
    clock,
    ctrl_writeEnable,
    ctrl_reset, ctrl_writeReg,
    ctrl_readRegA, ctrl_readRegB, data_writeReg,
    data_readRegA, data_readRegB
);

   input clock, ctrl_writeEnable, ctrl_reset;
   input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
   input [31:0] data_writeReg;

   output [31:0] data_readRegA, data_readRegB;
	
	// correctly assign enables for writing
   wire [31:0] oneHotEn, writeEnable;
	wire [31:0] write_result[31:0];
	
	decoder5to32 dec(ctrl_writeReg, oneHotEn);
	assign writeEnable = ctrl_writeEnable ? oneHotEn : 32'b0;
	
	// send write data through all registers
	genvar i;
	generate
		for (i = 0; i < 32; i = i + 1) begin: write_loop
			if (i == 0) begin
				register_32 register(32'b0, data_writeReg, clock, ctrl_reset, write_result[i]);
			end else begin
				register_32 register(writeEnable[i], data_writeReg, clock, ctrl_reset, write_result[i]);
			end
		end
	endgenerate
	

	// decoder for reading regA and B
	wire [31:0] oneHotReadA;
	decoder5to32 dec1(ctrl_readRegA, oneHotReadA);
	
	wire [31:0] oneHotReadB;
	decoder5to32 dec2(ctrl_readRegB, oneHotReadB);
	
	// using tristate buffers to enable correct output
	genvar j;
	generate
		for(j = 0; j < 32; j = j + 1) begin: read_loop
			assign data_readRegA = oneHotReadA[j] ? write_result[j] : 32'bz;
			assign data_readRegB = oneHotReadB[j] ? write_result[j] : 32'bz;
		end
	endgenerate

endmodule

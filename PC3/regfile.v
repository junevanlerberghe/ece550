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
   wire [31:0] oneHotEn, writeEnable, write_result;
	decoder5to32 dec(ctrl_writeReg, oneHotEn);
	
	assign writeEnable = ctrl_writeEnable ? oneHotEn : 32'b0;
	
	// send write data through all registers
	genvar i;
	generate
		for (i = 0; i < 32; i = i + 1) begin: write_loop
			register_32 register(writeEnable[i], data_writeReg, clock, ctrl_reset, write_result);
		end
	endgenerate
	
	

endmodule

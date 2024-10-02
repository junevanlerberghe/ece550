module decoder5to32(in, result);

	input [4:0] in;
	output [31:0] result;
	
	// need inverted versions of each input
	wire not0, not1, not2, not3, not4;
	not n0(not0, in[0]);
	not n1(not1, in[1]);
	not n2(not2, in[2]);
	not n3(not3, in[3]);
	not n4(not4, in[4]);
	
	// and gate for each possible output 
	and a0(result[0], not4, not3, not2, not1, not0); // 00000
	and a1(result[1], not4, not3, not2, not1, in[0]); // 00001
	and a2(result[2], not4, not3, not2, in[1], not0);
	and a3(result[3], not4, not3, not2, in[1], in[0]);
	and a4(result[4], not4, not3, in[2], not1, not0);
	and a5(result[5], not4, not3, in[2], not1, in[0]);
	and a6(result[6], not4, not3, in[2], in[1], not0);
	and a7(result[7], not4, not3, in[2], in[1], in[0]);
	and a8(result[8], not4, in[3], not2, not1, not0);
	and a9(result[9], not4, in[3], not2, not1, in[0]);
	and a10(result[10], not4, in[3], not2, in[1], not0);
	and a11(result[11], not4, in[3], not2, in[1], in[0]);
	and a12(result[12], not4, in[3], in[2], not1, not0);
	and a13(result[13], not4, in[3], in[2], not1, in[0]);
	and a14(result[14], not4, in[3], in[2], in[1], not0);
	and a15(result[15], not4, in[3], in[2], in[1], in[0]);
	and a16(result[16], in[4], not3, not2, not1, not0);
	and a17(result[17], in[4], not3, not2, not1, in[0]);
	and a18(result[18], in[4], not3, not2, in[1], not0);
	and a19(result[19], in[4], not3, not2, in[1], in[0]);
	and a20(result[20], in[4], not3, in[2], not1, not0);
	and a21(result[21], in[4], not3, in[2], not1, in[0]);
	and a22(result[22], in[4], not3, in[2], in[1], not0);
	and a23(result[23], in[4], not3, in[2], in[1], in[0]);
	and a24(result[24], in[4], in[3], not2, not1, not0);
	and a25(result[25], in[4], in[3], not2, not1, in[0]);
	and a26(result[26], in[4], in[3], not2, in[1], not0);
	and a27(result[27], in[4], in[3], not2, in[1], in[0]);
	and a28(result[28], in[4], in[3], in[2], not1, not0);
	and a29(result[29], in[4], in[3], in[2], not1, in[0]);
	and a30(result[30], in[4], in[3], in[2], in[1], not0);
	and a31(result[31], in[4], in[3], in[2], in[1], in[0]); // 11111
	
endmodule

	
module isLessThan(sub_result, overflow, data_A, isLessThan);
	input [31:0] sub_result, data_A;
	input overflow;
	output isLessThan;
	
	wire not_overflow, no_overflow_neg, overflow_pos;
	
	not n1(not_overflow, overflow);
	
	// when no overflow and subtract result is negative --> less
	and(no_overflow_neg, not_overflow, sub_result[31]);
	
	// when A is negative and there is overflow --> less
	and(overflow_pos, overflow, data_A[31]);
	
	or(isLessThan, no_overflow_neg, overflow_pos);
	
endmodule
	
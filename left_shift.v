module left_shift(data, ctrl_shiftamt, result);
	input [31:0] data;
	input [4:0] ctrl_shiftamt;
	output [31:0] result;
	
	wire [31:0] output1, output2, output3, output4;
	
	genvar i;
   generate
      for (i = 0; i < 32; i = i + 1) begin: shift_loop
         if (i < 1) begin
            assign output1[i] = ctrl_shiftamt[0] ? 1'b0 : data[i];
         end else begin
            assign output1[i] = ctrl_shiftamt[0] ? data[i - 1] : data[i];
         end
      end
   endgenerate
	
	genvar j;
   generate
      for (j = 0; j < 32; j = j + 1) begin: shift_loop1
         if (j < 2) begin
            assign output2[j] = ctrl_shiftamt[1] ? 1'b0 : output1[j];
         end else begin
            assign output2[j] = ctrl_shiftamt[1] ? output1[j - 2] : output1[j];
         end
      end
   endgenerate
	
	genvar k;
   generate
      for (k = 0; k < 32; k = k + 1) begin: shift_loop2
         if (k < 4) begin
            assign output3[k] = ctrl_shiftamt[2] ? 1'b0 : output2[k];
         end else begin
            assign output3[k] = ctrl_shiftamt[2] ? output2[k - 4] : output2[k];
         end
      end
   endgenerate
	
	genvar l;
   generate
      for (l = 0; l < 32; l = l + 1) begin: shift_loop3
         if (l < 8) begin
            assign output4[l] = ctrl_shiftamt[3] ? 1'b0 : output3[l];
         end else begin
            assign output4[l] = ctrl_shiftamt[3] ? output3[l - 8] : output3[l];
         end
      end
   endgenerate
	
	genvar m;
   generate
      for (m = 0; m < 32; m = m + 1) begin: shift_loop4
         if (m < 16) begin
            assign result[m] = ctrl_shiftamt[4] ? 1'b0 : output4[m];
         end else begin
            assign result[m] = ctrl_shiftamt[4] ? output4[m - 16] : output4[m];
         end
      end
   endgenerate
	
endmodule

module right_shift(data, ctrl_shiftamt, result);
	input [31:0] data;
	input [4:0] ctrl_shiftamt;
	output [31:0] result;
	
	wire [31:0] output1, output2, output3, output4, output5, output6, output7, output8;
	wire [31:0] result0, result1;
	
	// right shift filling with 0
	genvar i;
   generate
      for (i = 0; i < 32; i = i + 1) begin: shift_loop
         if (i >= 31) begin
            assign output1[i] = ctrl_shiftamt[0] ? 1'b0 : data[i];
         end else begin
            assign output1[i] = ctrl_shiftamt[0] ? data[i + 1] : data[i];
         end
      end
   endgenerate
	
	genvar j;
   generate
      for (j = 0; j < 32; j = j + 1) begin: shift_loop1
         if (j >= 30) begin
            assign output2[j] = ctrl_shiftamt[1] ? 1'b0 : output1[j];
         end else begin
            assign output2[j] = ctrl_shiftamt[1] ? output1[j + 2] : output1[j];
         end
      end
   endgenerate
	
	genvar k;
   generate
      for (k = 0; k < 32; k = k + 1) begin: shift_loop2
         if (k >= 28) begin
            assign output3[k] = ctrl_shiftamt[2] ? 1'b0 : output2[k];
         end else begin
            assign output3[k] = ctrl_shiftamt[2] ? output2[k + 4] : output2[k];
         end
      end
   endgenerate
	
	genvar l;
   generate
      for (l = 0; l < 32; l = l + 1) begin: shift_loop3
         if (l >= 24) begin
            assign output4[l] = ctrl_shiftamt[3] ? 1'b0 : output3[l];
         end else begin
            assign output4[l] = ctrl_shiftamt[3] ? output3[l + 8] : output3[l];
         end
      end
   endgenerate
	
	genvar m;
   generate
      for (m = 0; m < 32; m = m + 1) begin: shift_loop4
         if (m >= 16) begin
            assign result0[m] = ctrl_shiftamt[4] ? 1'b0 : output4[m];
         end else begin
            assign result0[m] = ctrl_shiftamt[4] ? output4[m + 16] : output4[m];
         end
      end
   endgenerate
	
	// right shift filling with 1
	genvar a;
   generate
      for (a = 0; a < 32; a = a + 1) begin: shift_loop5
         if (a >= 31) begin
            assign output5[a] = ctrl_shiftamt[0] ? 1'b1 : data[a];
         end else begin
            assign output5[a] = ctrl_shiftamt[0] ? data[a + 1] : data[a];
         end
      end
   endgenerate
	
	genvar b;
   generate
      for (b = 0; b < 32; b = b + 1) begin: shift_loop6
         if (b >= 30) begin
            assign output6[b] = ctrl_shiftamt[1] ? 1'b1 : output5[b];
         end else begin
            assign output6[b] = ctrl_shiftamt[1] ? output5[b + 2] : output5[b];
         end
      end
   endgenerate
	
	genvar c;
   generate
      for (c = 0; c < 32; c = c + 1) begin: shift_loop7
         if (c >= 28) begin
            assign output7[c] = ctrl_shiftamt[2] ? 1'b1 : output6[c];
         end else begin
            assign output7[c] = ctrl_shiftamt[2] ? output6[c + 4] : output6[c];
         end
      end
   endgenerate
	
	genvar d;
   generate
      for (d = 0; d < 32; d = d + 1) begin: shift_loop8
         if (d >= 24) begin
            assign output8[d] = ctrl_shiftamt[3] ? 1'b1 : output7[d];
         end else begin
            assign output8[d] = ctrl_shiftamt[3] ? output7[d + 8] : output7[d];
         end
      end
   endgenerate
	
	genvar e;
   generate
      for (e = 0; e < 32; e = e + 1) begin: shift_loop9
         if (e >= 16) begin
            assign result1[e] = ctrl_shiftamt[4] ? 1'b1 : output8[e];
         end else begin
            assign result1[e] = ctrl_shiftamt[4] ? output8[e + 16] : output8[e];
         end
      end
   endgenerate
	
	assign result = data[31] ? result1 : result0;
endmodule

module init_lcg(
input [31:0] din,
output [31:0] dout [3:0]);

assign dout[0]=din[31:0];
assign dout[1]=din[31:0]* 1103515245 + 12345;
assign dout[2]=din[31:0]* 3265436265 + 3554416254;
assign dout[3]=din[31:0]* 2155723957 + 2802067423;

endmodule
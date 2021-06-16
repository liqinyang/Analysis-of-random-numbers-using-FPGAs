module test_part(
input clk,
input rst,
input enable,
input [31:0]rand_num[3:0],
output reg [63:0] out[31:0],
output reg [63:0] total
);

integer i;


reg [63:0] next[31:0];


always@(posedge clk)
if (~enable)begin
	for (i=0;i<=31;i=i+1)begin
		out[i]<=64'd0;
	end
	total<=64'd0;
end
else begin
	out<=next;
	total<=total+3'd4;
end

always@(*) begin
	for (i=0;i<=7;i=i+1) begin
		next[i] = out[i]+((rand_num[0][4*i+:4]!=rand_num[1][4*i+:4])&(rand_num[0][4*i+:4]!=rand_num[2][4*i+:4])&(rand_num[0][4*i+:4]!=rand_num[3][4*i+:4])&(rand_num[1][4*i+:4]!=rand_num[2][4*i+:4])&(rand_num[1][4*i+:4]!=rand_num[3][4*i+:4])&(rand_num[2][4*i+:4]!=rand_num[3][4*i+:4]));
	end
end
endmodule


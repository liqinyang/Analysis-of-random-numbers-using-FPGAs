module test_run(
input clk,
input rst,
input enable,
input [31:0]rand_num[3:0],
output reg [63:0] out[31:0],
output reg [63:0] out_one_count[31:0],
output reg [63:0] total
);

integer i;


reg [31:0]last_bit;
reg [63:0] next[31:0];
reg [63:0] next_one_count[31:0];

reg [31:0] cmp[3:0];

always@(posedge clk)
if (~enable)begin
	for (i=0;i<=31;i=i+1)begin
		out[i]<=64'd0;
		out_one_count[i]<=64'd0;
		last_bit[i]<=~rand_num[0][i];
	end
	total<=64'd0;
end
else  begin
	out<=next;
	out_one_count<=next_one_count;
	for (i=0;i<=31;i=i+1)begin
		last_bit[i]<=rand_num[3][i];
	end
	total<=total+3'd4;
end

always@(*) begin
	for (i=0;i<=31;i=i+1) begin
		next[i] = out[i]+(rand_num[0][i]^last_bit[i])+(rand_num[1][i]^rand_num[0][i])+(rand_num[2][i]^rand_num[1][i])+(rand_num[3][i]^rand_num[2][i]);
		next_one_count[i] = out_one_count[i]+rand_num[0][i]+rand_num[1][i]+rand_num[2][i]+rand_num[3][i];
	end
end
endmodule


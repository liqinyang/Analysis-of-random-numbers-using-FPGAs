module test(
input clk,
input rst,
input enable,
input [2:0]in[31:0],
output reg [63:0] out[31:0],
output reg [63:0] total
);

integer i;

reg [63:0] next[31:0];

always@(posedge clk)
if (rst)begin
for (i=0;i<=31;i=i+1)out[i]<=64'd0;
//total<=64'd0-3'd1;
total<=64'd0-3'd4;
end
else if(enable) begin
out<=next;
//total<=total+3'd1;
total<=total+3'd4;
end

always@(*) begin
for (i=0;i<=31;i=i+1) 
	next[i] = out[i]+in[i];
end
endmodule


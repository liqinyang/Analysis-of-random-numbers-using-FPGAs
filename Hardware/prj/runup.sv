module test_runup(
input clk,
input rst,
input enable,
input [31:0]rand_num[3:0],
output reg [63:0] out[31:0],
output reg [63:0] total
);

integer i;


reg [31:0]last_num;
reg [1:0] count,count2;
reg [63:0] next[31:0];

reg [31:0] cmp[3:0];

reg [0:3] less,greater;
reg last_l,last_g;

always@(posedge clk)
if (~enable)begin
	for (i=0;i<=31;i=i+1)begin
		out[i]<=64'd0;
		last_num[i]<=rand_num[0][i];
	end
	total<=64'd0;
	last_l<=1'b0;
	last_g<=1'b0;
end
else  begin
	out<=next;
	//total<=total+3'd1;
	for (i=0;i<=31;i=i+1)begin
		last_num[i]<=rand_num[3][i];
	end
	total<=total+3'd4;
	last_l<=less[3];
	last_g<=greater[3];
end

always@(*) begin
	less[0]=last_num<rand_num[0];
	less[1]=rand_num[0]<rand_num[1];
	less[2]=rand_num[1]<rand_num[2];
	less[3]=rand_num[2]<rand_num[3];
	greater[0]=last_num>rand_num[0];
	greater[1]=rand_num[0]>rand_num[1];
	greater[2]=rand_num[1]>rand_num[2];
	greater[3]=rand_num[2]>rand_num[3];
	case({last_l,less})
		5'b00000: count= 0;
		5'b00001: count= 1;
		5'b00010: count= 1;
		5'b00011: count= 1;
		5'b00100: count= 1;
		5'b00101: count= 2;
		5'b00110: count= 1;
		5'b00111: count= 1;
		5'b01000: count= 1;
		5'b01001: count= 2;
		5'b01010: count= 2;
		5'b01011: count= 2;
		5'b01100: count= 1;
		5'b01101: count= 2;
		5'b01110: count= 1;
		5'b01111: count= 1;
		5'b10000: count= 0;
		5'b10001: count= 1;
		5'b10010: count= 1;
		5'b10011: count= 1;
		5'b10100: count= 1;
		5'b10101: count= 2;
		5'b10110: count= 1;
		5'b10111: count= 1;
		5'b11000: count= 0;
		5'b11001: count= 1;
		5'b11010: count= 1;
		5'b11011: count= 1;
		5'b11100: count= 0;
		5'b11101: count= 1;
		5'b11110: count= 0;
		5'b11111: count= 0;
	endcase
	
	case({last_g,greater})
		5'b00000: count2= 0;
		5'b00001: count2= 1;
		5'b00010: count2= 1;
		5'b00011: count2= 1;
		5'b00100: count2= 1;
		5'b00101: count2= 2;
		5'b00110: count2= 1;
		5'b00111: count2= 1;
		5'b01000: count2= 1;
		5'b01001: count2= 2;
		5'b01010: count2= 2;
		5'b01011: count2= 2;
		5'b01100: count2= 1;
		5'b01101: count2= 2;
		5'b01110: count2= 1;
		5'b01111: count2= 1;
		5'b10000: count2= 0;
		5'b10001: count2= 1;
		5'b10010: count2= 1;
		5'b10011: count2= 1;
		5'b10100: count2= 1;
		5'b10101: count2= 2;
		5'b10110: count2= 1;
		5'b10111: count2= 1;
		5'b11000: count2= 0;
		5'b11001: count2= 1;
		5'b11010: count2= 1;
		5'b11011: count2= 1;
		5'b11100: count2= 0;
		5'b11101: count2= 1;
		5'b11110: count2= 0;
		5'b11111: count2= 0;
	endcase
		
	next[0] = out[0]+count+count2;
	
end
endmodule


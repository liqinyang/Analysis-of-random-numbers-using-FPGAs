module rng_mt(
input clk,
input rst,
input enable,
input [31:0] ini,
output reg [31:0] out[3:0],
output reg tst_en);
reg [9:0]counter,next_counter;
reg [31:0] next[3:0];
reg [31:0] s1[3:0];
reg [31:0] s2[3:0];
reg [31:0] s3[3:0];
reg [623:0][31:0] y,mem_in,mem_out;
int i;
reg wr,wr_n;

always@(posedge clk)
if (rst)begin
	counter<=10'd0-10'd4;
	wr<=0;
	tst_en<=0;
end else begin
	if(enable)begin
		counter<=next_counter;
		out<=next;
		wr<=wr_n;
		tst_en<=tst_en|(counter==10'd0);
	end
end
	

always@(*) begin
wr_n=1;
for(i=0;i<4;i=i+1) begin
	s1[i]=mem_out[i]^mem_out[i]>>11;
	s2[i]=s1[i]^s1[i]<<7 & 32'd2636928640;
	s3[i]=s2[i]^s2[i]<<15 & 32'd4022730752;
	next[i]=s3[i]^s3[i]>>18;
end
mem_in={mem_out[3:0],mem_out[623:4]};
if(counter==10'd620) begin 
	next_counter=10'd0; 
	for (i=0;i<=623;i=i+1)begin
			y[i]={1'd0,mem_in[i][31],mem_in[(i+1)%624][30:1]}^mem_in[(i+397)%624];
			mem_in[i]=mem_in[(i+1)%624][0]?y[i]^32'h9908b0df:y[i];
		end
end
else begin next_counter=counter+10'd4; end
end



//rng_mt core(clk,rst,twist,mt);
mt_mem mem(clk,rst,wr,mem_in,mem_out);
endmodule
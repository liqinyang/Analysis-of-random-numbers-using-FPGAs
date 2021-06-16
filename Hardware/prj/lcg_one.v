module rng_lcg_one(
input clk,
input rst,
input enable,
input [31:0] ini,
output reg [31:0] out,
output reg tst_enable);

reg [31:0] next;

always@(posedge clk)
if (rst) begin
	out<=ini;
	tst_enable<=0;
end
else
if(enable) begin 
	out<=next;
	tst_enable<=1;
end

always@(*) begin
if(tst_enable) next=out* 1103515245 + 12345;
else next=out;
end
endmodule


//int myrand(void)  /* RAND_MAX assumed to be 32767. */
//{
//    next = next * 1103515245 + 12345;
//    return((unsigned)(next/65536) % 32768);
//}

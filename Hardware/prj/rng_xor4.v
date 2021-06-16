module rng_xor(
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

if(tst_enable) begin
	next[ 0 ]=out[ 0 ]^out[ 6 ]^out[ 8 ]^out[ 10 ]^out[ 11 ]^out[ 12 ]^out[ 14 ]^out[ 16 ]^out[ 27 ]^out[ 29 ];
	next[ 1 ]=out[ 0 ]^out[ 1 ]^out[ 3 ]^out[ 4 ]^out[ 7 ]^out[ 8 ]^out[ 9 ]^out[ 12 ]^out[ 13 ]^out[ 17 ]^out[ 20 ]^out[ 25 ]^out[ 30 ];
	next[ 2 ]=out[ 0 ]^out[ 1 ]^out[ 2 ]^out[ 5 ]^out[ 9 ]^out[ 10 ]^out[ 12 ]^out[ 13 ]^out[ 14 ]^out[ 16 ]^out[ 18 ]^out[ 26 ]^out[ 29 ]^out[ 31 ];
	next[ 3 ]=out[ 0 ]^out[ 2 ]^out[ 3 ]^out[ 4 ]^out[ 5 ]^out[ 6 ]^out[ 9 ]^out[ 11 ]^out[ 13 ]^out[ 14 ]^out[ 15 ]^out[ 17 ]^out[ 18 ]^out[ 19 ]^out[ 22 ]^out[ 23 ]^out[ 26 ];
	next[ 4 ]=out[ 3 ]^out[ 4 ]^out[ 5 ]^out[ 7 ]^out[ 10 ]^out[ 12 ]^out[ 14 ]^out[ 15 ]^out[ 16 ]^out[ 20 ]^out[ 23 ]^out[ 24 ]^out[ 31 ];
	next[ 5 ]=out[ 3 ]^out[ 5 ]^out[ 10 ]^out[ 11 ]^out[ 13 ]^out[ 14 ]^out[ 16 ]^out[ 19 ]^out[ 20 ]^out[ 24 ]^out[ 27 ]^out[ 28 ];
	next[ 6 ]=out[ 0 ]^out[ 3 ]^out[ 4 ]^out[ 6 ]^out[ 14 ]^out[ 16 ]^out[ 17 ];
	next[ 7 ]=out[ 4 ]^out[ 5 ]^out[ 6 ]^out[ 7 ]^out[ 8 ]^out[ 12 ]^out[ 15 ]^out[ 16 ]^out[ 19 ]^out[ 21 ]^out[ 27 ]^out[ 29 ]^out[ 31 ];
	next[ 8 ]=out[ 0 ]^out[ 1 ]^out[ 4 ]^out[ 6 ]^out[ 7 ]^out[ 8 ]^out[ 10 ]^out[ 13 ]^out[ 16 ]^out[ 17 ]^out[ 18 ]^out[ 20 ]^out[ 23 ]^out[ 26 ]^out[ 27 ]^out[ 28 ];
	next[ 9 ]=out[ 2 ]^out[ 5 ]^out[ 6 ]^out[ 7 ]^out[ 9 ]^out[ 11 ]^out[ 12 ]^out[ 14 ]^out[ 16 ]^out[ 24 ]^out[ 28 ]^out[ 31 ];
	next[ 10 ]=out[ 6 ]^out[ 7 ]^out[ 10 ]^out[ 11 ]^out[ 12 ]^out[ 13 ]^out[ 19 ]^out[ 20 ]^out[ 28 ]^out[ 29 ];
	next[ 11 ]=out[ 0 ]^out[ 1 ]^out[ 4 ]^out[ 5 ]^out[ 7 ]^out[ 9 ]^out[ 10 ]^out[ 11 ]^out[ 13 ]^out[ 14 ]^out[ 16 ]^out[ 17 ]^out[ 18 ]^out[ 19 ]^out[ 20 ]^out[ 22 ]^out[ 23 ]^out[ 26 ]^out[ 27 ];
	next[ 12 ]=out[ 0 ]^out[ 1 ]^out[ 2 ]^out[ 4 ]^out[ 5 ]^out[ 6 ]^out[ 8 ]^out[ 10 ]^out[ 11 ]^out[ 12 ]^out[ 14 ]^out[ 15 ]^out[ 18 ]^out[ 19 ]^out[ 20 ]^out[ 21 ]^out[ 23 ]^out[ 24 ]^out[ 27 ]^out[ 28 ];
	next[ 13 ]=out[ 1 ]^out[ 2 ]^out[ 5 ]^out[ 6 ]^out[ 7 ]^out[ 9 ]^out[ 13 ]^out[ 19 ]^out[ 22 ]^out[ 24 ];
	next[ 14 ]=out[ 2 ]^out[ 3 ]^out[ 6 ]^out[ 7 ]^out[ 8 ]^out[ 10 ]^out[ 14 ]^out[ 20 ]^out[ 23 ]^out[ 25 ];
	next[ 15 ]=out[ 0 ]^out[ 1 ]^out[ 3 ]^out[ 4 ]^out[ 5 ]^out[ 7 ]^out[ 11 ]^out[ 12 ]^out[ 13 ]^out[ 14 ]^out[ 15 ]^out[ 18 ]^out[ 23 ]^out[ 24 ]^out[ 25 ]^out[ 26 ]^out[ 27 ];
	next[ 16 ]=out[ 0 ]^out[ 2 ]^out[ 4 ]^out[ 6 ]^out[ 8 ]^out[ 9 ]^out[ 10 ]^out[ 12 ]^out[ 13 ]^out[ 14 ]^out[ 15 ]^out[ 16 ]^out[ 17 ]^out[ 18 ]^out[ 22 ]^out[ 23 ]^out[ 24 ]^out[ 25 ]^out[ 28 ]^out[ 30 ];
	next[ 17 ]=out[ 3 ]^out[ 5 ]^out[ 6 ]^out[ 7 ]^out[ 9 ]^out[ 10 ]^out[ 11 ]^out[ 13 ]^out[ 14 ]^out[ 15 ]^out[ 16 ]^out[ 17 ]^out[ 23 ]^out[ 24 ]^out[ 25 ]^out[ 26 ]^out[ 27 ]^out[ 29 ];
	next[ 18 ]=out[ 0 ]^out[ 4 ]^out[ 6 ]^out[ 7 ]^out[ 8 ]^out[ 10 ]^out[ 11 ]^out[ 12 ]^out[ 14 ]^out[ 15 ]^out[ 16 ]^out[ 17 ]^out[ 18 ]^out[ 24 ]^out[ 25 ]^out[ 26 ]^out[ 27 ]^out[ 28 ]^out[ 30 ];
	next[ 19 ]=out[ 1 ]^out[ 5 ]^out[ 7 ]^out[ 8 ]^out[ 9 ]^out[ 11 ]^out[ 12 ]^out[ 13 ]^out[ 15 ]^out[ 16 ]^out[ 17 ]^out[ 18 ]^out[ 19 ]^out[ 25 ]^out[ 26 ]^out[ 27 ]^out[ 28 ]^out[ 29 ]^out[ 31 ];
	next[ 20 ]=out[ 0 ]^out[ 1 ]^out[ 2 ]^out[ 8 ]^out[ 9 ]^out[ 12 ]^out[ 17 ]^out[ 20 ]^out[ 22 ]^out[ 25 ]^out[ 28 ]^out[ 31 ];
	next[ 21 ]=out[ 2 ]^out[ 3 ]^out[ 6 ]^out[ 9 ]^out[ 10 ]^out[ 13 ]^out[ 21 ]^out[ 23 ]^out[ 26 ]^out[ 27 ]^out[ 29 ]^out[ 31 ];
	next[ 22 ]=out[ 0 ]^out[ 3 ]^out[ 7 ]^out[ 10 ]^out[ 11 ]^out[ 14 ]^out[ 17 ]^out[ 19 ]^out[ 22 ]^out[ 24 ]^out[ 27 ]^out[ 28 ]^out[ 30 ];
	next[ 23 ]=out[ 1 ]^out[ 3 ]^out[ 8 ]^out[ 16 ]^out[ 17 ]^out[ 18 ]^out[ 21 ]^out[ 23 ]^out[ 31 ];
	next[ 24 ]=out[ 1 ]^out[ 2 ]^out[ 4 ]^out[ 6 ]^out[ 8 ]^out[ 9 ]^out[ 12 ]^out[ 16 ]^out[ 19 ]^out[ 21 ]^out[ 22 ]^out[ 24 ]^out[ 27 ]^out[ 29 ]^out[ 31 ];
	next[ 25 ]=out[ 0 ]^out[ 1 ]^out[ 2 ]^out[ 3 ]^out[ 4 ]^out[ 7 ]^out[ 13 ]^out[ 17 ]^out[ 18 ]^out[ 20 ]^out[ 25 ]^out[ 26 ]^out[ 27 ]^out[ 28 ];
	next[ 26 ]=out[ 2 ]^out[ 3 ]^out[ 5 ]^out[ 6 ]^out[ 12 ]^out[ 14 ]^out[ 16 ]^out[ 26 ]^out[ 28 ]^out[ 31 ];
	next[ 27 ]=out[ 3 ]^out[ 6 ]^out[ 7 ]^out[ 13 ]^out[ 15 ]^out[ 19 ]^out[ 27 ]^out[ 29 ];
	next[ 28 ]=out[ 0 ]^out[ 4 ]^out[ 5 ]^out[ 6 ]^out[ 7 ]^out[ 8 ]^out[ 9 ]^out[ 10 ]^out[ 14 ]^out[ 16 ]^out[ 17 ]^out[ 20 ]^out[ 22 ]^out[ 23 ]^out[ 26 ]^out[ 28 ]^out[ 31 ];
	next[ 29 ]=out[ 1 ]^out[ 5 ]^out[ 6 ]^out[ 7 ]^out[ 8 ]^out[ 9 ]^out[ 10 ]^out[ 11 ]^out[ 15 ]^out[ 17 ]^out[ 18 ]^out[ 19 ]^out[ 21 ]^out[ 23 ]^out[ 24 ]^out[ 27 ]^out[ 29 ];
	next[ 30 ]=out[ 1 ]^out[ 2 ]^out[ 7 ]^out[ 8 ]^out[ 9 ]^out[ 10 ]^out[ 11 ]^out[ 12 ]^out[ 16 ]^out[ 20 ]^out[ 22 ]^out[ 24 ]^out[ 25 ]^out[ 27 ]^out[ 28 ]^out[ 30 ]^out[ 31 ];
	next[ 31 ]=out[ 2 ]^out[ 3 ]^out[ 9 ]^out[ 10 ]^out[ 11 ]^out[ 13 ]^out[ 16 ]^out[ 19 ]^out[ 23 ]^out[ 25 ]^out[ 26 ]^out[ 28 ]^out[ 31 ];
end else next=out;

end
endmodule
//int myrand(void)  /* RAND_MAX assumed to be 32767. */
//{
//    next = next * 1103515245 + 12345;
//    return((unsigned)(next/65536) % 32768);
//}

module init_xor(
input [31:0] din,
output [31:0] dout [3:0]);

assign dout[0]=din[31:0];

assign dout[1][ 0 ]=din[ 0 ]^din[ 4 ]^din[ 17 ];
assign dout[1][ 1 ]=din[ 1 ]^din[ 5 ]^din[ 18 ];
assign dout[1][ 2 ]=din[ 2 ]^din[ 6 ]^din[ 19 ];
assign dout[1][ 3 ]=din[ 3 ]^din[ 7 ]^din[ 20 ];
assign dout[1][ 4 ]=din[ 4 ]^din[ 8 ]^din[ 21 ];
assign dout[1][ 5 ]=din[ 0 ]^din[ 4 ]^din[ 5 ]^din[ 9 ]^din[ 17 ]^din[ 22 ];
assign dout[1][ 6 ]=din[ 1 ]^din[ 5 ]^din[ 6 ]^din[ 10 ]^din[ 18 ]^din[ 23 ];
assign dout[1][ 7 ]=din[ 2 ]^din[ 6 ]^din[ 7 ]^din[ 11 ]^din[ 19 ]^din[ 24 ];
assign dout[1][ 8 ]=din[ 3 ]^din[ 7 ]^din[ 8 ]^din[ 12 ]^din[ 20 ]^din[ 25 ];
assign dout[1][ 9 ]=din[ 4 ]^din[ 8 ]^din[ 9 ]^din[ 13 ]^din[ 21 ]^din[ 26 ];
assign dout[1][ 10 ]=din[ 5 ]^din[ 9 ]^din[ 10 ]^din[ 14 ]^din[ 22 ]^din[ 27 ];
assign dout[1][ 11 ]=din[ 6 ]^din[ 10 ]^din[ 11 ]^din[ 15 ]^din[ 23 ]^din[ 28 ];
assign dout[1][ 12 ]=din[ 7 ]^din[ 11 ]^din[ 12 ]^din[ 16 ]^din[ 24 ]^din[ 29 ];
assign dout[1][ 13 ]=din[ 0 ]^din[ 8 ]^din[ 12 ]^din[ 13 ]^din[ 17 ]^din[ 25 ]^din[ 30 ];
assign dout[1][ 14 ]=din[ 1 ]^din[ 9 ]^din[ 13 ]^din[ 14 ]^din[ 18 ]^din[ 26 ]^din[ 31 ];
assign dout[1][ 15 ]=din[ 2 ]^din[ 10 ]^din[ 14 ]^din[ 15 ]^din[ 27 ];
assign dout[1][ 16 ]=din[ 3 ]^din[ 11 ]^din[ 15 ]^din[ 16 ]^din[ 28 ];
assign dout[1][ 17 ]=din[ 4 ]^din[ 12 ]^din[ 16 ]^din[ 17 ]^din[ 29 ];
assign dout[1][ 18 ]=din[ 0 ]^din[ 5 ]^din[ 13 ]^din[ 17 ]^din[ 18 ]^din[ 30 ];
assign dout[1][ 19 ]=din[ 1 ]^din[ 6 ]^din[ 14 ]^din[ 18 ]^din[ 19 ]^din[ 31 ];
assign dout[1][ 20 ]=din[ 2 ]^din[ 7 ]^din[ 15 ]^din[ 20 ];
assign dout[1][ 21 ]=din[ 3 ]^din[ 8 ]^din[ 16 ]^din[ 21 ];
assign dout[1][ 22 ]=din[ 4 ]^din[ 9 ]^din[ 17 ]^din[ 22 ];
assign dout[1][ 23 ]=din[ 5 ]^din[ 10 ]^din[ 18 ]^din[ 23 ];
assign dout[1][ 24 ]=din[ 6 ]^din[ 11 ]^din[ 19 ]^din[ 24 ];
assign dout[1][ 25 ]=din[ 7 ]^din[ 12 ]^din[ 20 ]^din[ 25 ];
assign dout[1][ 26 ]=din[ 8 ]^din[ 13 ]^din[ 21 ]^din[ 26 ];
assign dout[1][ 27 ]=din[ 9 ]^din[ 14 ]^din[ 22 ]^din[ 27 ];
assign dout[1][ 28 ]=din[ 10 ]^din[ 15 ]^din[ 23 ]^din[ 28 ];
assign dout[1][ 29 ]=din[ 11 ]^din[ 16 ]^din[ 24 ]^din[ 29 ];
assign dout[1][ 30 ]=din[ 12 ]^din[ 17 ]^din[ 25 ]^din[ 30 ];
assign dout[1][ 31 ]=din[ 13 ]^din[ 18 ]^din[ 26 ]^din[ 31 ];

assign dout[2][ 0 ]=din[ 0 ]^din[ 4 ]^din[ 8 ]^din[ 12 ]^din[ 16 ]^din[ 21 ]^din[ 29 ];
assign dout[2][ 1 ]=din[ 1 ]^din[ 4 ]^din[ 5 ]^din[ 9 ]^din[ 13 ]^din[ 22 ]^din[ 30 ];
assign dout[2][ 2 ]=din[ 2 ]^din[ 5 ]^din[ 6 ]^din[ 10 ]^din[ 14 ]^din[ 23 ]^din[ 31 ];
assign dout[2][ 3 ]=din[ 3 ]^din[ 6 ]^din[ 7 ]^din[ 11 ]^din[ 15 ]^din[ 19 ]^din[ 24 ];
assign dout[2][ 4 ]=din[ 4 ]^din[ 7 ]^din[ 8 ]^din[ 12 ]^din[ 16 ]^din[ 20 ]^din[ 25 ];
assign dout[2][ 5 ]=din[ 5 ]^din[ 9 ]^din[ 12 ]^din[ 13 ]^din[ 16 ]^din[ 26 ]^din[ 29 ];
assign dout[2][ 6 ]=din[ 4 ]^din[ 6 ]^din[ 10 ]^din[ 13 ]^din[ 14 ]^din[ 27 ]^din[ 30 ];
assign dout[2][ 7 ]=din[ 5 ]^din[ 7 ]^din[ 11 ]^din[ 14 ]^din[ 15 ]^din[ 28 ]^din[ 31 ];
assign dout[2][ 8 ]=din[ 6 ]^din[ 8 ]^din[ 12 ]^din[ 15 ]^din[ 16 ]^din[ 19 ]^din[ 29 ];
assign dout[2][ 9 ]=din[ 0 ]^din[ 7 ]^din[ 9 ]^din[ 13 ]^din[ 16 ]^din[ 17 ]^din[ 20 ]^din[ 30 ];
assign dout[2][ 10 ]=din[ 0 ]^din[ 1 ]^din[ 4 ]^din[ 8 ]^din[ 10 ]^din[ 14 ]^din[ 18 ]^din[ 21 ]^din[ 31 ];
assign dout[2][ 11 ]=din[ 1 ]^din[ 2 ]^din[ 5 ]^din[ 9 ]^din[ 11 ]^din[ 15 ]^din[ 22 ];
assign dout[2][ 12 ]=din[ 2 ]^din[ 3 ]^din[ 6 ]^din[ 10 ]^din[ 12 ]^din[ 16 ]^din[ 23 ];
assign dout[2][ 13 ]=din[ 3 ]^din[ 7 ]^din[ 11 ]^din[ 13 ]^din[ 24 ];
assign dout[2][ 14 ]=din[ 4 ]^din[ 8 ]^din[ 12 ]^din[ 14 ]^din[ 25 ];
assign dout[2][ 15 ]=din[ 1 ]^din[ 5 ]^din[ 6 ]^din[ 9 ]^din[ 13 ]^din[ 15 ]^din[ 18 ]^din[ 19 ]^din[ 26 ]^din[ 27 ]^din[ 31 ];
assign dout[2][ 16 ]=din[ 2 ]^din[ 6 ]^din[ 7 ]^din[ 10 ]^din[ 14 ]^din[ 16 ]^din[ 20 ]^din[ 27 ]^din[ 28 ];
assign dout[2][ 17 ]=din[ 3 ]^din[ 7 ]^din[ 8 ]^din[ 11 ]^din[ 15 ]^din[ 17 ]^din[ 21 ]^din[ 28 ]^din[ 29 ];
assign dout[2][ 18 ]=din[ 4 ]^din[ 8 ]^din[ 9 ]^din[ 12 ]^din[ 16 ]^din[ 18 ]^din[ 22 ]^din[ 29 ]^din[ 30 ];
assign dout[2][ 19 ]=din[ 0 ]^din[ 5 ]^din[ 9 ]^din[ 10 ]^din[ 13 ]^din[ 17 ]^din[ 19 ]^din[ 23 ]^din[ 30 ]^din[ 31 ];
assign dout[2][ 20 ]=din[ 10 ]^din[ 11 ]^din[ 14 ]^din[ 20 ]^din[ 24 ]^din[ 27 ];
assign dout[2][ 21 ]=din[ 11 ]^din[ 12 ]^din[ 15 ]^din[ 21 ]^din[ 25 ]^din[ 28 ];
assign dout[2][ 22 ]=din[ 12 ]^din[ 13 ]^din[ 16 ]^din[ 22 ]^din[ 26 ]^din[ 29 ];
assign dout[2][ 23 ]=din[ 4 ]^din[ 13 ]^din[ 14 ]^din[ 23 ]^din[ 27 ]^din[ 30 ];
assign dout[2][ 24 ]=din[ 5 ]^din[ 14 ]^din[ 15 ]^din[ 24 ]^din[ 28 ]^din[ 31 ];
assign dout[2][ 25 ]=din[ 6 ]^din[ 15 ]^din[ 16 ]^din[ 19 ]^din[ 25 ]^din[ 29 ];
assign dout[2][ 26 ]=din[ 0 ]^din[ 7 ]^din[ 16 ]^din[ 17 ]^din[ 20 ]^din[ 26 ]^din[ 30 ];
assign dout[2][ 27 ]=din[ 1 ]^din[ 8 ]^din[ 17 ]^din[ 18 ]^din[ 21 ]^din[ 27 ]^din[ 31 ];
assign dout[2][ 28 ]=din[ 2 ]^din[ 9 ]^din[ 18 ]^din[ 22 ]^din[ 28 ];
assign dout[2][ 29 ]=din[ 3 ]^din[ 10 ]^din[ 19 ]^din[ 23 ]^din[ 29 ];
assign dout[2][ 30 ]=din[ 4 ]^din[ 11 ]^din[ 20 ]^din[ 24 ]^din[ 30 ];
assign dout[2][ 31 ]=din[ 5 ]^din[ 12 ]^din[ 21 ]^din[ 25 ]^din[ 31 ];

assign dout[3][ 0 ]=din[ 0 ]^din[ 3 ]^din[ 8 ]^din[ 11 ]^din[ 15 ]^din[ 17 ]^din[ 20 ]^din[ 25 ]^din[ 28 ];
assign dout[3][ 1 ]=din[ 1 ]^din[ 8 ]^din[ 9 ]^din[ 18 ]^din[ 26 ];
assign dout[3][ 2 ]=din[ 0 ]^din[ 2 ]^din[ 4 ]^din[ 9 ]^din[ 10 ]^din[ 17 ]^din[ 19 ]^din[ 27 ];
assign dout[3][ 3 ]=din[ 3 ]^din[ 5 ]^din[ 6 ]^din[ 10 ]^din[ 11 ]^din[ 19 ]^din[ 20 ]^din[ 27 ]^din[ 28 ]^din[ 31 ];
assign dout[3][ 4 ]=din[ 4 ]^din[ 6 ]^din[ 7 ]^din[ 11 ]^din[ 12 ]^din[ 19 ]^din[ 20 ]^din[ 21 ]^din[ 28 ]^din[ 29 ];
assign dout[3][ 5 ]=din[ 3 ]^din[ 5 ]^din[ 7 ]^din[ 8 ]^din[ 11 ]^din[ 13 ]^din[ 15 ]^din[ 16 ]^din[ 22 ]^din[ 25 ]^din[ 28 ]^din[ 30 ];
assign dout[3][ 6 ]=din[ 0 ]^din[ 4 ]^din[ 6 ]^din[ 9 ]^din[ 14 ]^din[ 21 ]^din[ 23 ]^din[ 26 ]^din[ 31 ];
assign dout[3][ 7 ]=din[ 0 ]^din[ 1 ]^din[ 4 ]^din[ 5 ]^din[ 7 ]^din[ 10 ]^din[ 15 ]^din[ 17 ]^din[ 19 ]^din[ 22 ]^din[ 24 ]^din[ 27 ];
assign dout[3][ 8 ]=din[ 2 ]^din[ 5 ]^din[ 8 ]^din[ 11 ]^din[ 16 ]^din[ 19 ]^din[ 20 ]^din[ 23 ]^din[ 25 ]^din[ 27 ]^din[ 28 ]^din[ 31 ];
assign dout[3][ 9 ]=din[ 3 ]^din[ 4 ]^din[ 6 ]^din[ 9 ]^din[ 12 ]^din[ 19 ]^din[ 20 ]^din[ 21 ]^din[ 24 ]^din[ 26 ]^din[ 28 ]^din[ 29 ];
assign dout[3][ 10 ]=din[ 5 ]^din[ 7 ]^din[ 8 ]^din[ 10 ]^din[ 12 ]^din[ 13 ]^din[ 16 ]^din[ 20 ]^din[ 22 ]^din[ 25 ]^din[ 27 ]^din[ 30 ];
assign dout[3][ 11 ]=din[ 0 ]^din[ 1 ]^din[ 4 ]^din[ 8 ]^din[ 9 ]^din[ 11 ]^din[ 13 ]^din[ 14 ]^din[ 18 ]^din[ 19 ]^din[ 21 ]^din[ 23 ]^din[ 26 ]^din[ 27 ]^din[ 28 ];
assign dout[3][ 12 ]=din[ 1 ]^din[ 2 ]^din[ 5 ]^din[ 9 ]^din[ 10 ]^din[ 12 ]^din[ 14 ]^din[ 15 ]^din[ 19 ]^din[ 20 ]^din[ 22 ]^din[ 24 ]^din[ 27 ]^din[ 28 ]^din[ 29 ];
assign dout[3][ 13 ]=din[ 0 ]^din[ 2 ]^din[ 3 ]^din[ 6 ]^din[ 8 ]^din[ 10 ]^din[ 11 ]^din[ 12 ]^din[ 13 ]^din[ 15 ]^din[ 17 ]^din[ 20 ]^din[ 23 ]^din[ 25 ]^din[ 28 ]^din[ 30 ];
assign dout[3][ 14 ]=din[ 1 ]^din[ 3 ]^din[ 4 ]^din[ 7 ]^din[ 9 ]^din[ 11 ]^din[ 12 ]^din[ 13 ]^din[ 14 ]^din[ 16 ]^din[ 18 ]^din[ 21 ]^din[ 24 ]^din[ 26 ]^din[ 29 ]^din[ 31 ];
assign dout[3][ 15 ]=din[ 0 ]^din[ 1 ]^din[ 2 ]^din[ 8 ]^din[ 9 ]^din[ 12 ]^din[ 13 ]^din[ 14 ]^din[ 15 ]^din[ 17 ]^din[ 18 ]^din[ 19 ]^din[ 23 ]^din[ 25 ]^din[ 26 ];
assign dout[3][ 16 ]=din[ 2 ]^din[ 3 ]^din[ 6 ]^din[ 9 ]^din[ 10 ]^din[ 13 ]^din[ 14 ]^din[ 15 ]^din[ 16 ]^din[ 20 ]^din[ 24 ]^din[ 26 ]^din[ 31 ];
assign dout[3][ 17 ]=din[ 3 ]^din[ 4 ]^din[ 7 ]^din[ 10 ]^din[ 11 ]^din[ 14 ]^din[ 15 ]^din[ 16 ]^din[ 17 ]^din[ 19 ]^din[ 21 ]^din[ 25 ]^din[ 27 ];
assign dout[3][ 18 ]=din[ 0 ]^din[ 4 ]^din[ 5 ]^din[ 8 ]^din[ 11 ]^din[ 12 ]^din[ 15 ]^din[ 16 ]^din[ 17 ]^din[ 18 ]^din[ 20 ]^din[ 22 ]^din[ 26 ]^din[ 28 ];
assign dout[3][ 19 ]=din[ 0 ]^din[ 1 ]^din[ 5 ]^din[ 6 ]^din[ 9 ]^din[ 12 ]^din[ 13 ]^din[ 16 ]^din[ 17 ]^din[ 18 ]^din[ 19 ]^din[ 21 ]^din[ 23 ]^din[ 27 ]^din[ 29 ];
assign dout[3][ 20 ]=din[ 1 ]^din[ 2 ]^din[ 5 ]^din[ 7 ]^din[ 9 ]^din[ 13 ]^din[ 14 ]^din[ 18 ]^din[ 19 ]^din[ 20 ]^din[ 23 ]^din[ 24 ]^din[ 26 ]^din[ 28 ]^din[ 31 ];
assign dout[3][ 21 ]=din[ 2 ]^din[ 3 ]^din[ 6 ]^din[ 8 ]^din[ 10 ]^din[ 14 ]^din[ 15 ]^din[ 20 ]^din[ 21 ]^din[ 24 ]^din[ 25 ]^din[ 27 ]^din[ 29 ];
assign dout[3][ 22 ]=din[ 0 ]^din[ 3 ]^din[ 4 ]^din[ 7 ]^din[ 9 ]^din[ 11 ]^din[ 15 ]^din[ 16 ]^din[ 21 ]^din[ 22 ]^din[ 25 ]^din[ 26 ]^din[ 28 ]^din[ 30 ];
assign dout[3][ 23 ]=din[ 0 ]^din[ 1 ]^din[ 4 ]^din[ 5 ]^din[ 10 ]^din[ 21 ]^din[ 22 ]^din[ 23 ]^din[ 26 ]^din[ 27 ]^din[ 31 ];
assign dout[3][ 24 ]=din[ 0 ]^din[ 1 ]^din[ 2 ]^din[ 4 ]^din[ 5 ]^din[ 6 ]^din[ 11 ]^din[ 17 ]^din[ 19 ]^din[ 22 ]^din[ 23 ]^din[ 24 ]^din[ 27 ]^din[ 28 ];
assign dout[3][ 25 ]=din[ 2 ]^din[ 3 ]^din[ 5 ]^din[ 7 ]^din[ 12 ]^din[ 19 ]^din[ 20 ]^din[ 23 ]^din[ 24 ]^din[ 25 ]^din[ 27 ]^din[ 28 ]^din[ 29 ]^din[ 31 ];
assign dout[3][ 26 ]=din[ 0 ]^din[ 3 ]^din[ 6 ]^din[ 8 ]^din[ 13 ]^din[ 17 ]^din[ 19 ]^din[ 20 ]^din[ 21 ]^din[ 24 ]^din[ 25 ]^din[ 26 ]^din[ 28 ]^din[ 29 ]^din[ 30 ];
assign dout[3][ 27 ]=din[ 0 ]^din[ 1 ]^din[ 4 ]^din[ 7 ]^din[ 9 ]^din[ 14 ]^din[ 18 ]^din[ 20 ]^din[ 21 ]^din[ 22 ]^din[ 25 ]^din[ 26 ]^din[ 27 ]^din[ 29 ]^din[ 30 ]^din[ 31 ];
assign dout[3][ 28 ]=din[ 0 ]^din[ 2 ]^din[ 5 ]^din[ 6 ]^din[ 8 ]^din[ 10 ]^din[ 15 ]^din[ 18 ]^din[ 19 ]^din[ 21 ]^din[ 22 ]^din[ 23 ]^din[ 26 ]^din[ 28 ]^din[ 30 ];
assign dout[3][ 29 ]=din[ 1 ]^din[ 3 ]^din[ 6 ]^din[ 7 ]^din[ 9 ]^din[ 11 ]^din[ 16 ]^din[ 19 ]^din[ 20 ]^din[ 22 ]^din[ 23 ]^din[ 24 ]^din[ 27 ]^din[ 29 ]^din[ 31 ];
assign dout[3][ 30 ]=din[ 2 ]^din[ 4 ]^din[ 7 ]^din[ 8 ]^din[ 10 ]^din[ 12 ]^din[ 17 ]^din[ 19 ]^din[ 20 ]^din[ 21 ]^din[ 23 ]^din[ 24 ]^din[ 25 ]^din[ 28 ]^din[ 30 ];
assign dout[3][ 31 ]=din[ 0 ]^din[ 3 ]^din[ 4 ]^din[ 5 ]^din[ 8 ]^din[ 9 ]^din[ 11 ]^din[ 13 ]^din[ 17 ]^din[ 18 ]^din[ 20 ]^din[ 21 ]^din[ 22 ]^din[ 24 ]^din[ 25 ]^din[ 26 ]^din[ 29 ]^din[ 31 ];

endmodule
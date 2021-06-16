module simp_slave(
	input clk,
	input reset,
	input [9:0] slave_address,
	input slave_read,
	input slave_write,
	output [63:0] slave_readdata,
	input [63:0] slave_writedata,
	input slave_byteenable,
	input [63:0] datain [65:0],
	output reg [63:0] dataout
);

reg [63:0] out;
int i;

assign slave_readdata=out;

always @(posedge clk)
	if(reset) begin
		out<=64'd0;
		dataout<=64'd0;
	end
	else begin
		if(slave_write) 
			if(slave_address==10'd0) dataout<=slave_writedata;
			else dataout<={slave_writedata[31:0],32'd0};
		else dataout<=64'd0;
		if(slave_read) out<=datain[slave_address[9:3]];
		
	end
		
endmodule
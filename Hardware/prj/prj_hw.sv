`timescale 1 ns/10 ps 
module prj_hw(
input clk,
input reset,
input [9:0] slave_address,
input slave_read,
input slave_write,
input [63:0] slave_writedata,
output [63:0] slave_readdata,
input [7:0]slave_byteenable,
output [6:0] hex0,
output [6:0] hex1,
output [6:0] hex2,
output [6:0] hex3,
output [6:0] hex4,
output [6:0] hex5,
input bt0,
input bt1
);
wire [31:0] num[3:0];
wire [63:0] res[31:0];
wire [63:0] count_total;
wire shot;
reg enable;
reg p1_rst,p2_rst;
wire rng_rst;
wire [63:0] dataout;
wire [31:0]initial_val[3:0];
wire [63:0] one_count[31:0];
wire tst_en;
reg  [63:0] store [65:0]; //0-31:res,32:total,33:next,34-65:one_count

int i;

always@(posedge clk)begin
	p1_rst<=rng_rst;
	p2_rst<=p1_rst;
	if (reset)begin
		for (i=0;i<=65;i=i+1)store[i]<=64'd0;
		enable<=1'b0;
	end
	else begin
		enable<=enable|(bt0|dataout[63]);
		if(shot) begin
			store[65:34]<=one_count;
			store[31:0]<=res;
			store[32]<=count_total;
			store[33]<={32'd0,num[0]};
		end
		else begin 
			store<=store;
		end
		
	end
end



simp_slave slave1(
	.clk(clk),
	.reset(reset),
	.slave_address(slave_address),
	.slave_read(slave_read),
	.slave_write(slave_write),
	.slave_readdata(slave_readdata),
	.slave_writedata(slave_writedata),
	.slave_byteenable(slave_byteenable),
	.datain(store[65:0]),
	.dataout(dataout)
);
//rng_mt rng0(clk,rng_rst,enable,dataout[31:0],num,tst_en);
rng_lcg rng0(clk,rng_rst,enable,initial_val[0],num[0],tst_en);
rng_lcg rng1(clk,rng_rst,enable,initial_val[1],num[1]);
rng_lcg rng2(clk,rng_rst,enable,initial_val[2],num[2]);
rng_lcg rng3(clk,rng_rst,enable,initial_val[3],num[3]);
test_run test1(clk,p2_rst,tst_en,num,res,one_count,count_total);
//test_part test2(clk,p2_rst,tst_en,num,res,count_total);
//test_maxt test4(clk,p2_rst,tst_en,num,res,count_total);  
//test_runup test3(clk,p2_rst,tst_en,num,res,count_total);
hexto7segment hextto70(store[32][23:20],hex0);
hexto7segment hextto71(store[32][27:24],hex1);
hexto7segment hextto72(store[32][31:28],hex2);
hexto7segment hextto73(store[32][35:32],hex3);
hexto7segment hextto74(store[32][39:36],hex4);
hexto7segment hextto75(store[32][43:40],hex5);
init_lcg initor(dataout[31:0],initial_val);

assign rng_rst=reset|(dataout[31:0]!=32'd0);
assign shot=dataout[62]|bt1;
endmodule
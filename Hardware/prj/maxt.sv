module test_maxt(
input clk,
input rst,
input enable,
input [31:0]rand_num[3:0],
output reg [63:0] out[31:0],
output reg [63:0] total
);

integer i;


reg [63:0] next[31:0];
reg [31:0] max,max_next,max_proc;
reg [3:0] count;

reg e1,e2;
reg proc_en;

reg [31:0] r1a,r1b,r2a;

reg [31:0] tmp1,tmp2,tmp3;


always@(posedge clk)begin
	
	e1<=enable;
	e2<=e1;
	if (~enable)begin

		
		max<=rand_num[0];
		count<=0;
		max_proc<=0;
		proc_en<=0;
	end
	else begin
		if(enable) begin
			r1a<=tmp1;
			r1b<=tmp2;

		end
		if(e1) begin
			r2a<=tmp3;
		end
		if(e2) begin
			count<=count+3'd4;
			if(count==4'hC) begin
				max<=tmp3;
				max_proc<=max_next;
				proc_en<=1;
				
			end
			else begin
				max<=max_next;
				proc_en<=(count<8'h8)?proc_en:0;
			end
		end
	end
		
end

always@(posedge count[3],posedge rst)begin
	if (rst)begin
		total<=64'd0;
		for (i=0;i<=31;i=i+1)begin
			out[i]<=64'd0;
		end
	end
	else if(proc_en)begin
		total<=total+5'h10;
		out[max_proc[31:27]]<=out[max_proc[31:27]]+1'b1;
	end

end

always@(*) begin
	tmp1=(rand_num[0]>rand_num[1])?rand_num[0]:rand_num[1];
	tmp2=(rand_num[2]>rand_num[3])?rand_num[2]:rand_num[3];
	tmp3=(r1a>r1b)?r1a:r1b;
	max_next=(r2a>max)?r2a:max;
end
endmodule


module RAM(Clk,We,Wa,Din,Re,Ra,Dout);
	input Clk,We,Re;
	input [3:0] Wa;
	input [3:0] Ra;
	input [7:0] Din;
	output reg [7:0] Dout;
	reg [7:0] Mem [15:0]
	always @(posedge Clk)
	begin
		if(We)
			Mem[Wa] <= Din;
		if(Re)
			Dout <= Mem[Ra];
	end
endmodule

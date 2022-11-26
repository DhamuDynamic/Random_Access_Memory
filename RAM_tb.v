module RAM_tb();
	reg Clk_tb,Re_tb,We_tb;
	reg [3:0] Ra_tb;
	reg [3:0] Wa_tb;
	reg [7:0] Din_tb;
	wire [7:0] Dout_tb;
	reg [7:0] Mem [15:0];
	integer i,j;
	RAM dut(Clk_tb,We_tb,Wa_tb,Din_tb,Re_tb,Ra_tb,Dout_tb);
	initial
	begin
		Clk_tb = 1'b0;
		forever #10 Clk_tb = ~Clk_tb;
	end
	initial
	begin
		We_tb = 1'b0;
		forever #30 We_tb = ~We_tb;
	end
	initial
	begin
		Re_tb = 1'b0;
		forever #40 Re_tb = ~Re_tb;
	end
	task Write(input[3:0]m,input [7:0]n);
	begin
		@(negedge Clk_tb)
		We_tb = 1'b1;
		Wa_tb = m;
		Din_tb = n;
	end
	endtask
	task Read(input [3:0] p);
	begin
		@(negedge Clk_tb)
		Re_tb = 1'b1;
		Ra_tb = p;
	end
	endtask
	initial
	begin
		for(i=0;i<16;i=i+1)
		begin
			Write(i,{$random}%255)
		end
		for(j=0;j<16;j=j+1)
		begin
			Read(j);
		end
	end
	initial
	begin
		$dumpfile("dump.vcd");
		$dumpvars(1);
	end
	initial #500 $finish;
endmodule
	

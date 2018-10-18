// Ahmad Rasyid
// EE/CSE 469
// Lab 1: ARM 64 bit Register File
// This is commenting section area test

module regfile (ReadData1, ReadData2, WriteData, ReadRegister1, ReadRegister2, WriteRegister, RegWrite, clk);
	input logic	[4:0] 	ReadRegister1, ReadRegister2, WriteRegister;
	input logic [63:0]	WriteData;
	input logic 			RegWrite, clk;
	output logic [63:0]	ReadData1, ReadData1;
	logic [31:0] outDecoder;
	logic [63:0][31:0] outRegister;
	
	
	decoder5_32 decoder (.out(outDecoder), .in(WriteRegister[4:0]), .enable(RegWrite));
	
	genvar registerNum, DFFNum;
	generate
	for(registerNum = 0; registerNum < 31; registerNum++) begin : eachRegister
		for(DFFNum = 0; DFFNum < 64; DFFNum++) begin : eachDFF
			D_FF_en registers (.q(outRegister[DFFNum][registerNum]), .d(WriteData[DFFNum]), .reset(1'b0), .clk, 
									 .enable(outDecoder[registerNum]));
		end
	end
	endgenerate
	
	mux32_1_VAR mux32_1_1 (.out(ReadData1), .in(outRegister), .sel(ReadRegister1));
	mux32_1_VAR mux32_1_2 (.out(ReadData2), .in(outRegister), .sel(ReadRegister2));
	
	always_comb 
	for (int i = 0; i < 64; i++) begin
		outRegister[i][31] = 0;
	end
	
endmodule

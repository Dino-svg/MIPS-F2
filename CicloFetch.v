`timescale 1ns/1ns

module Fetch(
    input clkF, 
    output reg [31:0] instructionF,
    output reg [31:0] PC_plus_4,
    output reg [31:0] PC
);

wire [31:0] In_Wire, Out_Wire;
wire [31:0] inst_Wire;

SUM add(.addrs(Out_Wire), .addrsOut(In_Wire));
PC pc(.dataIn(In_Wire), .clk(clkF), .dataOut(Out_Wire));
memoryInst memI(.addrs(Out_Wire), .instruction(inst_Wire)); 

always @(*) begin
    PC_plus_4 = In_Wire;  // La salida del SUM es PC+4
    PC = Out_Wire;        // La salida del PC es la dirección actual
    instructionF = inst_Wire;
end

endmodule


module Fetch_TB();

  reg  clk_tb;
  wire [31:0]instruction_tb;
  
  Fetch CF(
    .clkF(clk_tb), 
    .instructionF(instruction_tb)
    );
  
  initial begin
	  
  clk_tb = 0;
	#10
	clk_tb = ~clk_tb;
	#10
	clk_tb = ~clk_tb;
	#10
	clk_tb = ~clk_tb;
	#10
	clk_tb = ~clk_tb;
	#10
	clk_tb = ~clk_tb;
	#10
	clk_tb = ~clk_tb;
	
  end

endmodule



`timescale 1ns/1ns

module MIPS_Top(
    input wire clk,
    output wire [31:0] resultadoFinal  
);

wire [31:0] inst_IF, inst_ID;
wire [31:0] PC_IF, PC_ID;
wire [31:0] instruccionActual;

// Etapa Fetch
Fetch fetchstage(.clkF(clk), .instructionF(inst_IF), .PC_plus_4(PC_IF), .PC(PC_IF));
IF_ID_Reg if_idstage(.clk(clk), .inst_in(inst_IF), .PC_plus_4_in(PC_IF), .inst_out(inst_ID), .PC_plus_4_out(PC_ID));
DPTR data_pathstage(.clk(clk), .instruccion(inst_ID), .PC(PC_ID), .PC_plus_4(PC_ID), .resultadoALU(resultadoFinal));

endmodule

module MIPS_Top_TB();

reg clk;
wire [31:0] resultado;

MIPS_Top dut(.clk(clk), .resultadoFinal(resultado));

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Verificación de resultados
initial begin
    #60;  // Esperar ejecución de Sub $20 $15 $9 ($20 = 999 - 100 = 899)
    if (resultado == 32'd899) begin
        $display("$20 = %d", resultado);
    end else begin
        $display("$20 = %d", resultado);
    end
    #40;  // Esperar Add $15 $5 $15 ($15 = 20 + 999 = 1019)
    $display("$15 = %d", dut.data_pathstage.inst_BR.BR_in[15]);
    $finish;
end

endmodule
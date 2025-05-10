module Unidad_control(
    input wire [5:0] OPcode,
    output reg [5:0] salida_control
);

always @(*) begin
    case (OPcode)
        6'b000000: salida_control = 9'b1_010_0_1_00; // Tipo R
        6'b100011: salida_control = 9'b1_001_0_0_01; // lw: RegWrite=1, ALUSrc=1, MemRead=1
        6'b101011: salida_control = 9'b0_001_1_0_01; // sw: MemWrite=1, ALUSrc=1
        6'b000100: salida_control = 9'b0_110_0_0_10; // beq: Branch=1, ALUOp=110
        default:   salida_control = 9'b0_000_0_0_00;
    endcase
end

endmodule


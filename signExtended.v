module SignExtend(
    input [15:0] imm,
    output reg [31:0] imm_ext
);
    assign imm_ext = {{16{imm[15]}}, imm}; // Extensión de signo
endmodule
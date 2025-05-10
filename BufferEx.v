module ID_EX_Reg(
    input clk,
    input [31:0] RD1_in, RD2_in, imm_ext_in,
    input [4:0] rt_in, rd_in,
    output reg [31:0] RD1_out, RD2_out, imm_ext_out,
    output reg [4:0] rt_out, rd_out
);
    always @(posedge clk) begin
        RD1_out <= RD1_in;
        RD2_out <= RD2_in;
        imm_ext_out <= imm_ext_in;
        rt_out <= rt_in;
        rd_out <= rd_in;
    end
endmodule
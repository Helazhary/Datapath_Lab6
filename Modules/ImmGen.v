`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2024 04:26:32 PM
// Design Name: 
// Module Name: ImmGen
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ImmGen(output [31:0] gen_out, input [31:0] inst);
    reg[11:0] imm;
    always @ (*)
    begin
        case(inst[6:0])
            7'b1100011 : imm = {inst[31],inst[7],inst[30:25],inst[11:8]}; //beq
            7'b0000011 : imm = inst[31:20]; //LW
            7'b0100011 : imm = {inst[31:25],inst[11:7]}; //SW

        endcase
    end

    assign gen_out={{20{imm[11]}},imm};
endmodule

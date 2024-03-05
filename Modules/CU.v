`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2024 04:22:31 PM
// Design Name: 
// Module Name: CU
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


module CU(
    input[31:0] inst, output reg Branch, MemRead ,MemtoReg ,MemWrite ,ALUSrc ,RegWrite, output reg [1:0] ALUOp
);

    always @ (*) begin
        case (inst[6:2])


            5'b01100: begin
                Branch= 0;
                MemRead=0;
                MemtoReg=0;
                ALUOp= 2'b10;
                MemWrite= 0;
                ALUSrc=0;
                RegWrite=1;
            end
            5'b00000: begin
                Branch= 0;
                MemRead=1;
                MemtoReg=1;
                ALUOp= 2'b00;
                MemWrite= 0;
                ALUSrc=1;
                RegWrite=1;
            end
            5'b01000: begin
                Branch= 0;
                MemRead=0;
                MemtoReg=0; //dc
                ALUOp= 2'b00;
                MemWrite= 1;
                ALUSrc=1;
                RegWrite=0;
            end
            5'b11000: begin
                Branch= 1;
                MemRead=0;
                MemtoReg=0;//dc
                ALUOp= 2'b01;
                MemWrite= 0;
                ALUSrc=0;
                RegWrite=0;
            end
            


        endcase

    end


endmodule

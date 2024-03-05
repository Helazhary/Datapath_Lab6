`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2024 04:08:35 PM
// Design Name: 
// Module Name: DataPath
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


module DataPath(input clk, rst);


    reg pc[6:0];
    //----------------------------------------------------------------------
    wire Inst [31:0];
    //----------------------------------------------------------------------
    wire Branch, MemRead ,MemtoReg ,MemWrite ,ALUSrc ,RegWrite;
    wire [1:0] ALUOp;
    //----------------------------------------------------------------------
    wire [3:0]ALU_selection;
    //----------------------------------------------------------------------

    wire [31:0] r_data1, r_data2;
    //----------------------------------------------------------------------
    wire [31:0] immediate;
    //----------------------------------------------------------------------
    //----------------------------------------------------------------------
    //----------------------------------------------------------------------



    //------------------------------v Temp Program Counter(PC) v----------------------------------------
    initial begin
        pc= 0;
    end

    always @ (posedge clk) begin
        pc = pc + 1;
    end
    //------------------------------^ Temp Program Counter(PC) ^----------------------------------------


    InstMem IM(.addr(pc), .data_out(Inst));
    //BE WARNED, WAITING FOR DATA MEMORY TO BE DONE FOR W_DATA INPUT!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    N_bit_RegFile#(32) nbrf(.r_addr1(Inst[19:15]), .r_addr2(Inst[24:20]),.w_addr(Inst[11:7]), .w_data(),.w_en(RegWrite),.clk(clk), .rst(rst), .r_data1(r_data1), .r_data2(r_data2));

    CU cu( .inst(inst), .Branch(Branch), .MemRead(MemRead) ,.MemtoReg(MemtoReg) ,.MemWrite(MemWrite) ,.ALUSrc(ALUSrc) ,.RegWrite(RegWrite), . ALUOp(ALUOp));
    ALU_CU alucu(.ALUop(ALUop), .Inst(Inst), .ALU_selection(ALU_selection) );

    ImmGen immgen(.inst(Inst), .gen_out(immediate));

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2024 02:54:31 PM
// Design Name: 
// Module Name: NBitReg
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


module NBitReg #(parameter N=8)(input Load,clk,rst,input [N:0]D, output [N:0]Q);
    genvar i;
    wire [N:0] Temp;
    generate 
        for(i=0; i<=N; i= i+1)
            begin
                DFlipFlop dff(.clk(clk),.rst(rst),.D(Temp[i]),.Q(Q[i]));
                Mux2x1 mux(.a(D[i]), .b(Q[i]), .c(Temp[i]), .s(Load));
            end

  endgenerate 


endmodule

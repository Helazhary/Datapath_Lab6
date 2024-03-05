`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2024 02:50:45 PM
// Design Name: 
// Module Name: InstMem
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

module InstMem (input [5:0] addr, output [31:0] data_out);
    reg [31:0] mem [0:63];
    
    initial begin
        mem[0]=32'b00000000100100010110000010110011;
        mem[1]=32'b00000000100100010000000010110011;
    end
     
    assign data_out = mem[addr];
endmodule

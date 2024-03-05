`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2024 02:12:16 PM
// Design Name: 
// Module Name: N_Bit_ALU
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


module N_Bit_ALU #(parameter N=32)(input [N-1:0] a, b, input [3:0] sel, output zf, output reg [N-1:0] alu_out );

wire [N-1:0]add_out,sub_out;
    FullAdder #(N)fa1(.a(a),.b(b),.c_in(0),.c_out(c_out),.sum(add_out),.addsub(0));
    FullAdder #(N)fa2(.a(a),.b(b),.c_in(0),.c_out(c_out),.sum(sub_out),.addsub(1));
always @ (*) begin
//0010, 0110, 0000, and 0001 
    case (sel)
        4'b0010:     alu_out=add_out; 
        4'b0110:     alu_out=sub_out; 
        4'b0000:      alu_out= a & b;
        4'b0001:    alu_out= a | b;
        default:        alu_out = 0;
    endcase
end
    assign zf=(alu_out==0)?1:0;

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2024 04:46:59 PM
// Design Name: 
// Module Name: ALU_CU
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


module ALU_CU(input[1:0]ALUop,input[31:0]Inst, output reg[3:0]ALU_selection );
    

    always @(*)begin
    case(ALUop)
        2'b00:ALU_selection = 4'b0010;
        2'b01:ALU_selection = 4'b0110;
        2'b10:begin
            case(Inst[14:12])
                3'b000:ALU_selection=(Inst[30]==1)? 4'b0110:4'b0010;
                3'b111:ALU_selection=4'b0000;
                3'b110:ALU_selection=4'b0001;
                default: ALU_selection = 4'b0000;   //That wil; not happen
            endcase 
        end
        
        default: ALU_selection = 4'b0000;   //That wil; not happen
    endcase
    end

endmodule

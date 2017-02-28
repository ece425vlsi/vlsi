//-----------------------------------------------------------------------------
// Title         : ALU Control Unit
// Project       : ECE 313 - Computer Organization
//-----------------------------------------------------------------------------
// File          : alu_control.sv
// Author        : John Nestor  <nestorj@lafayette.edu>
// Organization  : Lafayette College
// 
// Created       : October 2002
// Last modified : 26 February 2017
// 
// Modified for Lab 05 of ECE425 2/27/17 by Adam Ness
//-----------------------------------------------------------------------------
// Description :
//   ALU Control Unit used in Harris & Harris and Patterson & Hennessey
//   Disclaimer: this file was ported from Verilog by hand and not checked (caveat emptor)
//-----------------------------------------------------------------------------

module alu_ctl(
	       input logic [1:0]  alu_op,
	       input logic [5:0]  funct,
	       output logic [6:0] op
	       );
   
    // symbolic constants for MIPS function codes
    parameter F_add  = 6'h20;
    parameter F_sub  = 6'h22;
    parameter F_and  = 6'h24;
    parameter F_or   = 6'h25;
    parameter F_xor  = 6'h26;
    parameter F_nor  = 6'h27;
    parameter F_sltu = 6'h2b;

    always_comb
    begin
        case (alu_op) 
            2'b00 : op = 7'b0101000;    // add for lw, sw, etc.
            2'b01 : op = 7'b1010100;    // sub for beq, bne, etc.
            2'b10 : case (funct) 
                        F_add  : op = 7'b0101000;
                        F_sub  : op = 7'b1010100;
                        F_and  : op = 7'b0001001;
                        F_or   : op = 7'b0111001;
                        F_xor  : op = 7'b0110001;
		        F_nor  : op = 7'b1000001;
			F_sltu : op = 7'b1010110;
		       	default  op = 7'b0000000;
                    endcase
            default op = 7'b0000000;
        endcase
    end
endmodule


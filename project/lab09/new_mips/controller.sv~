module controller(input logic clk, reset, 
                  input logic [5:0]  op,
                  input logic [5:0]  funct,
                  input logic 	     zero, 
                  output logic 	     memwrite, alusrca, 
                  output logic 	     memtoreg, iord, pcen, 
                  output logic 	     regwrite, regdst, 
                  output logic [1:0] pcsrc, alusrcb,
                  output logic [2:0] alucontrol,
                  output logic [3:0] irwrite);
   
   logic 			     pcwrite, brnch;
   logic [1:0] 			     aluop;
   

   // Instantiate your control FSM here:.
   mips_fsm U_FSM(.clk, .reset, .op, .memwrite, .alusrca, .memtoreg, .iord, .pcwrite, .brnch,
		  .regwrite, .regdst, .pcsrc, .alusrcb, .aluop, .irwrite);
   
   // other control decoding
   aludec  ac(.aluop, .funct, .alucontrol);
   
   assign pcen = pcwrite | (brnch & zero); // program counter enable
endmodule

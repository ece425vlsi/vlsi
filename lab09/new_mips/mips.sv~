//---------------------------------------------------------
// mips.sv
// David_Harris@hmc.edu 23 Jan 2008
// Changes 7/3/07
//   Updated to SystemVerilog
//   Fixed endianness
// 23 Jan 08 added $stop
// 13 Feb 08 solutions version using PLA
// 1 April 17 split into separate files & modified controller structure (JN)
//
// Model of subset of MIPS processor described in Ch 1
//  note that no sign extension is done because width is
//  only 8 bits
//---------------------

// simplified MIPS processor
module mips #(parameter WIDTH = 8, REGBITS = 3)
             (input  logic             clk, reset, 
              input  logic [WIDTH-1:0] memdata, 
              output logic             memwrite, 
              output logic [WIDTH-1:0] adr, writedata);

   logic [31:0] instr;
   logic        zero, alusrca, memtoreg, iord, pcen, regwrite, regdst;
   logic [1:0]  pcsrc, alusrcb;
   logic [3:0]  irwrite;
   logic [2:0]  alucontrol;
   logic [5:0]  op;
   logic [5:0]  funct;
   
   // instantaiate controller and datapath
   // use regular controller for RTL simulation
   // PLA-based controller has a slightly different partitioning
   // for the circuit implementation but is functionally equivalent.

   // . notation connects signals by name, even if the port order
   // isn't the same when the schematic or layout editor netlists the 
   // module for circuit simulation

   controller  cont(.clk, .reset, .op, .funct, .zero, .memwrite, 
                    .alusrca, .memtoreg, .iord, .pcen, .regwrite, .regdst,
                    .pcsrc, .alusrcb, .alucontrol, .irwrite); 

   datapath    #(WIDTH, REGBITS) 
               dp(.clk, .reset, .memdata, .alusrca, .memtoreg, .iord, .pcen,
                  .regwrite, .regdst, .pcsrc, .alusrcb, .irwrite, .alucontrol,
                  .zero, .op, .funct, .adr, .writedata);
endmodule


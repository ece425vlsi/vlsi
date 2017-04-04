
module regfile #(parameter WIDTH = 8, REGBITS = 3)
                (input  logic               clk, 
                 input  logic               regwrite, 
                 input  logic [REGBITS-1:0] ra1, ra2, wa, 
                 input  logic [WIDTH-1:0]   wd, 
                 output logic [WIDTH-1:0]   rd1, rd2);

   logic [WIDTH-1:0] RAM [2**REGBITS-1:0];

  // three ported register file
  // read two ports combinationally
  // write third port on rising edge of clock
  // register 0 hardwired to 0
  always @(posedge clk)
    if (regwrite) RAM[wa] <= wd;

  assign rd1 = ra1 ? RAM[ra1] : 0;
  assign rd2 = ra2 ? RAM[ra2] : 0;
endmodule

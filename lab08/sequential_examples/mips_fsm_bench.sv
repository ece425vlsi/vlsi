module mips_fsm_bench;

   logic 	   clk, reset;
   logic [5:0] 	   op;
   logic 	   memwrite, alusrca;
   logic 	   memtoreg, iord, pcwrite, brnch;
   logic 	   regwrite, regdst;
   logic [1:0] 	   pcsrc, alusrcb;
   logic [1:0] 	   aluop;
   logic [3:0] 	   irwrite;

   typedef enum logic [5:0] {
			     LB    = 6'b100000,
                             SB    = 6'b101000,
                             RTYPE = 6'b000000,
                             BEQ   = 6'b000100,
                             J     = 6'b000010
			     } op_t;
   //op_t op;
   
   
   mips_fsm DUV (clk, reset, op, memwrite, alusrca, memtoreg, iord, pcwrite, brnch, regwrite, regdst, pcsrc, alusrcb, aluop, irwrite);

   always begin
      clk = 0;
      #10;
      clk = 1;
      #10;
   end

   initial begin
      reset = 1;
      op = RTYPE;
      @(posedge clk) #1;
      reset = 0;

      @(posedge DUV.state[2]) #1; // GO THRU R TYPE EXECUTION

      @(posedge DUV.state[2]) #1; //
      op = J;

      @(posedge DUV.state[2]) #1; //
      op = BEQ;

      @(posedge DUV.state[2]) #1; //
      op = LB;

      @(posedge DUV.state[2]) #1; //
      op = SB;

      @(posedge DUV.state[2]) #1;
      

      
      
      
      
      
      
      $finish;
   end // initial begin
   
endmodule // mips_fsm_bench




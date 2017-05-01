//-----------------------------------------------------------------------------
// Title         : mips_fsm
// Project       : ECE 425 - VLSI Circuit Design
//-----------------------------------------------------------------------------
// File          : mips_fsm.sv
// Author        : John Nestor, Lafayette College
// Created       : 26.03.2017
// Last modified : 26.03.2017
//-----------------------------------------------------------------------------
// Description :
// Skeleton file for the MIPS control unit FSM
//-----------------------------------------------------------------------------

module mips_fsm(
		input logic 	   clk, reset, 
                input logic [5:0]  op,
                output logic 	   memwrite, alusrca, 
                output logic 	   memtoreg, iord, pcwrite, brnch,
                output logic 	   regwrite, regdst, 
                output logic [1:0] pcsrc, alusrcb,
                output logic [1:0] aluop,
                output logic [3:0] irwrite
		);

   typedef enum logic [3:0] {
			     FETCH1 = 4'b0000, FETCH2 = 4'b0001, FETCH3 = 4'b0010, FETCH4 = 4'b0011,
			     DECODE = 4'h4, MEMADR = 4'h5, LBRD = 4'h6, LBWR = 4'h7, SBWR = 4'h8,
			     RTYPEEX = 4'h9, RTYPEWR = 4'ha, BEQEX = 4'hb, JEX = 4'hc
			     } state_t;

   typedef enum logic [5:0] {
			     LB    = 6'b100000,
                             SB    = 6'b101000,
                             RTYPE = 6'b000000,
                             BEQ   = 6'b000100,
                             J     = 6'b000010
			     } op_t;

   state_t state, next;

   //op_t code;

   //assign code = op;
   
   

   // add state register and next state logic / output logic here

   always_ff @(posedge clk)
     begin
	if(reset)
	  state <= FETCH1;
	else
	  state <= next;
     end

   always_comb
     begin
	next = FETCH1;
        memwrite = 0;
	alusrca = 0;
        memtoreg = 0;
	iord = 0;
	pcwrite = 0;
	brnch = 0;
        regwrite = 0;
	regdst = 0;
        pcsrc = 2'b00;
	alusrcb = 2'b00;
        aluop = 2'b00;
        irwrite = 4'b0000;
	
	case(state)
	  FETCH1: 
	    begin
	       next = FETCH2;
	       alusrca = 0;
	       iord = 0;
	       irwrite = 4'b0001;
	       alusrcb = 2'b01;
	       aluop = 2'b00;
	       pcwrite = 1;
	       pcsrc = 2'b00;
	    end // case: FETCH1

	  FETCH2:
	    begin
	       next = FETCH3;
	       alusrca = 0;
	       iord = 0;
	       irwrite = 4'b0010;
	       alusrcb = 2'b01;
	       aluop = 2'b00;
	       pcwrite = 1;
	       pcsrc = 2'b00;
	    end // case: FETCH2

	  FETCH3:
	    begin
	       next = FETCH4;
	       alusrca = 0;
	       iord = 0;
	       irwrite = 4'b0100;
	       alusrcb = 2'b01;
	       aluop = 2'b00;
	       pcwrite = 1;
	       pcsrc = 2'b00;
	    end // case: FETCH3

	  FETCH4:
	    begin
	       next = DECODE;
	       alusrca = 0;
	       iord = 0;
	       irwrite = 4'b1000;
	       alusrcb = 2'b01;
	       aluop = 2'b00;
	       pcwrite = 1;
	       pcsrc = 2'b00;
	    end // case: FETCH4

	  DECODE:
	    begin
	       if(op == J)
		 next = JEX;
	       else if (op == BEQ)
		 next = BEQEX;
	       else if (op == RTYPE)
		 next = RTYPEEX;
	       else if ((op == LB) || (op == SB))
		 next = MEMADR;
	       else
		 next = FETCH1;
	       
	       alusrca = 0;
	       alusrcb = 2'b11;
	       aluop = 2'b00;
	    end // case: DECODE

	  MEMADR:
	    begin
	       if(op == SB)
		 next = SBWR;
	       else if (op == LB)
		 next = LBRD;
	       else
		 next = FETCH1;
	       
	       alusrca = 1;
	       alusrcb = 2'b10;
	       aluop = 2'b00;
	    end // case: MEMADR

	  LBRD:
	    begin
	       next = LBWR;
	       iord = 1;
	    end

	  LBWR:
	    begin
	       next = FETCH1;
	       regdst = 0;
	       regwrite = 1;
	       memtoreg = 1;
	    end

	  SBWR:
	    begin
	       next = FETCH1;
	       memwrite = 1;
	       iord = 1;
	    end

	  RTYPEEX:
	    begin
	       next = RTYPEWR;
	       alusrca = 1;
	       alusrcb = 2'b00;
	       aluop = 2'b10;
	    end

	  RTYPEWR:
	    begin
	       next = FETCH1;
	       regdst = 1;
	       regwrite = 1;
	       memtoreg = 0;
	    end

	  BEQEX:
	    begin
	       next = FETCH1;
	       alusrca = 1;
	       alusrcb = 2'b00;
	       aluop = 2'b01;
	       brnch = 1;
	       pcsrc = 2'b01;
	    end

	  JEX:
	    begin
	       next = FETCH1;
	       pcwrite = 1;
	       pcsrc = 2'b10;
	    end

	endcase // case (state)
	
     end // always_comb
   
   
   


endmodule // mips_fsm



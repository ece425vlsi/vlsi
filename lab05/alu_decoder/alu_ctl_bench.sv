module alu_ctl_bench;

	logic [1:0] alu_op;
	logic [5:0] funct;
	logic [6:0] op;

	alt_ctl DUV(alu_op, funct, op);

	initial begin
		$vcdpluson;
		// add
		alu_op = 2'b10;
		funct  = 6'h20;
		#10;
		$display("time=%t alu_op=%b funct=%h op=%b", $time, alu_op, funct, op);

		// xor
		alu_op = 2'b10;
		funct  = 6'h27;
		$display("time=%t alu_op=%b funct=%h op=%b", $time, alu_op, funct, op);	
		$finish;
	end
endmodule

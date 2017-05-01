module shifter_bench();

   logic             right, arith;

   logic [7:0] 	     din, dout;
   logic [4:0] 	     shamt;
   


   shifter #(8) shfter(.right, .arith, .din, .dout, .shamt);

   always
     begin
	right = 0;
	arith = 0;
	din = 8'h00;
	shamt = 3'b000;
	#10;
	din = 8'h55;
	shamt = 1;
	#10;
	din = 8'h33;
	shamt = 2;
	#10;
	right = 1;
	shamt = 1;
	#10;
	din = 8'hc5;
	#10;
	arith = 1;
	#10;
	right = 0;
	#10;
	shamt = 5;
	#10;
	right = 1;
	#10;
	arith = 0;

	$stop;
	
     end
   
   

   // initialize test
   // initial
   //   begin
   // 	reset <= 1; # 22; reset <= 0;
   //   end

   // // generate clock to sequence tests
   // always
   //   begin
   // 	clk <= 1; # 5; clk <= 0; # 5;
   //   end

   // define ph1 and ph2 for when they are used with the circuit implementation
   // assign ph1 = clk;
   // assign ph2 = ~clk;

   // always@(negedge clk)
   //   begin
   // 	if(memwrite) begin
   //         //assert(adr == 76 & writedata == 7)
   //         assert(adr == 8'h1c & writedata == 8'h0a)
   //           $display("Simulation completed successfully");
   //         else $error("Simulation failed");
   //         $stop;
   // 	end
   //   end
endmodule // shifter_bench

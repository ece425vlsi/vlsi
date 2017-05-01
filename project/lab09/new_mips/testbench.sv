// testbench for testing MIPS
module testbench #(parameter WIDTH = 8, REGBITS = 3)();

  logic             clk, ph1, ph2;
  logic             reset;
  logic             memwrite;
  logic [WIDTH-1:0] adr, writedata;
  logic [WIDTH-1:0] memdata;

  // instantiate devices to be tested
  // .x notation matches a port named x with a signal of the same name
  // 
  mips #(WIDTH,REGBITS) DUV(.clk, .reset, .memdata, .memwrite, .adr, .writedata);

  // external memory for code and data
  exmemory #(WIDTH) exmem(.clk, .memwrite, .adr, .writedata, .memdata);

  // initialize test
  initial
    begin
      reset <= 1; # 22; reset <= 0;
    end

  // generate clock to sequence tests
  always
    begin
      clk <= 1; # 5; clk <= 0; # 5;
    end

  // define ph1 and ph2 for when they are used with the circuit implementation
  assign ph1 = clk;
  assign ph2 = ~clk;

  always@(negedge clk)
    begin
      if(memwrite) begin
         //assert(adr == 76 & writedata == 7)  // original program
         //assert(adr == 8'h1c & writedata == 8'h0a) // program simulating xor and nor
	 assert(adr == 8'h2c & writedata == 8'h15) // program simulating shifting
          $display("Simulation completed successfully!");
        else $error("Simulation failed");
        $stop;
      end
    end
endmodule

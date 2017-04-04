module counter_bench;
   logic clk, clr, up, load;
   logic  [3:0] Q, D;
   
   counter DUV (.clk(clk), .clr(clr), .up(up), .Q(Q), .load(load), .D(D));

   always begin
      clk = 0;
      #10;
      clk = 1;
      #10;
   end

   initial begin
      // $vcdpluson;   // dump signals to file vcdplus.vcd - uncomment this if using VCS
      clr = 1;
      up = 0;
      load = 0;
      D = 4'h0;
      #1;
      @(posedge clk) #1;
      clr = 0;
      $display("time=%t, clr=%d, up=%d, Q=%h", $time, clr, up, Q);
      repeat (9) begin
	 @(posedge clk) #1;
	 $display("time=%t, clr=%d, up=%d, Q=%h", $time, clr, up, Q);
      end

      D = 4'h2;
      load = 1;
      @(posedge clk) #1;
      load = 0;

      repeat (9) begin
	 @(posedge clk) #1;
	 $display("time=%t, clr=%d, up=%d, Q=%h", $time, clr, up, Q);
      end

      up = 1;
      repeat (9) begin
	 @(posedge clk) #1;
	 $display("time=%t, clr=%d, up=%d, Q=%h", $time, clr, up, Q);
      end

      D = 4'hc;
      load = 1;
      @(posedge clk) #1;
      load = 0;

      repeat (9) begin
	 @(posedge clk) #1;
	 $display("time=%t, clr=%d, up=%d, Q=%h", $time, clr, up, Q);
      end

      $finish;
   end // initial begin
endmodule // counter_bench



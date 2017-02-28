module counter_bench;
   reg clk, clr, up;
   wire [3:0] Q;
   
   counter DUV (clk, clr, up, Q);

   always begin
      clk = 0;
      #10;
      clk = 1;
      #10;
   end

   initial begin
      $vcdpluson;   /* dump signals to file vcdplus.vcd */
      clr = 1;
      up = 0;
      #1;
      @(posedge clk) #1;
      clr = 0;
      $display("time=%t, clr=%d, up=%d, Q=%h", $time, clr, up, Q);
      repeat (18) begin
	 @(posedge clk) #1;
	 $display("time=%t, clr=%d, up=%d, Q=%h", $time, clr, up, Q);
      end
      up = 1;
      repeat (18) begin
	 @(posedge clk) #1;
	 $display("time=%t, clr=%d, up=%d, Q=%h", $time, clr, up, Q);
      end
      $finish;
   end // initial begin
endmodule // counter_bench



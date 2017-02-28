module decoder_bench;

   reg [1:0] a;
   wire      y0, y1, y2, y3;
   
   decoder DUV (a, y0, y1, y2, y3);

   initial begin
      $vcdpluson;   /* dump signals to file vcdplus.vcd */
      a = 2'd0;
      #10;       
      $display("time=%t a=%d y0y1y2y3 = %b %b %b %b", $time, a, y0, y1, y2, y3);
      a = 2'd1;
      #10;
      $display("time=%t a=%d y0y1y2y3 = %b %b %b %b", $time, a, y0, y1, y2, y3);
      a = 2'd2;
      #10;
      $display("time=%t a=%d y0y1y2y3 = %b %b %b %b", $time, a, y0, y1, y2, y3);
      a = 2'd3;
      #10;
      $display("time=%t a=%d y0y1y2y3 = %b %b %b %b", $time, a, y0, y1, y2, y3);
      a = 2'd0;
      #10;
      $display("time=%t a=%d y0y1y2y3 = %b %b %b %b", $time, a, y0, y1, y2, y3);
      $finish;
   end // initial begin
endmodule // decoder_test


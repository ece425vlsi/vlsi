module decoder(a,y0,y1,y2,y3);
   input [1:0] a;
   output      y0, y1, y2, y3;
   reg 	       y0, y1, y2, y3;

   always @(a)
      begin
	 y0 = 0;
	 y1 = 0;
	 y2 = 0;
	 y3 = 0;
	 case (a)
	   2'b00: y0 = 1;
	   2'b01: y1 = 1;
	   2'b10: y2 = 1;
	   2'b11: y3 = 1;
	 endcase // case(a)
      end // always @ (a)
endmodule // decoder

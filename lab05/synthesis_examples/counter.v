module counter(input clk, input clr, input up,
	       output reg [3:0] Q /*, output carry*/);



//   assign 	      carry =  ( up && (Q == 4'b1111) )
//                            || (~up && (Q == 4'b0000));
   
   always @(posedge clk)
     begin
	if (clr) Q <= 4'd0;
	else if (up) Q <= Q + 1;
	else Q <= Q - 1;
     end

endmodule // counter


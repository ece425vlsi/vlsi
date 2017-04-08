module shifter #(parameter WIDTH=8)
   (
    input byte 		     din,
    input logic [4:0] 	     shamt,
    input logic 	     right,
    input logic 	     arith,
    output logic [WIDTH-1:0] dout
    );

   always_comb
     begin
	if(right)
	  if(arith) dout = din >>> shamt;
	  else dout = din >> shamt;
	else dout = din << shamt;
     end
   
endmodule // shifter


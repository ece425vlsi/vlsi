module alu #(parameter WIDTH = 8)
   (input  logic [WIDTH-1:0] a, b, 
    input logic [6:0] 	     alucontrol, 
    output logic [WIDTH-1:0] result,
    output logic 	     zero);

   logic [WIDTH-1:0] 	     b2, andresult, orresult, sumresult;
   logic 		     sltresult;

   //logic 		     overflow;
   

   //andN    andblock(a, b, andresult);
   //orN     orblock(a, b, orresult);
   //condinv binv(b, alucontrol[2], b2);
   //assign overflow = ((a+b2) > 255);
   

   mux4 #(.WIDTH(1)) opmux7(.d0(alucontrol[6]), .d1(alucontrol[5]), .d2(alucontrol[4]), .d3(alucontrol[3]), .s({a[7], b[7]}), .y(b2[7]));
   mux4 #(.WIDTH(1)) opmux6(.d0(alucontrol[6]), .d1(alucontrol[5]), .d2(alucontrol[4]), .d3(alucontrol[3]), .s({a[6], b[6]}), .y(b2[6]));
   mux4 #(.WIDTH(1)) opmux5(.d0(alucontrol[6]), .d1(alucontrol[5]), .d2(alucontrol[4]), .d3(alucontrol[3]), .s({a[5], b[5]}), .y(b2[5]));
   mux4 #(.WIDTH(1)) opmux4(.d0(alucontrol[6]), .d1(alucontrol[5]), .d2(alucontrol[4]), .d3(alucontrol[3]), .s({a[4], b[4]}), .y(b2[4]));
   mux4 #(.WIDTH(1)) opmux3(.d0(alucontrol[6]), .d1(alucontrol[5]), .d2(alucontrol[4]), .d3(alucontrol[3]), .s({a[3], b[3]}), .y(b2[3]));
   mux4 #(.WIDTH(1)) opmux2(.d0(alucontrol[6]), .d1(alucontrol[5]), .d2(alucontrol[4]), .d3(alucontrol[3]), .s({a[2], b[2]}), .y(b2[2]));
   mux4 #(.WIDTH(1)) opmux1(.d0(alucontrol[6]), .d1(alucontrol[5]), .d2(alucontrol[4]), .d3(alucontrol[3]), .s({a[1], b[1]}), .y(b2[1]));
   mux4 #(.WIDTH(1)) opmux0(.d0(alucontrol[6]), .d1(alucontrol[5]), .d2(alucontrol[4]), .d3(alucontrol[3]), .s({a[0], b[0]}), .y(b2[0]));
   

   adder   addblock(a, b2, alucontrol[2], sumresult);

   mux3 #(.WIDTH(1)) resultmux7(.d0(sumresult[7]), .d1(b2[7]), .d2(1'b0), .s({alucontrol[1], alucontrol[0]}), .y(result[7]));
   mux3 #(.WIDTH(1)) resultmux6(.d0(sumresult[6]), .d1(b2[6]), .d2(1'b0), .s({alucontrol[1], alucontrol[0]}), .y(result[6]));
   mux3 #(.WIDTH(1)) resultmux5(.d0(sumresult[5]), .d1(b2[5]), .d2(1'b0), .s({alucontrol[1], alucontrol[0]}), .y(result[5]));
   mux3 #(.WIDTH(1)) resultmux4(.d0(sumresult[4]), .d1(b2[4]), .d2(1'b0), .s({alucontrol[1], alucontrol[0]}), .y(result[4]));
   mux3 #(.WIDTH(1)) resultmux3(.d0(sumresult[3]), .d1(b2[3]), .d2(1'b0), .s({alucontrol[1], alucontrol[0]}), .y(result[3]));
   mux3 #(.WIDTH(1)) resultmux2(.d0(sumresult[2]), .d1(b2[2]), .d2(1'b0), .s({alucontrol[1], alucontrol[0]}), .y(result[2]));
   mux3 #(.WIDTH(1)) resultmux1(.d0(sumresult[1]), .d1(b2[1]), .d2(1'b0), .s({alucontrol[1], alucontrol[0]}), .y(result[1]));
   mux3 #(.WIDTH(1)) resultmux0(.d0(sumresult[0]), .d1(b2[0]), .d2(sltresult), .s({alucontrol[1], alucontrol[0]}), .y(result[0]));

   // slt should be 1 if most significant bit of sum is 1
   assign sltresult = sumresult[WIDTH-1];

   
   zerodetect #(WIDTH) zd(result, zero);
endmodule // alu


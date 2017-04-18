/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP5-2
// Date      : Tue Apr 18 11:37:08 2017
/////////////////////////////////////////////////////////////


module three_eight_decoder ( k, right, s );
  input [2:0] k;
  output [7:0] s;
  input right;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12;

  INVX2 U3 ( .A(k[2]), .Y(n1) );
  INVX2 U4 ( .A(k[1]), .Y(n2) );
  INVX2 U5 ( .A(k[0]), .Y(n3) );
  INVX2 U6 ( .A(right), .Y(n4) );
  OAI22X1 U7 ( .A(n5), .B(n6), .C(n7), .D(n8), .Y(s[7]) );
  OAI22X1 U8 ( .A(n6), .B(n9), .C(n8), .D(n10), .Y(s[6]) );
  OAI22X1 U9 ( .A(n8), .B(n9), .C(n6), .D(n10), .Y(s[5]) );
  OAI22X1 U10 ( .A(n8), .B(n5), .C(n7), .D(n6), .Y(s[4]) );
  NAND2X1 U11 ( .A(right), .B(k[2]), .Y(n6) );
  NAND2X1 U12 ( .A(n1), .B(n4), .Y(n8) );
  OAI22X1 U13 ( .A(n5), .B(n11), .C(n7), .D(n12), .Y(s[3]) );
  OAI22X1 U14 ( .A(n9), .B(n11), .C(n10), .D(n12), .Y(s[2]) );
  OAI22X1 U15 ( .A(n9), .B(n12), .C(n10), .D(n11), .Y(s[1]) );
  NAND2X1 U16 ( .A(k[0]), .B(n2), .Y(n10) );
  NAND2X1 U17 ( .A(k[1]), .B(n3), .Y(n9) );
  OAI22X1 U18 ( .A(n5), .B(n12), .C(n7), .D(n11), .Y(s[0]) );
  NAND2X1 U19 ( .A(right), .B(n1), .Y(n11) );
  NAND2X1 U20 ( .A(n3), .B(n2), .Y(n7) );
  NAND2X1 U21 ( .A(k[2]), .B(n4), .Y(n12) );
  NAND2X1 U22 ( .A(k[1]), .B(k[0]), .Y(n5) );
endmodule


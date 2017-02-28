/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP5-2
// Date      : Tue Feb 28 14:15:05 2017
/////////////////////////////////////////////////////////////


module alu_ctl ( alu_op, funct, op );
  input [1:0] alu_op;
  input [5:0] funct;
  output [6:0] op;
  wire   n1, n2, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24;

  AND2X2 U3 ( .A(funct[1]), .B(funct[3]), .Y(n22) );
  INVX2 U4 ( .A(op[2]), .Y(n1) );
  INVX2 U5 ( .A(alu_op[1]), .Y(n2) );
  INVX2 U6 ( .A(n20), .Y(op[1]) );
  INVX2 U7 ( .A(n8), .Y(op[0]) );
  INVX2 U8 ( .A(n11), .Y(n5) );
  INVX2 U9 ( .A(funct[1]), .Y(n6) );
  INVX2 U10 ( .A(funct[0]), .Y(n7) );
  OAI21X1 U11 ( .A(n8), .B(n9), .C(n1), .Y(op[6]) );
  NAND2X1 U12 ( .A(funct[1]), .B(funct[0]), .Y(n9) );
  OAI22X1 U13 ( .A(alu_op[1]), .B(alu_op[0]), .C(n10), .D(n5), .Y(op[5]) );
  AOI22X1 U14 ( .A(n12), .B(n7), .C(funct[2]), .D(n13), .Y(n10) );
  XOR2X1 U15 ( .A(funct[1]), .B(funct[0]), .Y(n13) );
  NOR2X1 U16 ( .A(funct[2]), .B(funct[1]), .Y(n12) );
  NAND3X1 U17 ( .A(n14), .B(n15), .C(n16), .Y(op[4]) );
  NAND3X1 U18 ( .A(funct[0]), .B(n6), .C(op[0]), .Y(n14) );
  OAI21X1 U19 ( .A(alu_op[1]), .B(alu_op[0]), .C(n17), .Y(op[3]) );
  NAND3X1 U20 ( .A(n18), .B(n6), .C(n11), .Y(n17) );
  OAI21X1 U21 ( .A(funct[2]), .B(n15), .C(n16), .Y(op[2]) );
  AOI21X1 U22 ( .A(n2), .B(alu_op[0]), .C(op[1]), .Y(n16) );
  NAND3X1 U23 ( .A(n11), .B(funct[1]), .C(n19), .Y(n15) );
  NOR2X1 U24 ( .A(funct[0]), .B(n2), .Y(n19) );
  NAND3X1 U25 ( .A(n21), .B(alu_op[1]), .C(n22), .Y(n20) );
  NOR2X1 U26 ( .A(n18), .B(n23), .Y(n21) );
  OR2X1 U27 ( .A(n7), .B(funct[2]), .Y(n18) );
  NAND3X1 U28 ( .A(n11), .B(alu_op[1]), .C(funct[2]), .Y(n8) );
  NOR2X1 U29 ( .A(n23), .B(funct[3]), .Y(n11) );
  NAND2X1 U30 ( .A(n24), .B(funct[5]), .Y(n23) );
  NOR2X1 U31 ( .A(funct[4]), .B(alu_op[0]), .Y(n24) );
endmodule


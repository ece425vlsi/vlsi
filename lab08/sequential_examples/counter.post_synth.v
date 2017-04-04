/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP5-2
// Date      : Fri Mar 31 14:44:29 2017
/////////////////////////////////////////////////////////////


module counter ( clk, clr, up, load, D, Q );
  input [3:0] D;
  output [3:0] Q;
  input clk, clr, up, load;
  wire   N13, N14, N15, N16, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28;

  DFFPOSX1 \Q_reg[0]  ( .D(N13), .CLK(clk), .Q(Q[0]) );
  DFFPOSX1 \Q_reg[1]  ( .D(N14), .CLK(clk), .Q(Q[1]) );
  DFFPOSX1 \Q_reg[2]  ( .D(N15), .CLK(clk), .Q(Q[2]) );
  DFFPOSX1 \Q_reg[3]  ( .D(N16), .CLK(clk), .Q(Q[3]) );
  INVX2 U3 ( .A(Q[3]), .Y(n1) );
  INVX2 U4 ( .A(Q[2]), .Y(n2) );
  INVX2 U5 ( .A(Q[1]), .Y(n3) );
  INVX2 U6 ( .A(Q[0]), .Y(n4) );
  INVX2 U7 ( .A(up), .Y(n5) );
  INVX2 U8 ( .A(load), .Y(n6) );
  OAI21X1 U9 ( .A(n7), .B(n8), .C(n9), .Y(N16) );
  NAND2X1 U10 ( .A(D[3]), .B(n10), .Y(n9) );
  AOI21X1 U11 ( .A(n11), .B(n1), .C(n12), .Y(n7) );
  AOI21X1 U12 ( .A(n13), .B(n14), .C(n1), .Y(n12) );
  AOI22X1 U13 ( .A(Q[1]), .B(n2), .C(Q[2]), .D(n5), .Y(n13) );
  OAI21X1 U14 ( .A(n2), .B(n15), .C(n16), .Y(n11) );
  NAND2X1 U15 ( .A(Q[1]), .B(n17), .Y(n15) );
  OAI21X1 U16 ( .A(n18), .B(n8), .C(n19), .Y(N15) );
  NAND2X1 U17 ( .A(D[2]), .B(n10), .Y(n19) );
  AOI21X1 U18 ( .A(Q[2]), .B(n20), .C(n21), .Y(n18) );
  OAI21X1 U19 ( .A(n3), .B(n22), .C(n16), .Y(n21) );
  OR2X1 U20 ( .A(n23), .B(Q[2]), .Y(n16) );
  NAND2X1 U21 ( .A(n17), .B(n2), .Y(n22) );
  OAI21X1 U22 ( .A(up), .B(n3), .C(n14), .Y(n20) );
  AOI22X1 U23 ( .A(n3), .B(Q[0]), .C(n4), .D(up), .Y(n14) );
  OAI21X1 U24 ( .A(n24), .B(n8), .C(n25), .Y(N14) );
  NAND2X1 U25 ( .A(D[1]), .B(n10), .Y(n25) );
  AOI21X1 U26 ( .A(n17), .B(n3), .C(n26), .Y(n24) );
  OAI21X1 U27 ( .A(n27), .B(n3), .C(n23), .Y(n26) );
  NAND3X1 U28 ( .A(n3), .B(n5), .C(n4), .Y(n23) );
  XNOR2X1 U29 ( .A(Q[0]), .B(up), .Y(n27) );
  NOR2X1 U30 ( .A(n5), .B(n4), .Y(n17) );
  OAI21X1 U31 ( .A(Q[0]), .B(n8), .C(n28), .Y(N13) );
  NAND2X1 U32 ( .A(D[0]), .B(n10), .Y(n28) );
  NOR2X1 U33 ( .A(n6), .B(clr), .Y(n10) );
  OR2X1 U34 ( .A(clr), .B(load), .Y(n8) );
endmodule


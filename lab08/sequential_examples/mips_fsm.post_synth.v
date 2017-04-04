/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP5-2
// Date      : Fri Mar 31 17:20:44 2017
/////////////////////////////////////////////////////////////


module mips_fsm ( clk, reset, op, memwrite, alusrca, memtoreg, iord, pcwrite, 
        brnch, regwrite, regdst, pcsrc, alusrcb, aluop, irwrite );
  input [5:0] op;
  output [1:0] pcsrc;
  output [1:0] alusrcb;
  output [1:0] aluop;
  output [3:0] irwrite;
  input clk, reset;
  output memwrite, alusrca, memtoreg, iord, pcwrite, brnch, regwrite, regdst;
  wire   brnch, N21, N22, N23, N24, N31, n2, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49;
  wire   [3:0] state;
  assign aluop[1] = 1'b0;
  assign aluop[0] = brnch;
  assign pcsrc[0] = brnch;
  assign irwrite[0] = N31;

  DFFPOSX1 \state_reg[0]  ( .D(N21), .CLK(clk), .Q(state[0]) );
  DFFPOSX1 \state_reg[3]  ( .D(N24), .CLK(clk), .Q(state[3]) );
  DFFPOSX1 \state_reg[2]  ( .D(N23), .CLK(clk), .Q(state[2]) );
  DFFPOSX1 \state_reg[1]  ( .D(N22), .CLK(clk), .Q(state[1]) );
  AND2X2 U3 ( .A(n44), .B(n5), .Y(N21) );
  AND2X2 U4 ( .A(n17), .B(op[5]), .Y(n47) );
  INVX2 U5 ( .A(n19), .Y(pcsrc[1]) );
  INVX2 U6 ( .A(memwrite), .Y(n2) );
  INVX2 U7 ( .A(alusrcb[1]), .Y(n3) );
  INVX2 U8 ( .A(irwrite[3]), .Y(n4) );
  INVX2 U9 ( .A(state[3]), .Y(n5) );
  INVX2 U10 ( .A(state[2]), .Y(n6) );
  INVX2 U11 ( .A(n21), .Y(n7) );
  INVX2 U12 ( .A(n25), .Y(n8) );
  INVX2 U13 ( .A(state[1]), .Y(n9) );
  INVX2 U14 ( .A(state[0]), .Y(n10) );
  INVX2 U15 ( .A(n41), .Y(n11) );
  INVX2 U16 ( .A(reset), .Y(n12) );
  INVX2 U17 ( .A(n33), .Y(n13) );
  INVX2 U18 ( .A(op[3]), .Y(n14) );
  INVX2 U19 ( .A(op[2]), .Y(n15) );
  INVX2 U20 ( .A(op[1]), .Y(n16) );
  INVX2 U21 ( .A(op[0]), .Y(n17) );
  OR2X1 U22 ( .A(regdst), .B(memtoreg), .Y(regwrite) );
  NOR2X1 U23 ( .A(n18), .B(n8), .Y(regdst) );
  NAND2X1 U24 ( .A(n19), .B(n20), .Y(pcwrite) );
  NAND3X1 U25 ( .A(state[3]), .B(state[2]), .C(n21), .Y(n19) );
  NOR2X1 U26 ( .A(n8), .B(n20), .Y(irwrite[2]) );
  NOR2X1 U27 ( .A(n20), .B(n22), .Y(irwrite[1]) );
  NAND2X1 U28 ( .A(state[0]), .B(n9), .Y(n22) );
  NOR2X1 U29 ( .A(n23), .B(n24), .Y(memtoreg) );
  OAI21X1 U30 ( .A(n23), .B(n8), .C(n2), .Y(iord) );
  NOR2X1 U31 ( .A(n7), .B(n18), .Y(memwrite) );
  NOR2X1 U32 ( .A(n18), .B(n24), .Y(brnch) );
  OAI21X1 U33 ( .A(state[3]), .B(n7), .C(n20), .Y(alusrcb[0]) );
  AOI21X1 U34 ( .A(n3), .B(n18), .C(n10), .Y(alusrca) );
  NOR2X1 U35 ( .A(n7), .B(n20), .Y(N31) );
  NOR2X1 U36 ( .A(state[0]), .B(state[1]), .Y(n21) );
  OAI21X1 U37 ( .A(n3), .B(n26), .C(n27), .Y(N24) );
  NAND3X1 U38 ( .A(n28), .B(n12), .C(state[0]), .Y(n27) );
  OAI21X1 U39 ( .A(state[1]), .B(n18), .C(n29), .Y(n28) );
  NAND3X1 U40 ( .A(n13), .B(alusrcb[1]), .C(op[3]), .Y(n29) );
  NAND2X1 U41 ( .A(state[3]), .B(n6), .Y(n18) );
  OAI21X1 U42 ( .A(n16), .B(n15), .C(n11), .Y(n26) );
  OAI21X1 U43 ( .A(n30), .B(n23), .C(n31), .Y(N23) );
  NAND2X1 U44 ( .A(n32), .B(n12), .Y(n31) );
  OAI21X1 U45 ( .A(n33), .B(n34), .C(n4), .Y(n32) );
  NOR2X1 U46 ( .A(n20), .B(n24), .Y(irwrite[3]) );
  NAND2X1 U47 ( .A(state[1]), .B(state[0]), .Y(n24) );
  NAND2X1 U48 ( .A(n6), .B(n5), .Y(n20) );
  NAND2X1 U49 ( .A(alusrcb[1]), .B(n14), .Y(n34) );
  NOR2X1 U50 ( .A(n23), .B(state[1]), .Y(alusrcb[1]) );
  AOI22X1 U51 ( .A(n35), .B(n11), .C(n36), .D(n37), .Y(n30) );
  NOR2X1 U52 ( .A(op[2]), .B(n16), .Y(n35) );
  OAI21X1 U53 ( .A(reset), .B(n38), .C(n39), .Y(N22) );
  NAND3X1 U54 ( .A(n11), .B(op[2]), .C(n40), .Y(n39) );
  NOR2X1 U55 ( .A(op[1]), .B(n23), .Y(n40) );
  NAND2X1 U56 ( .A(state[2]), .B(n5), .Y(n23) );
  AOI22X1 U57 ( .A(n42), .B(state[0]), .C(n25), .D(n5), .Y(n38) );
  NOR2X1 U58 ( .A(n9), .B(state[0]), .Y(n25) );
  AOI21X1 U59 ( .A(state[2]), .B(n43), .C(state[1]), .Y(n42) );
  NAND3X1 U60 ( .A(n14), .B(n5), .C(n13), .Y(n43) );
  OAI21X1 U61 ( .A(op[1]), .B(n41), .C(n45), .Y(n44) );
  OAI21X1 U62 ( .A(n6), .B(n37), .C(n36), .Y(n45) );
  NAND2X1 U63 ( .A(n9), .B(n33), .Y(n37) );
  NAND3X1 U64 ( .A(n46), .B(n16), .C(n47), .Y(n33) );
  NOR2X1 U65 ( .A(op[4]), .B(op[2]), .Y(n46) );
  NAND3X1 U66 ( .A(n36), .B(n17), .C(n48), .Y(n41) );
  NOR2X1 U67 ( .A(op[3]), .B(n49), .Y(n48) );
  OR2X1 U68 ( .A(op[4]), .B(op[5]), .Y(n49) );
  NOR2X1 U69 ( .A(reset), .B(state[0]), .Y(n36) );
endmodule


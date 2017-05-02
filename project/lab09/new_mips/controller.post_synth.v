/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP5-2
// Date      : Tue May  2 10:48:56 2017
/////////////////////////////////////////////////////////////


module controller ( clk, reset, op, funct, zero, memwrite, alusrca, memtoreg, 
        iord, pcen, regwrite, regdst, pcsrc, alusrcb, alucontrol, irwrite );
  input [5:0] op;
  input [5:0] funct;
  output [1:0] pcsrc;
  output [1:0] alusrcb;
  output [6:0] alucontrol;
  output [3:0] irwrite;
  input clk, reset, zero;
  output memwrite, alusrca, memtoreg, iord, pcen, regwrite, regdst;
  wire   \U_FSM/N31 , \U_FSM/N24 , \U_FSM/N23 , \U_FSM/N22 , \U_FSM/N21 , n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n21, n22, n23, n24, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96;
  wire   [3:0] \U_FSM/state ;
  assign irwrite[0] = \U_FSM/N31 ;

  DFFPOSX1 \U_FSM/state_reg[3]  ( .D(\U_FSM/N24 ), .CLK(clk), .Q(
        \U_FSM/state [3]) );
  DFFPOSX1 \U_FSM/state_reg[2]  ( .D(\U_FSM/N23 ), .CLK(clk), .Q(
        \U_FSM/state [2]) );
  DFFPOSX1 \U_FSM/state_reg[0]  ( .D(\U_FSM/N21 ), .CLK(clk), .Q(
        \U_FSM/state [0]) );
  DFFPOSX1 \U_FSM/state_reg[1]  ( .D(\U_FSM/N22 ), .CLK(clk), .Q(
        \U_FSM/state [1]) );
  INVX2 U1 ( .A(n77), .Y(n1) );
  INVX2 U2 ( .A(reset), .Y(n2) );
  INVX2 U3 ( .A(n90), .Y(n3) );
  INVX2 U4 ( .A(op[5]), .Y(n4) );
  INVX2 U5 ( .A(op[4]), .Y(n5) );
  INVX2 U6 ( .A(op[3]), .Y(n6) );
  INVX2 U7 ( .A(op[2]), .Y(n7) );
  INVX2 U8 ( .A(op[1]), .Y(n8) );
  INVX2 U9 ( .A(op[0]), .Y(n9) );
  INVX2 U10 ( .A(n61), .Y(n10) );
  INVX2 U11 ( .A(funct[5]), .Y(n11) );
  INVX2 U12 ( .A(n66), .Y(n12) );
  INVX2 U13 ( .A(n69), .Y(n13) );
  INVX2 U14 ( .A(funct[4]), .Y(n14) );
  INVX2 U15 ( .A(n65), .Y(n15) );
  INVX2 U16 ( .A(funct[3]), .Y(n16) );
  INVX2 U17 ( .A(funct[2]), .Y(n17) );
  INVX2 U18 ( .A(funct[1]), .Y(n18) );
  INVX2 U19 ( .A(funct[0]), .Y(n19) );
  INVX2 U20 ( .A(n35), .Y(pcsrc[1]) );
  INVX2 U21 ( .A(n44), .Y(n21) );
  INVX2 U22 ( .A(n42), .Y(n22) );
  INVX2 U23 ( .A(irwrite[3]), .Y(n23) );
  INVX2 U24 ( .A(n37), .Y(n24) );
  INVX2 U25 ( .A(n40), .Y(memwrite) );
  INVX2 U26 ( .A(n33), .Y(regdst) );
  INVX2 U27 ( .A(\U_FSM/state [0]), .Y(n27) );
  INVX2 U28 ( .A(alusrcb[1]), .Y(n28) );
  INVX2 U29 ( .A(\U_FSM/state [1]), .Y(n29) );
  INVX2 U30 ( .A(n71), .Y(n30) );
  INVX2 U31 ( .A(\U_FSM/state [2]), .Y(n31) );
  INVX2 U32 ( .A(\U_FSM/state [3]), .Y(n32) );
  OR2X1 U33 ( .A(regdst), .B(memtoreg), .Y(regwrite) );
  NAND3X1 U34 ( .A(\U_FSM/state [1]), .B(n27), .C(n30), .Y(n33) );
  NAND3X1 U35 ( .A(n34), .B(n35), .C(n36), .Y(pcen) );
  NAND3X1 U36 ( .A(n37), .B(n31), .C(zero), .Y(n36) );
  NOR2X1 U37 ( .A(n34), .B(n38), .Y(irwrite[1]) );
  NAND2X1 U38 ( .A(\U_FSM/state [0]), .B(n29), .Y(n38) );
  NAND3X1 U39 ( .A(\U_FSM/state [3]), .B(\U_FSM/state [2]), .C(n39), .Y(n35)
         );
  NOR2X1 U40 ( .A(\U_FSM/state [1]), .B(\U_FSM/state [0]), .Y(n39) );
  NOR2X1 U41 ( .A(\U_FSM/state [2]), .B(n22), .Y(irwrite[2]) );
  NOR2X1 U42 ( .A(n41), .B(n24), .Y(memtoreg) );
  OAI21X1 U43 ( .A(n31), .B(n22), .C(n40), .Y(iord) );
  NAND3X1 U44 ( .A(n27), .B(n29), .C(n30), .Y(n40) );
  OAI21X1 U45 ( .A(\U_FSM/state [1]), .B(n43), .C(n34), .Y(alusrcb[0]) );
  OAI21X1 U46 ( .A(n27), .B(n28), .C(n44), .Y(alusrca) );
  NAND3X1 U47 ( .A(n45), .B(n46), .C(n47), .Y(alucontrol[6]) );
  NAND3X1 U48 ( .A(funct[2]), .B(funct[0]), .C(n48), .Y(n45) );
  NOR2X1 U49 ( .A(n18), .B(n49), .Y(n48) );
  OAI21X1 U50 ( .A(n50), .B(n51), .C(n21), .Y(alucontrol[5]) );
  AOI22X1 U51 ( .A(n52), .B(n19), .C(funct[2]), .D(n53), .Y(n50) );
  XOR2X1 U52 ( .A(funct[1]), .B(funct[0]), .Y(n53) );
  NOR2X1 U53 ( .A(funct[2]), .B(funct[1]), .Y(n52) );
  OAI21X1 U54 ( .A(n54), .B(n49), .C(n47), .Y(alucontrol[4]) );
  NAND3X1 U55 ( .A(n13), .B(n16), .C(funct[5]), .Y(n49) );
  AOI22X1 U56 ( .A(n55), .B(funct[2]), .C(funct[1]), .D(n19), .Y(n54) );
  NOR2X1 U57 ( .A(funct[1]), .B(n19), .Y(n55) );
  OR2X1 U58 ( .A(n44), .B(n56), .Y(alucontrol[3]) );
  OAI22X1 U59 ( .A(n51), .B(n57), .C(n58), .D(n59), .Y(n56) );
  NAND2X1 U60 ( .A(n15), .B(funct[1]), .Y(n59) );
  NAND3X1 U61 ( .A(n14), .B(n11), .C(n17), .Y(n58) );
  OAI21X1 U62 ( .A(funct[2]), .B(n19), .C(n18), .Y(n57) );
  NAND3X1 U63 ( .A(funct[5]), .B(n14), .C(n15), .Y(n51) );
  NAND3X1 U64 ( .A(n60), .B(n46), .C(n47), .Y(alucontrol[2]) );
  NOR2X1 U65 ( .A(pcsrc[0]), .B(n10), .Y(n47) );
  NOR2X1 U66 ( .A(n44), .B(n29), .Y(pcsrc[0]) );
  NAND3X1 U67 ( .A(n12), .B(n19), .C(funct[5]), .Y(n46) );
  NAND3X1 U68 ( .A(funct[0]), .B(n12), .C(n62), .Y(n60) );
  NOR2X1 U69 ( .A(funct[5]), .B(funct[3]), .Y(n62) );
  OAI21X1 U70 ( .A(\U_FSM/state [1]), .B(n61), .C(n63), .Y(alucontrol[1]) );
  NAND3X1 U71 ( .A(n64), .B(n11), .C(n15), .Y(n63) );
  NAND3X1 U72 ( .A(funct[5]), .B(n12), .C(funct[3]), .Y(n61) );
  NOR2X1 U73 ( .A(n67), .B(n65), .Y(alucontrol[0]) );
  NAND2X1 U74 ( .A(n29), .B(n16), .Y(n65) );
  AOI22X1 U75 ( .A(n68), .B(funct[2]), .C(n64), .D(n11), .Y(n67) );
  OAI21X1 U76 ( .A(n69), .B(n70), .C(n66), .Y(n64) );
  NAND3X1 U77 ( .A(n13), .B(n17), .C(funct[1]), .Y(n66) );
  NAND2X1 U78 ( .A(n19), .B(n17), .Y(n70) );
  NOR2X1 U79 ( .A(n69), .B(n11), .Y(n68) );
  NAND2X1 U80 ( .A(n21), .B(n14), .Y(n69) );
  NAND2X1 U81 ( .A(n30), .B(\U_FSM/state [0]), .Y(n44) );
  NOR2X1 U82 ( .A(n43), .B(n72), .Y(\U_FSM/N31 ) );
  NAND2X1 U83 ( .A(n29), .B(n31), .Y(n72) );
  OAI21X1 U84 ( .A(n1), .B(n73), .C(n74), .Y(\U_FSM/N24 ) );
  NAND3X1 U85 ( .A(n75), .B(n2), .C(\U_FSM/state [0]), .Y(n74) );
  OAI21X1 U86 ( .A(\U_FSM/state [1]), .B(n71), .C(n76), .Y(n75) );
  NAND3X1 U87 ( .A(n3), .B(alusrcb[1]), .C(op[3]), .Y(n76) );
  NAND2X1 U88 ( .A(\U_FSM/state [3]), .B(n31), .Y(n71) );
  OAI21X1 U89 ( .A(n8), .B(n7), .C(alusrcb[1]), .Y(n73) );
  OAI21X1 U90 ( .A(reset), .B(n78), .C(n79), .Y(\U_FSM/N23 ) );
  NAND3X1 U91 ( .A(n77), .B(op[1]), .C(n80), .Y(n79) );
  NOR2X1 U92 ( .A(op[2]), .B(n41), .Y(n80) );
  AOI21X1 U93 ( .A(n81), .B(n3), .C(n82), .Y(n78) );
  OAI21X1 U94 ( .A(n43), .B(n83), .C(n23), .Y(n82) );
  NOR2X1 U95 ( .A(n34), .B(n24), .Y(irwrite[3]) );
  NOR2X1 U96 ( .A(n29), .B(n27), .Y(n37) );
  NAND2X1 U97 ( .A(n31), .B(n32), .Y(n34) );
  NAND2X1 U98 ( .A(\U_FSM/state [2]), .B(n84), .Y(n83) );
  NOR2X1 U99 ( .A(op[3]), .B(n28), .Y(n81) );
  NOR2X1 U100 ( .A(n41), .B(\U_FSM/state [1]), .Y(alusrcb[1]) );
  OAI21X1 U101 ( .A(reset), .B(n85), .C(n86), .Y(\U_FSM/N22 ) );
  NAND3X1 U102 ( .A(n77), .B(op[2]), .C(n87), .Y(n86) );
  NOR2X1 U103 ( .A(op[1]), .B(n41), .Y(n87) );
  NAND2X1 U104 ( .A(\U_FSM/state [2]), .B(n32), .Y(n41) );
  AOI21X1 U105 ( .A(n88), .B(\U_FSM/state [0]), .C(n42), .Y(n85) );
  NOR2X1 U106 ( .A(n43), .B(n29), .Y(n42) );
  AOI21X1 U107 ( .A(\U_FSM/state [2]), .B(n89), .C(\U_FSM/state [1]), .Y(n88)
         );
  NAND3X1 U108 ( .A(n32), .B(n6), .C(n3), .Y(n89) );
  OAI21X1 U109 ( .A(n43), .B(n91), .C(n92), .Y(\U_FSM/N21 ) );
  NAND3X1 U110 ( .A(n32), .B(n8), .C(n77), .Y(n92) );
  NOR2X1 U111 ( .A(n93), .B(n94), .Y(n77) );
  NAND3X1 U112 ( .A(n9), .B(n6), .C(n27), .Y(n94) );
  NAND3X1 U113 ( .A(n4), .B(n2), .C(n5), .Y(n93) );
  OAI21X1 U114 ( .A(n31), .B(n84), .C(n2), .Y(n91) );
  NAND2X1 U115 ( .A(n29), .B(n90), .Y(n84) );
  NAND3X1 U116 ( .A(n95), .B(n8), .C(n96), .Y(n90) );
  NOR2X1 U117 ( .A(op[0]), .B(n4), .Y(n96) );
  NOR2X1 U118 ( .A(op[4]), .B(op[2]), .Y(n95) );
  NAND2X1 U119 ( .A(n27), .B(n32), .Y(n43) );
endmodule


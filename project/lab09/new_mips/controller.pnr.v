//
// Milkyway Hierarchical Verilog Dump:
// Generated on 05/02/2017 at 10:57:06
// Design Generated by Consolidated Verilog Reader
// File produced by Consolidated Verilog Writer
// Library Name :controller_LIB
// Cell Name    :controller
// Hierarchy delimiter:'/'
// Write Command : write_verilog controller.pnr.v
//


module controller (op , pcsrc , funct , alucontrol , alusrcb , reset , 
    clk , irwrite , regdst , regwrite , pcen , iord , memtoreg , 
    alusrca , memwrite , zero );
input  [5:0] op ;
output [1:0] pcsrc ;
input  [5:0] funct ;
output [6:0] alucontrol ;
output [1:0] alusrcb ;
input  reset ;
input  clk ;
output [3:0] irwrite ;
output regdst ;
output regwrite ;
output pcen ;
output iord ;
output memtoreg ;
output alusrca ;
output memwrite ;
input  zero ;


wire [3:0] U_FSM_state ;

DFFPOSX1 U_FSM_state_reg_0_ (.Q ( U_FSM_state[0] ) , .CLK ( clk ) 
    , .D ( U_FSM_N21 ) ) ;
DFFPOSX1 U_FSM_state_reg_2_ (.Q ( U_FSM_state[2] ) , .CLK ( clk ) 
    , .D ( U_FSM_N23 ) ) ;
DFFPOSX1 U_FSM_state_reg_3_ (.Q ( U_FSM_state[3] ) , .CLK ( clk ) 
    , .D ( U_FSM_N24 ) ) ;
FILL xofiller_FILL_1 () ;
FILL xofiller_FILL_2 () ;
FILL xofiller_FILL_3 () ;
FILL xofiller_FILL_4 () ;
FILL xofiller_FILL_5 () ;
INVX2 U7 (.A ( op[2] ) , .Y ( n7 ) ) ;
INVX2 U6 (.A ( op[3] ) , .Y ( n6 ) ) ;
INVX2 U5 (.A ( op[4] ) , .Y ( n5 ) ) ;
INVX2 U4 (.A ( op[5] ) , .Y ( n4 ) ) ;
INVX2 U3 (.A ( n90 ) , .Y ( n3 ) ) ;
INVX2 U2 (.A ( reset ) , .Y ( n2 ) ) ;
INVX2 U1 (.A ( n77 ) , .Y ( n1 ) ) ;
DFFPOSX1 U_FSM_state_reg_1_ (.Q ( U_FSM_state[1] ) , .CLK ( clk ) 
    , .D ( U_FSM_N22 ) ) ;
INVX2 U15 (.A ( n65 ) , .Y ( n15 ) ) ;
INVX2 U14 (.A ( funct[4] ) , .Y ( n14 ) ) ;
INVX2 U13 (.A ( n69 ) , .Y ( n13 ) ) ;
INVX2 U12 (.A ( n66 ) , .Y ( n12 ) ) ;
INVX2 U11 (.A ( funct[5] ) , .Y ( n11 ) ) ;
INVX2 U10 (.A ( n61 ) , .Y ( n10 ) ) ;
INVX2 U9 (.A ( op[0] ) , .Y ( n9 ) ) ;
INVX2 U8 (.A ( op[1] ) , .Y ( n8 ) ) ;
INVX2 U23 (.A ( irwrite[3] ) , .Y ( n23 ) ) ;
INVX2 U22 (.A ( n42 ) , .Y ( n22 ) ) ;
INVX2 U21 (.A ( n44 ) , .Y ( n21 ) ) ;
INVX2 U20 (.A ( n35 ) , .Y ( pcsrc[1] ) ) ;
INVX2 U19 (.A ( funct[0] ) , .Y ( n19 ) ) ;
INVX2 U18 (.A ( funct[1] ) , .Y ( n18 ) ) ;
INVX2 U17 (.A ( funct[2] ) , .Y ( n17 ) ) ;
INVX2 U16 (.A ( funct[3] ) , .Y ( n16 ) ) ;
INVX2 U31 (.A ( U_FSM_state[1] ) , .Y ( n26 ) ) ;
INVX2 U30 (.A ( n71 ) , .Y ( n30 ) ) ;
INVX1 U29 (.A ( U_FSM_state[0] ) , .Y ( n25 ) ) ;
INVX2 U28 (.A ( alusrcb[1] ) , .Y ( n28 ) ) ;
INVX1 U27 (.A ( U_FSM_state[2] ) , .Y ( n20 ) ) ;
INVX2 U26 (.A ( n33 ) , .Y ( regdst ) ) ;
INVX2 U25 (.A ( n40 ) , .Y ( memwrite ) ) ;
INVX2 U24 (.A ( n37 ) , .Y ( n24 ) ) ;
NAND3X1 U39 (.A ( U_FSM_state[3] ) , .B ( U_FSM_state[2] ) , .C ( n39 ) 
    , .Y ( n35 ) ) ;
NAND2X1 U38 (.A ( U_FSM_state[0] ) , .B ( n26 ) , .Y ( n38 ) ) ;
NOR2X1 U37 (.A ( n34 ) , .B ( n38 ) , .Y ( irwrite[1] ) ) ;
NAND3X1 U36 (.A ( n37 ) , .B ( n20 ) , .C ( zero ) , .Y ( n36 ) ) ;
NAND3X1 U35 (.A ( n34 ) , .B ( n35 ) , .C ( n36 ) , .Y ( pcen ) ) ;
NAND3X1 U34 (.A ( U_FSM_state[1] ) , .B ( n25 ) , .C ( n30 ) , .Y ( n33 ) ) ;
OR2X1 U33 (.A ( regdst ) , .B ( memtoreg ) , .Y ( regwrite ) ) ;
INVX2 U32 (.A ( U_FSM_state[3] ) , .Y ( n32 ) ) ;
NAND3X1 U47 (.A ( n45 ) , .B ( n46 ) , .C ( n47 ) , .Y ( alucontrol[6] ) ) ;
OAI21X1 U46 (.A ( n25 ) , .B ( n28 ) , .C ( n44 ) , .Y ( alusrca ) ) ;
OAI21X1 U45 (.A ( U_FSM_state[1] ) , .B ( n43 ) , .C ( n34 ) , .Y ( alusrcb[0] ) ) ;
NAND3X1 U44 (.A ( n25 ) , .B ( n26 ) , .C ( n30 ) , .Y ( n40 ) ) ;
OAI21X1 U43 (.A ( n20 ) , .B ( n22 ) , .C ( n40 ) , .Y ( iord ) ) ;
NOR2X1 U42 (.A ( n41 ) , .B ( n24 ) , .Y ( memtoreg ) ) ;
NOR2X1 U41 (.A ( U_FSM_state[2] ) , .B ( n22 ) , .Y ( irwrite[2] ) ) ;
NOR2X1 U40 (.A ( U_FSM_state[1] ) , .B ( U_FSM_state[0] ) , .Y ( n39 ) ) ;
NAND3X1 U55 (.A ( n13 ) , .B ( n16 ) , .C ( funct[5] ) , .Y ( n49 ) ) ;
OAI21X1 U54 (.A ( n54 ) , .B ( n49 ) , .C ( n47 ) , .Y ( alucontrol[4] ) ) ;
NOR2X1 U53 (.A ( funct[2] ) , .B ( funct[1] ) , .Y ( n52 ) ) ;
XOR2X1 U52 (.A ( funct[1] ) , .B ( funct[0] ) , .Y ( n53 ) ) ;
AOI22X1 U51 (.A ( n52 ) , .B ( n19 ) , .C ( funct[2] ) , .D ( n53 ) , .Y ( n50 ) ) ;
OAI21X1 U50 (.A ( n50 ) , .B ( n51 ) , .C ( n21 ) , .Y ( alucontrol[5] ) ) ;
NOR2X1 U49 (.A ( n18 ) , .B ( n49 ) , .Y ( n48 ) ) ;
NAND3X1 U48 (.A ( funct[2] ) , .B ( funct[0] ) , .C ( n48 ) , .Y ( n45 ) ) ;
NAND3X1 U63 (.A ( funct[5] ) , .B ( n14 ) , .C ( n15 ) , .Y ( n51 ) ) ;
OAI21X1 U62 (.A ( funct[2] ) , .B ( n19 ) , .C ( n18 ) , .Y ( n57 ) ) ;
NAND3X1 U61 (.A ( n14 ) , .B ( n11 ) , .C ( n17 ) , .Y ( n58 ) ) ;
NAND2X1 U60 (.A ( n15 ) , .B ( funct[1] ) , .Y ( n59 ) ) ;
OAI22X1 U59 (.A ( n51 ) , .B ( n57 ) , .C ( n58 ) , .D ( n59 ) , .Y ( n56 ) ) ;
OR2X1 U58 (.A ( n44 ) , .B ( n56 ) , .Y ( alucontrol[3] ) ) ;
NOR2X1 U57 (.A ( funct[1] ) , .B ( n19 ) , .Y ( n55 ) ) ;
AOI22X1 U56 (.A ( n55 ) , .B ( funct[2] ) , .C ( funct[1] ) , .D ( n19 ) 
    , .Y ( n54 ) ) ;
NAND3X1 U71 (.A ( n64 ) , .B ( n11 ) , .C ( n15 ) , .Y ( n63 ) ) ;
OAI21X1 U70 (.A ( U_FSM_state[1] ) , .B ( n61 ) , .C ( n63 ) 
    , .Y ( alucontrol[1] ) ) ;
NOR2X1 U69 (.A ( funct[5] ) , .B ( funct[3] ) , .Y ( n62 ) ) ;
NAND3X1 U68 (.A ( funct[0] ) , .B ( n12 ) , .C ( n62 ) , .Y ( n60 ) ) ;
NAND3X1 U67 (.A ( n12 ) , .B ( n19 ) , .C ( funct[5] ) , .Y ( n46 ) ) ;
NOR2X1 U66 (.A ( n44 ) , .B ( n26 ) , .Y ( pcsrc[0] ) ) ;
NOR2X1 U65 (.A ( pcsrc[0] ) , .B ( n10 ) , .Y ( n47 ) ) ;
NAND3X1 U64 (.A ( n60 ) , .B ( n46 ) , .C ( n47 ) , .Y ( alucontrol[2] ) ) ;
NOR2X1 U79 (.A ( n69 ) , .B ( n11 ) , .Y ( n68 ) ) ;
NAND2X1 U78 (.A ( n19 ) , .B ( n17 ) , .Y ( n70 ) ) ;
NAND3X1 U77 (.A ( n13 ) , .B ( n17 ) , .C ( funct[1] ) , .Y ( n66 ) ) ;
OAI21X1 U76 (.A ( n69 ) , .B ( n70 ) , .C ( n66 ) , .Y ( n64 ) ) ;
AOI22X1 U75 (.A ( n68 ) , .B ( funct[2] ) , .C ( n64 ) , .D ( n11 ) , .Y ( n67 ) ) ;
NAND2X1 U74 (.A ( n26 ) , .B ( n16 ) , .Y ( n65 ) ) ;
NOR2X1 U73 (.A ( n67 ) , .B ( n65 ) , .Y ( alucontrol[0] ) ) ;
NAND3X1 U72 (.A ( funct[5] ) , .B ( n12 ) , .C ( funct[3] ) , .Y ( n61 ) ) ;
NAND3X1 U87 (.A ( n3 ) , .B ( alusrcb[1] ) , .C ( op[3] ) , .Y ( n76 ) ) ;
OAI21X1 U86 (.A ( U_FSM_state[1] ) , .B ( n71 ) , .C ( n76 ) , .Y ( n75 ) ) ;
NAND3X1 U85 (.A ( n75 ) , .B ( n2 ) , .C ( U_FSM_state[0] ) , .Y ( n74 ) ) ;
OAI21X1 U84 (.A ( n1 ) , .B ( n73 ) , .C ( n74 ) , .Y ( U_FSM_N24 ) ) ;
NAND2X1 U83 (.A ( n26 ) , .B ( n20 ) , .Y ( n72 ) ) ;
NOR2X1 U82 (.A ( n43 ) , .B ( n72 ) , .Y ( irwrite[0] ) ) ;
NAND2X1 U81 (.A ( n30 ) , .B ( U_FSM_state[0] ) , .Y ( n44 ) ) ;
NAND2X1 U80 (.A ( n21 ) , .B ( n14 ) , .Y ( n69 ) ) ;
NOR2X1 U95 (.A ( n34 ) , .B ( n24 ) , .Y ( irwrite[3] ) ) ;
OAI21X1 U94 (.A ( n43 ) , .B ( n83 ) , .C ( n23 ) , .Y ( n82 ) ) ;
AOI21X1 U93 (.A ( n81 ) , .B ( n3 ) , .C ( n82 ) , .Y ( n78 ) ) ;
NOR2X1 U92 (.A ( op[2] ) , .B ( n41 ) , .Y ( n80 ) ) ;
NAND3X1 U91 (.A ( n77 ) , .B ( op[1] ) , .C ( n80 ) , .Y ( n79 ) ) ;
OAI21X1 U90 (.A ( reset ) , .B ( n78 ) , .C ( n79 ) , .Y ( U_FSM_N23 ) ) ;
OAI21X1 U89 (.A ( n8 ) , .B ( n7 ) , .C ( alusrcb[1] ) , .Y ( n73 ) ) ;
NAND2X1 U88 (.A ( U_FSM_state[3] ) , .B ( n20 ) , .Y ( n71 ) ) ;
NOR2X1 U103 (.A ( op[1] ) , .B ( n41 ) , .Y ( n87 ) ) ;
NAND3X1 U102 (.A ( n77 ) , .B ( op[2] ) , .C ( n87 ) , .Y ( n86 ) ) ;
OAI21X1 U101 (.A ( reset ) , .B ( n85 ) , .C ( n86 ) , .Y ( U_FSM_N22 ) ) ;
NOR2X1 U100 (.A ( n41 ) , .B ( U_FSM_state[1] ) , .Y ( alusrcb[1] ) ) ;
NOR2X1 U99 (.A ( op[3] ) , .B ( n28 ) , .Y ( n81 ) ) ;
NAND2X1 U98 (.A ( U_FSM_state[2] ) , .B ( n84 ) , .Y ( n83 ) ) ;
NAND2X1 U97 (.A ( n20 ) , .B ( n32 ) , .Y ( n34 ) ) ;
NOR2X1 U96 (.A ( n26 ) , .B ( n25 ) , .Y ( n37 ) ) ;
NOR2X1 U111 (.A ( n93 ) , .B ( n94 ) , .Y ( n77 ) ) ;
NAND3X1 U110 (.A ( n32 ) , .B ( n8 ) , .C ( n77 ) , .Y ( n92 ) ) ;
OAI21X1 U109 (.A ( n43 ) , .B ( n91 ) , .C ( n92 ) , .Y ( U_FSM_N21 ) ) ;
NAND3X1 U108 (.A ( n32 ) , .B ( n6 ) , .C ( n3 ) , .Y ( n89 ) ) ;
AOI21X1 U107 (.A ( U_FSM_state[2] ) , .B ( n89 ) , .C ( U_FSM_state[1] ) 
    , .Y ( n88 ) ) ;
NOR2X1 U106 (.A ( n43 ) , .B ( n26 ) , .Y ( n42 ) ) ;
AOI21X1 U105 (.A ( n88 ) , .B ( U_FSM_state[0] ) , .C ( n42 ) , .Y ( n85 ) ) ;
NAND2X1 U104 (.A ( U_FSM_state[2] ) , .B ( n32 ) , .Y ( n41 ) ) ;
NAND2X1 U119 (.A ( n25 ) , .B ( n32 ) , .Y ( n43 ) ) ;
NOR2X1 U118 (.A ( op[4] ) , .B ( op[2] ) , .Y ( n95 ) ) ;
NOR2X1 U117 (.A ( op[0] ) , .B ( n4 ) , .Y ( n96 ) ) ;
NAND3X1 U116 (.A ( n95 ) , .B ( n8 ) , .C ( n96 ) , .Y ( n90 ) ) ;
NAND2X1 U115 (.A ( n26 ) , .B ( n90 ) , .Y ( n84 ) ) ;
OAI21X1 U114 (.A ( n20 ) , .B ( n84 ) , .C ( n2 ) , .Y ( n91 ) ) ;
NAND3X1 U113 (.A ( n4 ) , .B ( n2 ) , .C ( n5 ) , .Y ( n93 ) ) ;
NAND3X1 U112 (.A ( n9 ) , .B ( n6 ) , .C ( n25 ) , .Y ( n94 ) ) ;
FILL xofiller_FILL_6 () ;
FILL xofiller_FILL_7 () ;
FILL xofiller_FILL_8 () ;
FILL xofiller_FILL_9 () ;
FILL xofiller_FILL_10 () ;
FILL xofiller_FILL_11 () ;
FILL xofiller_FILL_12 () ;
FILL xofiller_FILL_13 () ;
FILL xofiller_FILL_14 () ;
FILL xofiller_FILL_15 () ;
FILL xofiller_FILL_16 () ;
FILL xofiller_FILL_17 () ;
FILL xofiller_FILL_18 () ;
FILL xofiller_FILL_19 () ;
FILL xofiller_FILL_20 () ;
FILL xofiller_FILL_21 () ;
FILL xofiller_FILL_22 () ;
FILL xofiller_FILL_23 () ;
FILL xofiller_FILL_24 () ;
FILL xofiller_FILL_25 () ;
FILL xofiller_FILL_26 () ;
FILL xofiller_FILL_27 () ;
FILL xofiller_FILL_28 () ;
FILL xofiller_FILL_29 () ;
FILL xofiller_FILL_30 () ;
FILL xofiller_FILL_31 () ;
FILL xofiller_FILL_32 () ;
FILL xofiller_FILL_33 () ;
FILL xofiller_FILL_34 () ;
FILL xofiller_FILL_35 () ;
FILL xofiller_FILL_36 () ;
FILL xofiller_FILL_37 () ;
FILL xofiller_FILL_38 () ;
FILL xofiller_FILL_39 () ;
FILL xofiller_FILL_40 () ;
FILL xofiller_FILL_41 () ;
FILL xofiller_FILL_42 () ;
FILL xofiller_FILL_43 () ;
FILL xofiller_FILL_44 () ;
FILL xofiller_FILL_45 () ;
FILL xofiller_FILL_46 () ;
FILL xofiller_FILL_47 () ;
FILL xofiller_FILL_48 () ;
FILL xofiller_FILL_49 () ;
FILL xofiller_FILL_50 () ;
FILL xofiller_FILL_51 () ;
FILL xofiller_FILL_52 () ;
FILL xofiller_FILL_53 () ;
FILL xofiller_FILL_54 () ;
FILL xofiller_FILL_55 () ;
FILL xofiller_FILL_56 () ;
FILL xofiller_FILL_57 () ;
endmodule



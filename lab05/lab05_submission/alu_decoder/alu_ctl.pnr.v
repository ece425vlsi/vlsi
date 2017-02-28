//
// Milkyway Hierarchical Verilog Dump:
// Generated on 02/28/2017 at 14:51:16
// Design Generated by Consolidated Verilog Reader
// File produced by Consolidated Verilog Writer
// Library Name :alu_ctl_LIB
// Cell Name    :alu_ctl
// Hierarchy delimiter:'/'
// Write Command : write_verilog alu_ctl.pnr.v
//


module alu_ctl (funct , alu_op , op );
input  [5:0] funct ;
input  [1:0] alu_op ;
output [6:0] op ;



INVX2 U7 (.A ( n8 ) , .Y ( op[0] ) ) ;
INVX2 U6 (.A ( n20 ) , .Y ( op[1] ) ) ;
INVX2 U5 (.A ( alu_op[1] ) , .Y ( n2 ) ) ;
INVX2 U4 (.A ( op[2] ) , .Y ( n1 ) ) ;
AND2X2 U3 (.A ( funct[1] ) , .B ( funct[3] ) , .Y ( n22 ) ) ;
FILL xofiller_FILL_1 () ;
FILL xofiller_FILL_2 () ;
FILL xofiller_FILL_3 () ;
XOR2X1 U15 (.A ( funct[1] ) , .B ( funct[0] ) , .Y ( n13 ) ) ;
AOI22X1 U14 (.A ( n12 ) , .B ( n7 ) , .C ( funct[2] ) , .D ( n13 ) , .Y ( n10 ) ) ;
OAI22X1 U13 (.A ( alu_op[1] ) , .B ( alu_op[0] ) , .C ( n10 ) , .D ( n5 ) 
    , .Y ( op[5] ) ) ;
NAND2X1 U12 (.A ( funct[1] ) , .B ( funct[0] ) , .Y ( n9 ) ) ;
OAI21X1 U11 (.A ( n8 ) , .B ( n9 ) , .C ( n1 ) , .Y ( op[6] ) ) ;
INVX2 U10 (.A ( funct[0] ) , .Y ( n7 ) ) ;
INVX2 U9 (.A ( funct[1] ) , .Y ( n6 ) ) ;
INVX2 U8 (.A ( n11 ) , .Y ( n5 ) ) ;
NAND3X1 U23 (.A ( n11 ) , .B ( funct[1] ) , .C ( n19 ) , .Y ( n15 ) ) ;
AOI21X1 U22 (.A ( n2 ) , .B ( alu_op[0] ) , .C ( op[1] ) , .Y ( n16 ) ) ;
OAI21X1 U21 (.A ( funct[2] ) , .B ( n15 ) , .C ( n16 ) , .Y ( op[2] ) ) ;
NAND3X1 U20 (.A ( n18 ) , .B ( n6 ) , .C ( n11 ) , .Y ( n17 ) ) ;
OAI21X1 U19 (.A ( alu_op[1] ) , .B ( alu_op[0] ) , .C ( n17 ) , .Y ( op[3] ) ) ;
NAND3X1 U18 (.A ( funct[0] ) , .B ( n6 ) , .C ( op[0] ) , .Y ( n14 ) ) ;
NAND3X1 U17 (.A ( n14 ) , .B ( n15 ) , .C ( n16 ) , .Y ( op[4] ) ) ;
NOR2X1 U16 (.A ( funct[2] ) , .B ( funct[1] ) , .Y ( n12 ) ) ;
NOR2X1 U31 (.A ( funct[4] ) , .B ( alu_op[0] ) , .Y ( n24 ) ) ;
NAND2X1 U30 (.A ( n24 ) , .B ( funct[5] ) , .Y ( n23 ) ) ;
NOR2X1 U29 (.A ( n23 ) , .B ( funct[3] ) , .Y ( n11 ) ) ;
NAND3X1 U28 (.A ( n11 ) , .B ( alu_op[1] ) , .C ( funct[2] ) , .Y ( n8 ) ) ;
OR2X1 U27 (.A ( n7 ) , .B ( funct[2] ) , .Y ( n18 ) ) ;
NOR2X1 U26 (.A ( n18 ) , .B ( n23 ) , .Y ( n21 ) ) ;
NAND3X1 U25 (.A ( n21 ) , .B ( alu_op[1] ) , .C ( n22 ) , .Y ( n20 ) ) ;
NOR2X1 U24 (.A ( funct[0] ) , .B ( n2 ) , .Y ( n19 ) ) ;
FILL xofiller_FILL_4 () ;
FILL xofiller_FILL_5 () ;
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
FILL xofiller_FILL_58 () ;
FILL xofiller_FILL_59 () ;
FILL xofiller_FILL_60 () ;
FILL xofiller_FILL_61 () ;
FILL xofiller_FILL_62 () ;
FILL xofiller_FILL_63 () ;
FILL xofiller_FILL_64 () ;
FILL xofiller_FILL_65 () ;
FILL xofiller_FILL_66 () ;
FILL xofiller_FILL_67 () ;
FILL xofiller_FILL_68 () ;
FILL xofiller_FILL_69 () ;
FILL xofiller_FILL_70 () ;
FILL xofiller_FILL_71 () ;
FILL xofiller_FILL_72 () ;
FILL xofiller_FILL_73 () ;
FILL xofiller_FILL_74 () ;
FILL xofiller_FILL_75 () ;
FILL xofiller_FILL_76 () ;
FILL xofiller_FILL_77 () ;
FILL xofiller_FILL_78 () ;
FILL xofiller_FILL_79 () ;
FILL xofiller_FILL_80 () ;
FILL xofiller_FILL_81 () ;
FILL xofiller_FILL_82 () ;
FILL xofiller_FILL_83 () ;
FILL xofiller_FILL_84 () ;
FILL xofiller_FILL_85 () ;
FILL xofiller_FILL_86 () ;
FILL xofiller_FILL_87 () ;
FILL xofiller_FILL_88 () ;
FILL xofiller_FILL_89 () ;
FILL xofiller_FILL_90 () ;
FILL xofiller_FILL_91 () ;
FILL xofiller_FILL_92 () ;
FILL xofiller_FILL_93 () ;
FILL xofiller_FILL_94 () ;
FILL xofiller_FILL_95 () ;
FILL xofiller_FILL_96 () ;
FILL xofiller_FILL_97 () ;
FILL xofiller_FILL_98 () ;
FILL xofiller_FILL_99 () ;
FILL xofiller_FILL_100 () ;
FILL xofiller_FILL_101 () ;
FILL xofiller_FILL_102 () ;
FILL xofiller_FILL_103 () ;
FILL xofiller_FILL_104 () ;
FILL xofiller_FILL_105 () ;
FILL xofiller_FILL_106 () ;
FILL xofiller_FILL_107 () ;
FILL xofiller_FILL_108 () ;
FILL xofiller_FILL_109 () ;
FILL xofiller_FILL_110 () ;
FILL xofiller_FILL_111 () ;
FILL xofiller_FILL_112 () ;
FILL xofiller_FILL_113 () ;
FILL xofiller_FILL_114 () ;
FILL xofiller_FILL_115 () ;
FILL xofiller_FILL_116 () ;
FILL xofiller_FILL_117 () ;
FILL xofiller_FILL_118 () ;
FILL xofiller_FILL_119 () ;
FILL xofiller_FILL_120 () ;
FILL xofiller_FILL_121 () ;
FILL xofiller_FILL_122 () ;
FILL xofiller_FILL_123 () ;
FILL xofiller_FILL_124 () ;
FILL xofiller_FILL_125 () ;
FILL xofiller_FILL_126 () ;
FILL xofiller_FILL_127 () ;
FILL xofiller_FILL_128 () ;
FILL xofiller_FILL_129 () ;
FILL xofiller_FILL_130 () ;
FILL xofiller_FILL_131 () ;
FILL xofiller_FILL_132 () ;
FILL xofiller_FILL_133 () ;
FILL xofiller_FILL_134 () ;
endmodule



//
// Milkyway Hierarchical Verilog Dump:
// Generated on 04/18/2017 at 11:38:30
// Design Generated by Consolidated Verilog Reader
// File produced by Consolidated Verilog Writer
// Library Name :three_eight_decoder_LIB
// Cell Name    :three_eight_decoder
// Hierarchy delimiter:'/'
// Write Command : write_verilog three_eight_decoder.pnr.v
//


module three_eight_decoder (s , k , right );
output [7:0] s ;
input  [2:0] k ;
input  right ;



INVX2 U6 (.A ( right ) , .Y ( n4 ) ) ;
INVX2 U5 (.A ( k[0] ) , .Y ( n3 ) ) ;
INVX2 U4 (.A ( k[1] ) , .Y ( n2 ) ) ;
INVX2 U3 (.A ( k[2] ) , .Y ( n1 ) ) ;
OAI22X1 U14 (.A ( n9 ) , .B ( n11 ) , .C ( n10 ) , .D ( n12 ) , .Y ( s[2] ) ) ;
OAI22X1 U13 (.A ( n5 ) , .B ( n11 ) , .C ( n7 ) , .D ( n12 ) , .Y ( s[3] ) ) ;
NAND2X1 U12 (.A ( n1 ) , .B ( n4 ) , .Y ( n8 ) ) ;
NAND2X1 U11 (.A ( right ) , .B ( k[2] ) , .Y ( n6 ) ) ;
OAI22X1 U10 (.A ( n8 ) , .B ( n5 ) , .C ( n7 ) , .D ( n6 ) , .Y ( s[4] ) ) ;
OAI22X1 U9 (.A ( n8 ) , .B ( n9 ) , .C ( n6 ) , .D ( n10 ) , .Y ( s[5] ) ) ;
OAI22X1 U8 (.A ( n6 ) , .B ( n9 ) , .C ( n8 ) , .D ( n10 ) , .Y ( s[6] ) ) ;
OAI22X1 U7 (.A ( n5 ) , .B ( n6 ) , .C ( n7 ) , .D ( n8 ) , .Y ( s[7] ) ) ;
NAND2X1 U22 (.A ( k[1] ) , .B ( k[0] ) , .Y ( n5 ) ) ;
NAND2X1 U21 (.A ( k[2] ) , .B ( n4 ) , .Y ( n12 ) ) ;
NAND2X1 U20 (.A ( n3 ) , .B ( n2 ) , .Y ( n7 ) ) ;
NAND2X1 U19 (.A ( right ) , .B ( n1 ) , .Y ( n11 ) ) ;
OAI22X1 U18 (.A ( n5 ) , .B ( n12 ) , .C ( n7 ) , .D ( n11 ) , .Y ( s[0] ) ) ;
NAND2X1 U17 (.A ( k[1] ) , .B ( n3 ) , .Y ( n9 ) ) ;
NAND2X1 U16 (.A ( k[0] ) , .B ( n2 ) , .Y ( n10 ) ) ;
OAI22X1 U15 (.A ( n9 ) , .B ( n12 ) , .C ( n10 ) , .D ( n11 ) , .Y ( s[1] ) ) ;
endmodule



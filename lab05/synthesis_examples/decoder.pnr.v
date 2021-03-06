//
// Milkyway Hierarchical Verilog Dump:
// Generated on 02/28/2017 at 13:17:45
// Design Generated by Consolidated Verilog Reader
// File produced by Consolidated Verilog Writer
// Library Name :decoder_LIB
// Cell Name    :decoder
// Hierarchy delimiter:'/'
// Write Command : write_verilog decoder.pnr.v
//


module decoder (y3 , y2 , y1 , y0 , a );
output y3 ;
output y2 ;
output y1 ;
output y0 ;
input  [1:0] a ;



NOR2X1 U8 (.A ( a[1] ) , .B ( a[0] ) , .Y ( y0 ) ) ;
NOR2X1 U7 (.A ( a[1] ) , .B ( n2 ) , .Y ( y1 ) ) ;
NOR2X1 U6 (.A ( a[0] ) , .B ( n1 ) , .Y ( y2 ) ) ;
NOR2X1 U5 (.A ( n2 ) , .B ( n1 ) , .Y ( y3 ) ) ;
INVX2 U4 (.A ( a[0] ) , .Y ( n2 ) ) ;
INVX2 U3 (.A ( a[1] ) , .Y ( n1 ) ) ;
FILL xofiller_FILL_1 () ;
FILL xofiller_FILL_2 () ;
FILL xofiller_FILL_3 () ;
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
endmodule



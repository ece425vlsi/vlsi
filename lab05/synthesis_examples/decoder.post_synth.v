/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP5-2
// Date      : Tue Feb 28 13:08:12 2017
/////////////////////////////////////////////////////////////


module decoder ( a, y0, y1, y2, y3 );
  input [1:0] a;
  output y0, y1, y2, y3;
  wire   n1, n2;

  INVX2 U3 ( .A(a[1]), .Y(n1) );
  INVX2 U4 ( .A(a[0]), .Y(n2) );
  NOR2X1 U5 ( .A(n2), .B(n1), .Y(y3) );
  NOR2X1 U6 ( .A(a[0]), .B(n1), .Y(y2) );
  NOR2X1 U7 ( .A(a[1]), .B(n2), .Y(y1) );
  NOR2X1 U8 ( .A(a[1]), .B(a[0]), .Y(y0) );
endmodule


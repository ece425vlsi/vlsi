stepsize 50
h Vdd!
l Gnd!
vector av a_7_ a_6_ a_5_ a_4_ a_3_ a_2_ a_1_ a_0_
vector bv b_7_ b_6_ b_5_ b_4_ b_3_ b_2_ b_1_ b_0_
vector ac alucontrol_2_ alucontrol_1_ alucontrol_0_
vector resultv result_7_ result_6_ result_5_ result_4_ result_3_ result_2_ result_1_ result_0_
analyzer ac av bv resultv zero
# AND
setvector ac 000 
setvector av 00000000
setvector bv 00000000
s
setvector av 11110000
setvector bv 00001111
s
setvector av 10101010
s
setvector bv 00001111
s
# OR
setvector ac 001
setvector av 00000000
setvector bv 00000000
s
setvector av 11110000
setvector bv 00001111
s
setvector av 10101010
s
setvector bv 00001111
s
# ADD
setvector ac 010
h cin
s
l cin
s
setvector av 00000001
s
setvector bv 00000001
s
setvector av 11111111
s
h cin
s
l cin
setvector bv 00000001
s
setvector bv 11111111
h cin
s
l cin
s
setvector ac 110 
# SUB
s
setvector av 00000001
s
setvector bv 00000000
s
setvector bv 00000001
s
setvector av 00001111
setvector bv 11110000
s
h cin
s
l cin
s
setvector bv 00000010
s
h cin
s
l cin
s
# SLT
setvector ac 111 
s
setvector av 00000001
setvector bv 00000000
s
setvector bv 00000001
s
setvector av 00000010
s
setvector av 00111100
s
setvector bv 00111000
s
setvector bv 00111100
s
setvector bv 11111111
s



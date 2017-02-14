h Vdd!
l Gnd!

vector OP op6 op5 op4 op3 op1 op0
vector input Less A B

stepsize 250

analyzer A B Less OP Result


#and
setvector OP 000101
setvector input 000
s
setvector input 001
s
setvector input 010
s
setvector input 011
s


#or
setvector OP 011101
setvector input 000
s
setvector input 001
s
setvector input 010
s
setvector input 011
s


for {set i 0} {$i < 8} {incr i} {
    setvector OP $i
    s
}

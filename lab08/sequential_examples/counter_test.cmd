h Vdd!
l Gnd!



############# VECTOR DECLARATIONS #####################

vector Q Q\[3\] Q\[2\] Q\[1\] Q\[0\]
vector D D\[3\] D\[2\] D\[1\] D\[0\] 
vector ld load



stepsize 250

analyzer D Q clk clr ld up

clock clk 0 1


################## PROCESSES ############################








####################### EXECUTED CODE: ########################################

setvector D 0000

h clr
l up
l load

c 2

l clr

c 9

setvector D 0010
h load

c 1

l load

c 9



h up

c 9

setvector D 0010
h load

c 1

l load

c 9






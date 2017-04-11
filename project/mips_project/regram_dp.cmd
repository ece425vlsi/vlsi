h Vdd!
l Gnd!
stepsize 200
l w
vector rd1 read1 read1b
vector rd2 read2 read2b
vector wr write writeb
analyzer rd1 rd2 wr w wt data r1 r2
setvector rd1 01
setvector rd2 01
setvector wr 01
s
setvector wr 10
s
setvector wr 01
s
setvector rd2 10
s
setvector rd2 01
setvector rd1 10
s
setvector rd1 01
s
h w
setvector wr 10
s
setvectir wr 01
s
setvector rd2 10
s
setvector rd2 01
setvector rd1 10
s
setvector rd1 01
setvector rd2 01
s
setvector rd1 10
setvector rd2 10
s
l w
setvector wr 10
s


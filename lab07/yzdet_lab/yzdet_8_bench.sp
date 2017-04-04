* yzdet_8_bench.sp

.include 'onsemi05.sp'      * device models
*.include 'nor2_1x.spice'    * extracted netlist
.include 'inv_sub.sp'       * for buffers/loads
.include 'yzdetect_8.spice'
.option post
.param H=4
.param SUPPLY=5.0



*----------------------------------------------------------------------
* Subcircuits
*----------------------------------------------------------------------
.global vdd vdd2 gnd
.subckt driver1 y

Vin a gnd PULSE 0 'SUPPLY' 5000ps 40ps 40ps 5000ps 10000ps

X1 a b inv * shape input waveform

X2 b y inv M='H' * reshape input waveform

.ends


.subckt driver7 y

Vin a gnd PULSE 0 'SUPPLY' 15000ps 40ps 40ps 5000ps 20000ps

X1 a b inv * shape input waveform

X2 b y inv M='H' * reshape input waveform

.ends

*----------------------------------------------------------------------
* Drive Inputs
*----------------------------------------------------------------------

Vdd2 vdd2 gnd 'SUPPLY'

Vdd vdd gnd 'SUPPLY'



X1 a_0_ driver1
X2 a_1_ driver7
X3 a_2_ driver7
X4 a_3_ driver7
X5 a_4_ driver7
X6 a_5_ driver7
X7 a_6_ driver7
X8 a_7_ driver7

Cload zero gnd 61f




.tran 10ps 25000ps

.measure avg_d_power avg p(vdd) from 15n to 16n

.measure avg_q_power avg p(vdd) from 16n to 20n



.measure tpdr1 * rising prop delay
+TRIG v(a_0_) VAL='SUPPLY/2' RISE=1
+TARG v(zero) VAL='SUPPLY/2' FALL=1

.measure tpdf1 * falling prop delay
+ TRIG v(a_0_) VAL='SUPPLY/2' FALL=1
+ TARG v(zero) VAL='SUPPLY/2' RISE=1

.measure tpd1 param='(tpdr1+tpdf1)/2' * average prop delay


.measure tpdr7 * rising prop delay
+TRIG v(a_1_) VAL='SUPPLY/2' RISE=1
+TARG v(zero) VAL='SUPPLY/2' FALL=2

.measure tpdf7 * falling prop delay
+ TRIG v(a_1_) VAL='SUPPLY/2' FALL=1
+ TARG v(zero) VAL='SUPPLY/2' RISE=2

.measure tpd7 param='(tpdr7+tpdf7)/2' * average prop delay


.measure trise * rise time
+ TRIG v(zero) VAL='0.2*SUPPLY' RISE=1
+ TARG v(zero) VAL='0.8*SUPPLY' RISE=1

.measure tfall * fall time
+ TRIG v(zero) VAL='0.8*SUPPLY' FALL=1
+ TARG v(zero) VAL='0.2*SUPPLY' FALL=1




.end

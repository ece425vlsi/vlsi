* nor2_1x_bench.sp

.include 'onsemi05.sp'      * device models
.include 'nor2_1x.spice'    * extracted netlist
.include 'inv_sub.sp'       * for buffers/loads
.option post
.param H=4
.param SUPPLY=5.0

Vdd vdd gnd 'SUPPLY'

X1 abb ab inv * shape input waveform

X2 ab a inv M='H' * reshape input waveform


X3 bbb bb inv * shape input waveform

X4 bb b inv M='H' * reshape input waveform

X5 y yb inv M='H' * reshape output waveform



Vina abb gnd PULSE 0 'SUPPLY' 6000ps 40ps 40ps 2000ps 4000ps

Vinb bbb gnd PULSE 0 'SUPPLY' 2000ps 40ps 40ps 2000ps 8000ps

*----------------------------------------------------------------------
* Stimulus
*----------------------------------------------------------------------

.tran 10ps 14000ps
.measure tpdrb * rising prop delay
+TRIG v(b) VAL='SUPPLY/2' RISE=1
+TARG v(y) VAL='SUPPLY/2' FALL=1

.measure tpdfb * falling prop delay
+ TRIG v(b) VAL='SUPPLY/2' FALL=1
+ TARG v(y) VAL='SUPPLY/2' RISE=1

.measure tpdb param='(tpdrb+tpdfb)/2' * average prop delay


.measure tpdra * rising prop delay
+TRIG v(a) VAL='SUPPLY/2' RISE=1
+TARG v(y) VAL='SUPPLY/2' FALL=2

.measure tpdfa * falling prop delay
+ TRIG v(a) VAL='SUPPLY/2' FALL=1
+ TARG v(y) VAL='SUPPLY/2' RISE=2

.measure tpda param='(tpdra+tpdfa)/2' * average prop delay


.measure trise * rise time
+ TRIG v(y) VAL='0.2*SUPPLY' RISE=1
+ TARG v(y) VAL='0.8*SUPPLY' RISE=1

.measure tfall * fall time
+ TRIG v(y) VAL='0.8*SUPPLY' FALL=1
+ TARG v(y) VAL='0.2*SUPPLY' FALL=1
.end

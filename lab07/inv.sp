* inv.sp
*----------------------------------------------------------------------
* Parameters and models
*----------------------------------------------------------------------
.param SUPPLY=5.0
*.option scale=0.3u
.include 'onsemi05.sp'
.temp 70
.option post
*----------------------------------------------------------------------
* Simulation netlist
*----------------------------------------------------------------------
Vdd vdd gnd 'SUPPLY'
Vin a gnd PULSE 0 'SUPPLY' 50ps 0ps 0ps 500ps 1000ps
M1 y a gnd gnd NMOS W=4 L=2
+ AS=20 PS=18 AD=20 PD=18
M2 y a vdd vdd PMOS W=8 L=2
+ AS=40 PS=26 AD=40 PD=26
*----------------------------------------------------------------------
* Stimulus
*----------------------------------------------------------------------
.tran 1ps 1000ps
.end

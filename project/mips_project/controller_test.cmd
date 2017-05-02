h Vdd!
l Gnd!



############# VECTOR DECLARATIONS #####################

vector op op\[5\] op\[4\] op\[3\] op\[2\] op\[1\] op\[0\]
vector funct funct\[5\] funct\[4\] funct\[3\] funct\[2\] funct\[1\] funct\[0\]

vector pcsrc pcsrc\[1\] pcsrc\[0\]
vector alucontrol alucontrol\[6\] alucontrol\[5\] alucontrol\[4\] alucontrol\[3\] alucontrol\[2\] alucontrol\[1\] alucontrol\[0\]
vector irwrite irwrite\[3\] irwrite\[2\] irwrite\[1\] irwrite\[0\]

stepsize 250

analyzer clk reset op funct zero memwrite alusrca memtoreg iord pcen regwrite regdst pcsrc alusrcb alucontrol irwrite
w  clk reset op funct zero memwrite alusrca memtoreg iord pcen regwrite regdst pcsrc alusrcb alucontrol irwrite

### NOTE: RIGHT IS CONNECTED TO OP3, ARITH IS CONNECTED TO OP2

#F_sll  : alucontrol = 7'b0000011;
#F_srl  : alucontrol = 7'b0001011;
#F_sra  : alucontrol = 7'b0001111;

################## PROCESSES ############################



proc dec2bin {i {width {}}} {
    #returns the binary representation of $i
    # width determines the length of the returned string (left truncated or added left 0)
    # use of width allows concatenation of bits sub-fields

    set res {}
    if {$i<0} {
        set sign -
        set i [expr {abs($i)}]
    } else {
        set sign {}
    }
    while {$i>0} {
        set res [expr {$i%2}]$res
        set i [expr {$i/2}]
    }
    if {$res eq {}} {set res 0}

    if {$width ne {}} {
        append d [string repeat 0 $width] $res
        set res [string range $d [string length $res] end]
    }
    return $sign$res
}


proc runController {} {

     if {[query clk]} {
     	l clk
     } else {
       h clk
     }

     s

}



####################### EXECUTED CODE: ########################################

h reset
l clk
setvector op 000000
setvector funct 100000
l zero
s

h clk
s

l clk
s

l reset

runController
runController
runController






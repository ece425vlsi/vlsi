h Vdd!
l Gnd!



############# VECTOR DECLARATIONS #####################

vector memdata memdata7 memdata6 memdata5 memdata4 memdata3 memdata2 memdata1 memdata0
vector adr adr7 adr6 adr5 adr4 adr3 adr2 adr1 adr0
vector writedata writedata7 writedata6 writedata5 writedata4 writedata3 writedata2 writedata1 writedata0

stepsize 250


analyzer ph1 ph2 reset memdata memwrite adr writedata
w ph1 ph2 reset memdata memwrite adr writedata

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

proc mem_acc {} {

     set addr [query adr]
     set wordaddr [expr $addr >> 2]
     set hexword mem($wordaddr)
     scan $hexword %x word
     if { [query adr1] && [query adr0] } {
     	set membyte [expr $word >> 24]
	set membyte [expr $membyte & 15]
	set binbyte [dec2bin $membyte 8]
	setvector memdata $binbyte
	#return $membyte
     } elseif { [query adr1] && ~[query adr0] } {
        set membyte [expr $word >> 16]
	set membyte [expr $membyte & 15]
	set binbyte [dec2bin $membyte 8]
	setvector memdata $binbyte
	#return $membyte
     } elseif { [query adr1] && ~[query adr0] } {
        set membyte [expr $word >> 8]
	set membyte [expr $membyte & 15]
	set binbyte [dec2bin $membyte 8]
	setvector memdata $binbyte
	#return $membyte
     } else {
	set membyte [expr $membyte & 15]
	set binbyte [dec2bin $membyte 8]
	setvector memdata $binbyte
	#return $membyte
     }

}

proc run_mips {} {

     # CYCLE THE CLOCKS
     if { [query ph1] } {
     	l ph1
	h ph2
     } else {
       h ph1
       l ph2
     }

     # ACCESS MEMORY
     mem_acc

     s

}

####################### EXECUTED CODE: ########################################

set mem(0) 80020044
set mem(1) 80070040
set mem(2) 80e30045
set mem(3) 00e22025
set mem(4) 00642824
set mem(5) 00a42820
set mem(6) 10a70008
set mem(7) 0064302a
set mem(8) 10c00001
set mem(9) 80050000
set mem(10) 00e2302a
set mem(11) 00c53820
set mem(12) 00e23822
set mem(13) 0800000f
set mem(14) 80070000
set mem(15) a0470047
set mem(16) 00000003
set mem(17) 00000005
set mem(18) 0000000c

h reset

l ph1
h ph2
setvector memdata 00000000

# RUN THE CLOCK A FEW TIMES WITH RESET HIGH

h ph1
l ph2

l ph1
h ph2

h ph1
l ph2

l ph1
h ph2

l reset

# NOW LET'S START RUNNING MIPS:

run_mips

while { ~[query memwrite] } {
      run_mips
}

assert adr [dec2bin 76 8]
assert writedata [dec2bin 7 8]









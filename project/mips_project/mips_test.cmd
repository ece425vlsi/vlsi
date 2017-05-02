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

proc run_mips {} {

     

}

####################### EXECUTED CODE: ########################################


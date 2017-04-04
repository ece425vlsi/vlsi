h Vdd!
l Gnd!



############# VECTOR DECLARATIONS #####################

vector a a_7_ a_6_ a_5_ a_4_ a_3_ a_2_ a_1_ a_0_

stepsize 250

#analyzer A B Less OP Result y_temp
analyzer a zero
w a zero



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


proc cycleInput {} {
for {set i 0} {$i < 256} {incr i} {

    set adec [dec2bin $i 8]
    #puts "adec is: $adec"
    setvector a $adec

    s

    
    }
}



####################### EXECUTED CODE: ########################################


cycleInput




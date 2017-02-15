h Vdd!
l Gnd!


############# VECTOR DECLARATIONS #####################

vector OP op6 op5 op4 op3 op1 op0
vector input Less A B

l op2

stepsize 250

analyzer A B Less OP Result



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

proc s2i01 s {

     if {$s == "0"} {
     return 0
     } elseif {$s == "1"} {
     return 1
     }
     return 0


}

proc cycleInput {} {
for {set i 0} {$i < 4} {incr i} {

    set opCode [dec2bin $i 3]
    puts "opcode is: $opCode"
    setvector input $opCode
    s
}
}

####################### EXECUTED CODE: ########################################

#and
setvector OP 000101
cycleInput

#or
setvector OP 011101
cycleInput

#nor
setvector OP 100001
cycleInput

#xor
setvector OP 011001
cycleInput

#add
setvector OP 010100
cycleInput

#sub
setvector OP 101000
cycleInput

#slt
setvector OP 101010
cycleInput




################################## Garbage/Reference: ############################

#setvector input 000
#s
#setvector input 001
#s
#setvector input 010
#s
#setvector input 011
#s

#set temp [dec2bin $i 3]
#set spot [split $temp {}]
#puts $spot
#set listSize [llength $spot]
#puts "list size is $listSize"
#set secondElem [lindex $spot 1]
#puts "second bit is: $secondElem"
#set tempNum [s2i01 $secondElem]
#puts "the tempNum is: $tempNum"
#puts "current i is $i"
#puts "current temp is $temp"
#set vecList {}
#for {set j 0} {$j < $listSize} {incr j} {
#lappend vecList [s2i01 [lindex $spot $j]]
#}
#lappend vecList 0
#lappend vecList 0
#lappend vecList 0
#puts "veclist is: $vecList"
#setvector OP $vecList
#set numList [join $vecList]
#setvector input $vecList
#puts "numlist is: $numList"
#setvector input $temp


#proc dec2bin i {
#    #returns a string, e.g. dec2bin 10 => 1010 
#    set res {} 
#    while {$i>0} {
#        set res [expr {$i%2}]$res
#        set i [expr {$i/2}]
#    }
#    if {$res == {}} {set res 0}
#    return $res
#}

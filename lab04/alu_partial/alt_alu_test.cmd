h Vdd!
l Gnd!



############# VECTOR DECLARATIONS #####################

vector op op6 op5 op4 op3 op2 op1 op0
vector a a7 a6 a5 a4 a3 a2 a1 a0
vector b b7 b6 b5 b4 b3 b2 b1 b0
vector result result7 result6 result5 result4 result3 result2 result1 result0


stepsize 250

#analyzer A B Less OP Result y_temp
analyzer op a b result zero
w op a b result zero



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



proc cycleInput { operator } {
for {set i 0} {$i < 256} {incr i} {

    set adec [dec2bin $i 8]
    puts "adec is: $adec"
    setvector a $adec

    set j 1
    	      while {$j < 256}  {
	      	  set bdec [dec2bin $j 8]
    		  puts "bdec is: $bdec"
		  setvector b $bdec
		  set j [expr $j << 1]
		  checkAnswer $operator
		  s
	      }
}
}

proc checkAnswer { operator } {
     if { $operator == 6} {
     	set expected $a & $b
	assert result expected
     }
}

####################### EXECUTED CODE: ########################################

#and
set operator 0
setvector op 0001001
cycleInput $operator






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

#proc s2i01 s {
#
#     if {$s == "0"} {
#     return 0
#     } elseif {$s == "1"} {
#     return 1
#     }
#     return 0
#}

h Vdd!
l Gnd!



############# VECTOR DECLARATIONS #####################

vector op op6 op5 op4 op3 op2 op1 op0
vector a a7 a6 a5 a4 a3 a2 a1 a0
vector b b7 b6 b5 b4 b3 b2 b1 b0
vector k k2 k1 k0
vector result result7 result6 result5 result4 result3 result2 result1 result0
#vector expected expected7 expected6 expected5 expected4 expected3 expected2 expected1 expected0

############ DEBUG VECTORS ############################

#vector y y7 y6 y5 y4 y3 y2 y1 y0
#vector sc sc7 sc6 sc5 sc4 sc3 sc2 sc1 sc0

stepsize 250

#analyzer A B Less OP Result y_temp
analyzer op a b k result zero
w op a b k result zero

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


proc cycleInput {} {
     for {set i 0} {$i < 256} {incr i} {

     set adec [dec2bin $i 8]
      #puts "adec is: $adec"
      setvector a $adec

    set j 1
    	      while {$j < 256}  {
	      	  set bdec [dec2bin $j 8]
    		  #puts "bdec is: $bdec"
		  setvector b $bdec
		  set j [expr $j << 1]
		  s
		  checkAnswer
	      }
    }
}

proc cycleInputShift {} {

     for {set i 0} {$i < 256} {incr i} {
     	 set bdec [dec2bin $i 8]
	 setvector b $bdec

	 for {set j 0} {$j < 8} {incr j} {
	     set kdec [dec2bin $j 3]
	     setvector k $kdec
	     s
	     checkAnswer
	 }
     }

}

proc checkAnswer {} {
     set expectedNum 0

     if { [query op] == 9 } {
     	#and
     	set expectedNum [expr [query a] & [query b] ]
     } elseif { [query op] ==  57} {
       #or
       set expectedNum [expr [query a] | [query b] ]
     } elseif { [query op] ==  65} {
       #nor
       set expectedNum [expr [query a] | [query b] ]
       set expectedNum [expr ~$expectedNum]
       set expectedNum [expr 256 + $expectedNum]
     } elseif { [query op] ==  49} {
       #xor
       set expectedNum [expr [query a] ^ [query b] ]
     } elseif { [query op] ==  40} {
       #add
       set expectedNum [expr [query a] + [query b] ]
     } elseif { [query op] ==  84} {
       #sub
       set expectedNum [expr [query a] - [query b] ]
       if { $expectedNum < 0} {
       	  set expectedNum [expr $expectedNum + 256]
       }
     } elseif { [query op] ==  86} {
       #slt
       set expectedNum [expr [query a] < [query b] ]
     } elseif { [query op] ==  3} {
     	set expectedNum [expr [query b] << [query k]]
     } elseif { [query op] == 11 } {
     	set expectedNum [expr [query b] >> [query k]]
     } elseif { [query op] == 15 } {
     	set expectedNum [expr [query b] >> [query k]]
	if { [query b7] } { # MUST SET THE BITS SHIFTED IN LOW
	   set mask 128
	   for {set i 0} {$i < [query k]} {incr i} {
	       set expectedNum [expr $expectedNum | $mask]
	       set mask [expr $mask >> 1]
	   }
	   puts "mask: $mask"
	}
     }

     #set decex $expectedNum
     #set binex [dec2bin $expectedNum 8]
     #set decre [query result]
     #set binre [dec2bin $decre 8]

     puts "a is [query a]; b is [query b]"
     #puts "dec expected: $decex"
     #puts "bin expected: $binex"
     #puts "dec result: $decre"
     #puts "bin result: $binre"

     #if { $expectedNum < 240} {
     	assert result [dec2bin $expectedNum 8]
     #}
     
}

####################### EXECUTED CODE: ########################################

setvector k 000

### ORIGINAL ALT ALU TEST FUNCTIONS ###

#and
setvector op 0001001
cycleInput

#or
setvector op 0111001
cycleInput

#nor
setvector op 1000001
cycleInput

#xor
setvector op 0110001
cycleInput

#add
setvector op 0101000
cycleInput

#sub
setvector op 1010100
cycleInput

#slt
setvector op 1010110
cycleInput

### SHIFT TEST FUNCTIONS ###

#F_sll  : alucontrol = 7'b0000011;
#F_srl  : alucontrol = 7'b0001011;
#F_sra  : alucontrol = 7'b0001111;

#setvector k 010

#sll
setvector op 0000011
cycleInputShift

#srl
setvector op 0001011
cycleInputShift

#sra
setvector op 0001111
cycleInputShift

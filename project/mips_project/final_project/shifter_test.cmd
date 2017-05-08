h Vdd!
l Gnd!



############# VECTOR DECLARATIONS #####################

vector A a7 a6 a5 a4 a3 a2 a1 a0
vector Y y7 y6 y5 y4 y3 y2 y1 y0
vector K k2 k1 k0

vector S s7 s6 s5 s4 s3 s2 s1 s0
vector Z z14 z13 z12 z11 z10 z9 z8 z7 z6 z5 z4 z3 z2 z1 z0
vector temp zout a0in a7in rightin rightbin

stepsize 250

#analyzer A B Less OP Result y_temp
analyzer right arith temp A K Y S Z 
w        right arith temp A K Y S Z 



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
for {set i 0} {$i < 255} {incr i} {

    set adec [dec2bin $i 8]
    #puts "adec is: $adec"
    setvector A $adec
    s
    #checkAnswer

    }
}

proc checkAnswer {} {
     set expectedNum 0

     if { [query right] } {
     	set expectedNum [expr [query A] >> [query K]]
     } elseif { ~[query arith] } {
     	set expectedNum [expr [query A] << [query K]]
     } else {
     	set expectedNum [expr [query A] << [query K]] # NEED TO ACCOUNT FOR LOGICAL SHIFT FEATURES
	if { ~[query a7] } { # MUST SET THE BITS SHIFTED IN LOW
	   #set mask 127 #01111111
	   set mask 128 #10000000
	   for {set i 0} {$i < [query K]} {incr i} {
	       set expectedNum [expr $expectedNum | $mask]
	       set mask [expr $mask << 1]
	   }
	}
     }

     #if { [query op] == 9 } {
     #	#and
     #	set expectedNum [expr [query a] & [query b] ]
     #} elseif { [query op] ==  57} {
     #  #or
     #  set expectedNum [expr [query a] | [query b] ]
     #} elseif { [query op] ==  65} {
     #  #nor
    #   set expectedNum [expr [query a] | [query b] ]
     #  set expectedNum [expr ~$expectedNum]
    #   set expectedNum [expr 256 + $expectedNum]
     #} elseif { [query op] ==  49} {
     #  #xor
    #   set expectedNum [expr [query a] ^ [query b] ]
    # } elseif { [query op] ==  40} {
    #   #add
    #   set expectedNum [expr [query a] + [query b] ]
    # } elseif { [query op] ==  84} {
    #   #sub
    #   set expectedNum [expr [query a] - [query b] ]
    #   if { $expectedNum < 0} {
    #   	  set expectedNum [expr $expectedNum + 256]
    #   }
    # } elseif { [query op] ==  86} {
    #   #slt
    #   set expectedNum [expr [query a] < [query b] ]
    # }

     #set decex $expectedNum
     #set binex [dec2bin $expectedNum 8]
     #set decre [query Y]
     #set binre [dec2bin $decre 8]

     #puts "a is [query a]; b is [query b]"
     #puts "dec expected: $decex"
     #puts "bin expected: $binex"
     #puts "dec result: $decre"
     #puts "bin result: $binre"

     
     assert Y [dec2bin $expectedNum 8]
     
     
}

####################### EXECUTED CODE: ########################################

setvector k 010

l right
l arith

cycleInput

h arith
cycleInput

l arith

h right

cycleInput

h arith

cycleInput



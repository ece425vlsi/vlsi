h Vdd!
l Gnd!



############# VECTOR DECLARATIONS #####################

vector memdata memdata7 memdata6 memdata5 memdata4 memdata3 memdata2 memdata1 memdata0
vector adr adr7 adr6 adr5 adr4 adr3 adr2 adr1 adr0
vector writedata writedata7 writedata6 writedata5 writedata4 writedata3 writedata2 writedata1 writedata0
vector instr instr7 instr6 instr5 instr4 instr3 instr2 instr1 instr0
vector pc pc7 pc6 pc5 pc4 pc3 pc2 pc1 pc0
vector aluout aluout7 aluout6 aluout5 aluout4 aluout3 aluout2 aluout1 aluout0
vector pcnext pcnext7 pcnext6 pcnext5 pcnext4 pcnext3 pcnext2 pcnext1 pcnext0
vector pcsrc pcsrc1 pcsrc0
vector aluresult aluresult7 aluresult6 aluresult5 aluresult4 aluresult3 aluresult2 aluresult1 aluresult0
vector srca srca7 srca6 srca5 srca4 srca3 srca2 srca1 srca0
vector srcb srcb7 srcb6 srcb5 srcb4 srcb3 srcb2 srcb1 srcb0
vector rd2 rd2_7 rd2_6 rd2_5 rd2_4 rd2_3 rd2_2 rd2_1 rd2_0
vector alusrcb alusrcb1 alusrcb0

stepsize 250


analyzer ph1 ph2 reset memdata memwrite adr writedata instr iord pc aluout pcen pcnext pcsrc aluresult srca srcb alusrca rd2 alusrcb regwrite memtoreg
w ph1 ph2 reset memdata memwrite adr writedata instr iord pc aluout pcen pcnext pcsrc aluresult srca srcb alusrca rd2 alusrcb regwrite memtoreg

################## PROCESSES ############################

#set mem(0) 80020044
#set mem(1) 80070040
#set mem(2) 80e30045
#set mem(3) 00e22025
#set mem(4) 00642824
#set mem(5) 00a42820
#set mem(6) 10a70008
#set mem(7) 0064302a
#set mem(8) 10c00001
#set mem(9) 80050000
#set mem(10) 00e2302a
#set mem(11) 00c53820
#set mem(12) 00e23822
#set mem(13) 0800000f
#set mem(14) 80070000
#set mem(15) a0470047
#set mem(16) 00000003
#set mem(17) 00000005
#set mem(18) 0000000c

#array set mem {0 80020044}

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


proc mem_read { loc } {

     if { $loc == 0} {
     	return 0x80020044
     } elseif { $loc == 1 } {
       return 0x80070040
     } elseif { $loc == 2 } {
       return 0x80e30045
     } elseif { $loc == 3 } {
       return 0x00e22025
     } elseif { $loc == 4 } {
       return 0x00642824
     } elseif { $loc == 5 } {
       return 0x00a42820
     } elseif { $loc == 6 } {
       return 0x10a70008
     } elseif { $loc == 7 } {
       return 0x0064302a
     } elseif { $loc == 8 } {
       return 0x10c00001
     } elseif { $loc == 9 } {
       return 0x80050000
     } elseif { $loc == 10 } {
       return 0x00e2302a
     } elseif { $loc == 11 } {
       return 0x00c53820
     } elseif { $loc == 12 } {
       return 0x00e23822
     } elseif { $loc == 13 } {
       return 0x0800000f
     } elseif { $loc == 14 } {
       return 0x80070000
     } elseif { $loc == 15 } {
       return 0xa0470047
     } elseif { $loc == 16 } {
       return 0x00000003
     } elseif { $loc == 17 } {
       return 0x00000005
     } elseif { $loc == 18 } {
       return 0x0000000c
     } else {
       return 0
     }

}

proc mem_acc {} {

     set addr [query adr]
     set wordaddr [expr $addr >> 2]

     puts "addr: $addr"
     puts "wordaddr: $wordaddr"

     #set hexword $mem($wordaddr)
     #scan $hexword %x word
     set hexword [mem_read $wordaddr]
     puts "instr should be: $hexword"
     #set word [expr 0x$hexword]
     set word $hexword
     puts "word on input should be: $word"
     if { [query adr1] && [query adr0] } {
     	set membyte [expr $word >> 24]
	set membyte [expr $membyte & 0xff]
	set binbyte [dec2bin $membyte 8]
	setvector memdata $binbyte
	#return $membyte
     } elseif { [query adr1] && ~[query adr0] } {
        set membyte [expr $word >> 16]
	set membyte [expr $membyte & 0xff]
	set binbyte [dec2bin $membyte 8]
	setvector memdata $binbyte
	#return $membyte
     } elseif { ~[query adr1] && [query adr0] } {
        set membyte [expr $word >> 8]
	set membyte [expr $membyte & 0xff]
	set binbyte [dec2bin $membyte 8]
	setvector memdata $binbyte
	#return $membyte
     } else {
       	set membyte $word
	set membyte [expr $membyte & 0xff]
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

     set addrout [query adr]
     set memout [query memdata]
     puts "adr: $addrout"
     puts "memdata: $memout"

     s

}

####################### EXECUTED CODE: ########################################



h reset

l ph1
h ph2
setvector memdata 00000000
s

# RUN THE CLOCK A FEW TIMES WITH RESET HIGH

h ph1
l ph2
s

l ph1
h ph2
s

h ph1
l ph2
s

l ph1
h ph2
s

l reset

#h ph1
#l ph2

#s

# NOW LET'S START RUNNING MIPS:

run_mips

#while { ~[query memwrite] } {
#run_mips
#}

for {set i 0} {$i < 100} {incr i} {
    run_mips
}

assert adr [dec2bin 76 8]
assert writedata [dec2bin 7 8]









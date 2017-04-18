###################################################################

# Created by write_sdc on Tue Apr 18 11:38:30 2017

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current uA
set_max_delay 25  -to [get_ports {s[7]}]
set_max_delay 25  -to [get_ports {s[6]}]
set_max_delay 25  -to [get_ports {s[5]}]
set_max_delay 25  -to [get_ports {s[4]}]
set_max_delay 25  -to [get_ports {s[3]}]
set_max_delay 25  -to [get_ports {s[2]}]
set_max_delay 25  -to [get_ports {s[1]}]
set_max_delay 25  -to [get_ports {s[0]}]
set_load 0.0035877  [get_nets n5]
set_load 0.00167781  [get_nets n4]
set_load 0.00320877  [get_nets n12]
set_load 0.000832428  [get_nets n3]
set_load 0.00096231  [get_nets n2]
set_load 0.0025371  [get_nets n7]
set_load 0.00113345  [get_nets n1]
set_load 0.00302218  [get_nets n11]
set_load 0.00265791  [get_nets n9]
set_load 0.00291351  [get_nets n10]
set_load 0.00388695  [get_nets n8]
set_load 0.00260711  [get_nets n6]
set_load 0.00341845  [get_nets right]
set_load 0.00115533  [get_nets {s[7]}]
set_load 0.00106077  [get_nets {s[6]}]
set_load 0.00260321  [get_nets {s[5]}]
set_load 0.00225617  [get_nets {s[4]}]
set_load 0.00358424  [get_nets {s[3]}]
set_load 0.00317798  [get_nets {s[2]}]
set_load 0.0039296  [get_nets {s[1]}]
set_load 0.00136267  [get_nets {s[0]}]
set_load 0.00283321  [get_nets {k[2]}]
set_load 0.00224664  [get_nets {k[1]}]
set_load 0.00190048  [get_nets {k[0]}]

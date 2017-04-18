###################################################################

# Created by write_sdc on Tue Apr 18 11:37:08 2017

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

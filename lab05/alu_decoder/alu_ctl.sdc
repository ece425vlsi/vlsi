###################################################################

# Created by write_sdc on Tue Feb 28 14:15:05 2017

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current uA
set_max_delay 25  -to [get_ports {op[6]}]
set_max_delay 25  -to [get_ports {op[5]}]
set_max_delay 25  -to [get_ports {op[4]}]
set_max_delay 25  -to [get_ports {op[3]}]
set_max_delay 25  -to [get_ports {op[2]}]
set_max_delay 25  -to [get_ports {op[1]}]
set_max_delay 25  -to [get_ports {op[0]}]

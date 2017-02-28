###################################################################

# Created by write_sdc on Tue Feb 28 13:08:12 2017

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current uA
set_max_delay 25  -to [get_ports y0]
set_max_delay 25  -to [get_ports y1]
set_max_delay 25  -to [get_ports y2]
set_max_delay 25  -to [get_ports y3]

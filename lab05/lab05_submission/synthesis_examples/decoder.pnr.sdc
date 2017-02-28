###################################################################

# Created by write_sdc on Tue Feb 28 13:17:45 2017

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current uA
set_max_delay 25  -to [get_ports y0]
set_max_delay 25  -to [get_ports y1]
set_max_delay 25  -to [get_ports y2]
set_max_delay 25  -to [get_ports y3]
set_load 0.000516817  [get_nets n2]
set_load 0.00119772  [get_nets n1]
set_load 0.00130174  [get_nets y3]
set_load 0.00095663  [get_nets y2]
set_load 0.00166073  [get_nets y1]
set_load 0.0007565  [get_nets y0]
set_load 0.00204364  [get_nets {a[1]}]
set_load 0.0021758  [get_nets {a[0]}]

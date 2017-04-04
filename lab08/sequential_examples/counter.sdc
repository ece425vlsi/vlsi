###################################################################

# Created by write_sdc on Fri Mar 31 14:44:29 2017

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current uA
create_clock [get_ports clk]  -period 100  -waveform {0 50}
set_propagated_clock [get_clocks clk]
set_max_delay 25  -to [get_ports {Q[3]}]
set_max_delay 25  -to [get_ports {Q[2]}]
set_max_delay 25  -to [get_ports {Q[1]}]
set_max_delay 25  -to [get_ports {Q[0]}]

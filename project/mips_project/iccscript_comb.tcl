############################################################################
# ON C5 0.5u CMOS ASIC Place and Route Script using IC Compiler - Version 3.0
#############################################################################
# This script assumes that the post synthesis netlist and sdc file produced by 
#   synthesis are both in the local directory
#############################################################################
# Update the lib_path and design_name for your design
#############################################################################
set OSUcells "/home/shared/OSU/synopsys/lib/ami05"
#set OSUcells [format "%s%s"  [getenv "OSUcells"] "/lib/ami05"]
#set         lib_path    "/users/eesunz/faculty/cdsemac/UofU_SYNS_v1_2/UTFSM_libraries"
set         lib_path    $OSUcells

## modify design_name to match your design
set         design_name    "three_eight_decoder"  

set_app_var search_path "$lib_path"
set_app_var target_library "osu05_stdcells.db"
set_app_var link_library "* $target_library"

#if { ( file exists "[set design_name]_LIB" ) } { sh rm -rf "[set design_name]_LIB" }
sh rm -rf ${design_name}_LIB

create_mw_lib -tech "/home/shared/OSU/synopsys/flow/ami05/tech.tf" -mw_reference_library "$lib_path/osu05_stdcells"  ${design_name}_LIB

open_mw_lib   "${design_name}_LIB"

#set_tlu_plus_files  \
#    -max_tluplus  "$lib_path/MW_UTAH/ami500.tluplus"   \
#    -min_tluplus  "$lib_path/MW_UTAH/ami500.tluplus"   \
#    -tech2itf_map "$lib_path/MW_UTAH/ami500hxkx_3m.map"

import_design   "./${design_name}.post_synth.v"  -format "verilog" -top ${design_name} -cel ${design_name} 

read_sdc ./${design_name}.sdc

#### Add pin constraints here to set pin placement
#  Note that sides are numbered as follows:
#    side 1: LEFT
#    side 2: TOP
#    side 3: RIGHT
#    side 4: BOTTOM
#  the offset value is in microns starting from the lower coordinate of the referenced side
#
#  As an example, the following will place a pin named "myPin" on the bottom of the cell
#  10 microns from its left edge:
# set_pin_physical_constraints -pin_name {myPin} -layers {metal2} -side 4 -offset 10

# Set op pins
# set_pin_physical_constraints -pin_name {op[6]} -layers {metal2} -side 4 -offset 15.6

# set_pin_physical_constraints -pin_name {op[5]} -layers {metal2} -side 4 -offset 18

# set_pin_physical_constraints -pin_name {op[4]} -layers {metal2} -side 4 -offset 27.6

# set_pin_physical_constraints -pin_name {op[3]} -layers {metal2} -side 4 -offset 32.4

# set_pin_physical_constraints -pin_name {op[2]} -layers {metal2} -side 4 -offset 56.4

# set_pin_physical_constraints -pin_name {op[1]} -layers {metal2} -side 4 -offset 92.4

# set_pin_physical_constraints -pin_name {op[0]} -layers {metal2} -side 4 -offset 80.4

# # Set alu_op pins
# set_pin_physical_constraints -pin_name {alu_op[1]} -layers {metal2} -side 1 -offset 10

# set_pin_physical_constraints -pin_name {alu_op[0]} -layers {metal2} -side 1 -offset 20

# # Set funct pins
# set_pin_physical_constraints -pin_name {funct[5]} -layers {metal2} -side 1 -offset 30

# set_pin_physical_constraints -pin_name {funct[4]} -layers {metal2} -side 1 -offset 40

# set_pin_physical_constraints -pin_name {funct[3]} -layers {metal2} -side 1 -offset 50

# set_pin_physical_constraints -pin_name {funct[2]} -layers {metal2} -side 1 -offset 60

# set_pin_physical_constraints -pin_name {funct[1]} -layers {metal2} -side 1 -offset 70

# set_pin_physical_constraints -pin_name {funct[0]} -layers {metal2} -side 1 -offset 80

set_pin_physical_constraints -pin_name {s[0]} -layers {metal2} -side 1 -offset 0 
set_pin_physical_constraints -pin_name {s[1]} -layers {metal2} -side 1 -offset 10
set_pin_physical_constraints -pin_name {s[2]} -layers {metal2} -side 1 -offset 20 
set_pin_physical_constraints -pin_name {s[3]} -layers {metal2} -side 1 -offset 30 
set_pin_physical_constraints -pin_name {s[4]} -layers {metal2} -side 1 -offset 40 
set_pin_physical_constraints -pin_name {s[5]} -layers {metal2} -side 1 -offset 50 
set_pin_physical_constraints -pin_name {s[6]} -layers {metal2} -side 1 -offset 60 
set_pin_physical_constraints -pin_name {s[7]} -layers {metal2} -side 1 -offset 70

set_pin_physical_constraints -pin_name {right} -layers {metal2} -side 1 -offset 80

set_pin_physical_constraints -pin_name {k[0]} -layers {metal2} -side 1 -offset 90
set_pin_physical_constraints -pin_name {k[1]} -layers {metal2} -side 1 -offset 100
set_pin_physical_constraints -pin_name {k[2]} -layers {metal2} -side 1 -offset 110






###### Adjust density here to alleviate LVS errors after routing at the expense of a larger design
create_floorplan -control_type "aspect_ratio" -core_aspect_ratio "0.5" -core_utilization "0.4" -row_core_ratio "1" -start_first_row  -left_io2core 24 -bottom_io2core 27 -right_io2core 24 -top_io2core 27

derive_pg_connection -power_net {vdd!} -ground_net {gnd!}

create_rectilinear_rings -nets {vdd! gnd!} -offset {3 3} -width {4.5 4.5} -space {3 3}

###### Adjust the number of straps here to alleviate LVS problems after routing  - at the expense of a less robust power network
create_power_straps  -direction vertical -num_placement_strap 1 -start_at 400 -increment_x_or_y 200 -nets  {vdd! gnd!}  -width 1.800 -layer metal3

place_opt -effort high -congestion

preroute_standard_cells -nets {vdd! gnd!} -connect horizontal -extend_to_boundaries_and_generate_pins 

#clock_opt -fix_hold_all_clocks

#report_clock_tree

report_timing

route_zrt_auto -max_detail_route_iterations 1000
route_zrt_detail -incremental true

insert_stdcell_filler -cell_without_metal "FILL8 FILL4 FILL2 FILL"  -connect_to_power "vdd!" -connect_to_ground "gnd!"

preroute_standard_cells -nets {vdd! gnd!} -connect horizontal -extend_to_boundaries_and_generate_pins 

derive_pg_connection -power_net {vdd!} -ground_net {gnd!}

# This command shows a warning that the command is old and no longer valid.
# Not really true.  For designs in deep submicron (65nm and below) you should use the new checker.
# However for designs older than 65nm, this is the appropriate checker.   

verify_drc

verify_lvs

route_zrt_detail -incremental true

report_timing > ${design_name}.timing

change_names -rules verilog -hierarchy

write_verilog ${design_name}.pnr.v

sh grep -v FILL ${design_name}.pnr.v > ${design_name}.nofill.v 


set_write_stream_options -output_pin {text geometry} -keep_data_type -child_depth 20 -map_layer "/home/shared/OSU/synopsys/flow/ami05/streamout.map"
write_stream -lib_name ${design_name}_LIB -format gds ${design_name}.gds

write_sdc     ${design_name}.pnr.sdc

extract_rc -coupling_cap

write_parasitics -format SBPF -output "${design_name}.pnr.sbpf"

verify_pg_nets

report_timing 

#report_clock_tree

save_mw_cel

##close_mw_cel

##exit

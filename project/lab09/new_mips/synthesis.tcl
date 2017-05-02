#############################
# Script to synthesize combinational logic
# (customized from general script)
#############################

#############################
#  Change the following to your top-level design name
#############################

set         design_name    "controller"  

## hacked to work with OSU ami05 library - JN 3/27/14

set OSUcells "/home/shared/OSU/synopsys/lib/ami05"

set search_path [concat  $search_path $OSUcells]

set target_library [list osu05_stdcells.db]

set synthetic_library [list dw_foundation.sldb standard.sldb]

set link_library [concat $target_library $synthetic_library]

### following line stolen from OSU flow:
set alib_library_analysis_path $OSUcells

define_design_lib work -path ./work


#############################
# Change this to your top-level file
# (include any other files containing submodules FIRST)
#############################
analyze -format sverilog ./mips_fsm.sv
analyze -format sverilog ./aludec.sv

analyze -format sverilog ./${design_name}.sv

#############################
#  This assumes your top level module name is the file name without the extension
#############################
elaborate ${design_name}

#############################
#  Change this to match your clocks and timing constriaints
#############################
set_max_delay 25 -to [all_outputs]
create_clock "clk" -period 100
#create_clock "clk_in2" -period 100
#create_clock "clk_in3" -period 100

#############################
# if you have an internally generated clock instantiate a buffer (BUFX2)
# to provide a pin to identify the source of your new clock
#############################
#create_generated_clock -divide_by 1024 -source clk_in1 [get_pins {buffer/Y}]

report_clocks

check_design > check_design.output

ungroup -flatten -all

set_flatten true -effort high
uniquify

compile

#############################
# Check these files once completed 
#############################
report_area  > area.rpt
report_hierarchy > hierarchy.rpt
report_constraints > constraints.rpt
report_timing > timing.rpt

set_propagated_clock [all_clocks]

#############################
# Your timing file for IC Compiler 
#############################
write_sdc  ${design_name}.sdc

#############################
# Your output netlist 
#############################
write -f verilog ${design_name} -output ${design_name}.post_synth.v -hierarchy

# exit

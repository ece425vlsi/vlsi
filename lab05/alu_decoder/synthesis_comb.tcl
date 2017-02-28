#############################
# Script to synthesize combinational logic
# (customized from general script)
#############################

#############################
#  Change the following to your top-level design name
#############################

set         design_name    "alu_ctl"  

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
# Read the verilog file.  If you use submodules,
# add commands to read thim first.
#############################
analyze -format sverilog ./${design_name}.sv

#############################
#  Translate the design into generic hardware
#############################
elaborate ${design_name}

#############################
# Set up clock and timing constratins
# Note that since there are no clocks in comb. logic
# clock constraints are commented out
#############################
set_max_delay 25 -to [all_outputs]
#create_clock "clk" -period 200
#create_clock "clk_in2" -period 100
#create_clock "clk_in3" -period 100

#############################
# if you have an internally generated clock instantiate a buffer (BUFX2)
# to provide a pin to identify the source of your new clock
#############################
#create_generated_clock -divide_by 1024 -source clk_in1 [get_pins {buffer/Y}]

#report_clocks

check_design > check_design.output

############################
# Make unique copies of submodules;
# Optimize & map to hardware
###########################
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

#set_propagated_clock [all_clocks]

#############################
# Your timing file for IC Compiler 
#############################
write_sdc  ${design_name}.sdc

#############################
# Your output netlist 
#############################
write -f verilog ${design_name} -output ${design_name}.post_synth.v -hierarchy

# remove the comment if you want to leave dc_shell upon completion
# exit

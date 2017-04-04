#!/bin/bash -f
xv_path="/opt/Xilinx/Vivado/2016.2"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xsim mips_fsm_bench_behav -key {Behavioral:sim_1:Functional:mips_fsm_bench} -tclbatch mips_fsm_bench.tcl -log simulate.log

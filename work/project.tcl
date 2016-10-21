set projDir "D:/aWork/SUTDTerm4/Computational Structure/MojoWorkspace/ALU/work/planAhead"
set projName "ALU"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "D:/aWork/SUTDTerm4/Computational Structure/MojoWorkspace/ALU/work/verilog/mojo_top_0.v" "D:/aWork/SUTDTerm4/Computational Structure/MojoWorkspace/ALU/work/verilog/alu_1.v" "D:/aWork/SUTDTerm4/Computational Structure/MojoWorkspace/ALU/work/verilog/reset_conditioner_2.v" "D:/aWork/SUTDTerm4/Computational Structure/MojoWorkspace/ALU/work/verilog/test_case_3.v" "D:/aWork/SUTDTerm4/Computational Structure/MojoWorkspace/ALU/work/verilog/Boolean_4.v" "D:/aWork/SUTDTerm4/Computational Structure/MojoWorkspace/ALU/work/verilog/adder_5.v" "D:/aWork/SUTDTerm4/Computational Structure/MojoWorkspace/ALU/work/verilog/comparator_6.v" "D:/aWork/SUTDTerm4/Computational Structure/MojoWorkspace/ALU/work/verilog/Shift_7.v" "D:/aWork/SUTDTerm4/Computational Structure/MojoWorkspace/ALU/work/verilog/multiple_divide_8.v" "D:/aWork/SUTDTerm4/Computational Structure/MojoWorkspace/ALU/work/verilog/mod_9.v" "D:/aWork/SUTDTerm4/Computational Structure/MojoWorkspace/ALU/work/verilog/blinker_10.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list  "D:/Install/Mojo\ IDE/library/components/io_shield.ucf" "D:/Install/Mojo\ IDE/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1

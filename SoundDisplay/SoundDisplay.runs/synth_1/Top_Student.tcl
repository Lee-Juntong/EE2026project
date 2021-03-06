# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param xicom.use_bs_reader 1
set_msg_config -id {Common 17-41} -limit 10000000
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.cache/wt [current_project]
set_property parent.project_path D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo d:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_mem {
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/XC.mem
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/S_UP.mem
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/S_DOWN.mem
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/S_LEFT.mem
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/S_RIGHT.mem
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/D_DOWN.mem
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/D_UP.mem
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/D_LEFT.mem
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/D_RIGHT.mem
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/E_LEFT.mem
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/E_RIGHT.mem
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/E_UP.mem
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/E_DOWN.mem
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/C_UP.mem
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/C_RIGHT.mem
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/C_DOWN.mem
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/C_LEFT.mem
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/B_UP.mem
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/A_UP.mem
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/B_LEFT.mem
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/B_RIGHT.mem
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/A_DOWN.mem
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/B_DOWN.mem
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/A_RIGHT.mem
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/A_LEFT.mem
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/picE.mem
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/picD.mem
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/picU.mem
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/picC.mem
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/picA.mem
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/picB.mem
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/picS.mem
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/spongeBOB3.mem
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/spongeBOB1.mem
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/spongeBOB4.mem
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/spongeBOB2.mem
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/shoutPlz.mem
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/shoutDone.mem
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/quietDone.mem
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/NotDone.mem
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/Done.mem
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/quietPlz.mem
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/Chua.mem
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/Wong.mem
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/NUS.mem
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/qn.mem
}
read_verilog -library xil_defaultlib {
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/Audio_Capture.v
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/Button.v
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/Circle.v
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/DFF.v
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/Dr_W_And_C.v
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/EyeSight_test.v
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/Led_Bar.v
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/Max_Intensity.v
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/My_Volume_Bar.v
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/NTU.v
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/Oled_Display.v
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/Random_Num_Gen.v
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/Segment_Display.v
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/clk20k.v
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/clk6p25m.v
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/name_seg.v
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/pwd_to_seg.v
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/spongeBOB.v
  D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/sources_1/new/Top_Student.v
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/constrs_1/new/Basys3_Master.xdc
set_property used_in_implementation false [get_files D:/NUS/EE2026/EE2026_project/SoundDisplay/SoundDisplay.srcs/constrs_1/new/Basys3_Master.xdc]

set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top Top_Student -part xc7a35tcpg236-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef Top_Student.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file Top_Student_utilization_synth.rpt -pb Top_Student_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]

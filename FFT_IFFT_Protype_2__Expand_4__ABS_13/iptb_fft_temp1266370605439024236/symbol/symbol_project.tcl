package require ::quartus::project
set project_name tempproject
if [catch {project_open $project_name}] {
        project_new $project_name
}
export_assignments
set_global_assignment -name "VERILOG_FILE" "C:/Users/TingQiang/Desktop/FFT_IFFT_Protype_2__Expand_4__ABS/iptb_fft_temp1266370605439024236/fft_slim.v";
set_global_assignment -name "VHDL_FILE" "C:/altera/13.0/ip/altera/fft/lib/fft_pack_fft_130.vhd";
set_global_assignment -name "VHDL_FILE" "C:/altera/13.0/ip/altera/fft/lib/auk_dspip_math_pkg_fft_130.vhd";
set_global_assignment -name "VHDL_FILE" "C:/altera/13.0/ip/altera/fft/lib/auk_dspip_lib_pkg_fft_130.vhd";
set_global_assignment -name "VHDL_FILE" "C:/altera/13.0/ip/altera/fft/lib/auk_dspip_text_pkg_fft_130.vhd";
set_global_assignment -name "VHDL_FILE" "C:/altera/13.0/ip/altera/fft/lib/auk_dspip_roundsat_fft_130.vhd";
set_global_assignment -name "VHDL_FILE" "C:/altera/13.0/ip/altera/fft/lib/auk_dspip_avalon_streaming_source_fft_130.vhd";
set_global_assignment -name "VHDL_FILE" "C:/altera/13.0/ip/altera/fft/lib/auk_dspip_avalon_streaming_sink_fft_130.vhd";
set_global_assignment -name "VHDL_FILE" "C:/altera/13.0/ip/altera/fft/lib/auk_dspip_avalon_streaming_controller_fft_130.vhd";
set_global_assignment -name "VHDL_FILE" "C:/altera/13.0/ip/altera/fft/lib/auk_dspip_fpcompiler_alufp_fft_130.vhd";
set_global_assignment -name "VHDL_FILE" "C:/altera/13.0/ip/altera/fft/lib/auk_dspip_fpcompiler_aslf_fft_130.vhd";
set_global_assignment -name "VHDL_FILE" "C:/altera/13.0/ip/altera/fft/lib/auk_dspip_fpcompiler_castftox_fft_130.vhd";
set_global_assignment -name "VHDL_FILE" "C:/altera/13.0/ip/altera/fft/lib/auk_dspip_fpcompiler_castxtof_fft_130.vhd";
set_global_assignment -name "VHDL_FILE" "C:/altera/13.0/ip/altera/fft/lib/auk_dspip_fpcompiler_clzf_fft_130.vhd";
set_global_assignment -name "VHDL_FILE" "C:/altera/13.0/ip/altera/fft/lib/auk_dspip_fpcompiler_mulfp_fft_130.vhd";
set_global_assignment -name USER_LIBRARIES "C:/altera/13.0/ip/altera/fft/lib"
set_global_assignment -name "DEVICE" "AUTO";
project_close

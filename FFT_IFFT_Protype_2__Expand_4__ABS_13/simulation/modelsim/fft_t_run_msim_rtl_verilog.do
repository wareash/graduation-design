transcript on
if ![file isdirectory verilog_libs] {
	file mkdir verilog_libs
}

vlib verilog_libs/altera_ver
vmap altera_ver ./verilog_libs/altera_ver
vlog -vlog01compat -work altera_ver {c:/altera/11.1/quartus/eda/sim_lib/altera_primitives.v}

vlib verilog_libs/lpm_ver
vmap lpm_ver ./verilog_libs/lpm_ver
vlog -vlog01compat -work lpm_ver {c:/altera/11.1/quartus/eda/sim_lib/220model.v}

vlib verilog_libs/sgate_ver
vmap sgate_ver ./verilog_libs/sgate_ver
vlog -vlog01compat -work sgate_ver {c:/altera/11.1/quartus/eda/sim_lib/sgate.v}

vlib verilog_libs/altera_mf_ver
vmap altera_mf_ver ./verilog_libs/altera_mf_ver
vlog -vlog01compat -work altera_mf_ver {c:/altera/11.1/quartus/eda/sim_lib/altera_mf.v}

vlib verilog_libs/altera_lnsim_ver
vmap altera_lnsim_ver ./verilog_libs/altera_lnsim_ver
vlog -sv -work altera_lnsim_ver {c:/altera/11.1/quartus/eda/sim_lib/altera_lnsim.sv}

vlib verilog_libs/cycloneii_ver
vmap cycloneii_ver ./verilog_libs/cycloneii_ver
vlog -vlog01compat -work cycloneii_ver {c:/altera/11.1/quartus/eda/sim_lib/cycloneii_atoms.v}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/CTQ/Desktop/FFT_IFFT_Protype_2__Expand_4__ABS {C:/Users/CTQ/Desktop/FFT_IFFT_Protype_2__Expand_4__ABS/fft_core.vo}
vlog -vlog01compat -work work +incdir+C:/Users/CTQ/Desktop/FFT_IFFT_Protype_2__Expand_4__ABS {C:/Users/CTQ/Desktop/FFT_IFFT_Protype_2__Expand_4__ABS/IFFT.vo}
vlog -vlog01compat -work work +incdir+C:/Users/CTQ/Desktop/FFT_IFFT_Protype_2__Expand_4__ABS {C:/Users/CTQ/Desktop/FFT_IFFT_Protype_2__Expand_4__ABS/ifft.v}
vlog -vlog01compat -work work +incdir+C:/Users/CTQ/Desktop/FFT_IFFT_Protype_2__Expand_4__ABS {C:/Users/CTQ/Desktop/FFT_IFFT_Protype_2__Expand_4__ABS/PLL.v}
vlog -vlog01compat -work work +incdir+C:/Users/CTQ/Desktop/FFT_IFFT_Protype_2__Expand_4__ABS {C:/Users/CTQ/Desktop/FFT_IFFT_Protype_2__Expand_4__ABS/fft_contrl.v}
vlog -vlog01compat -work work +incdir+C:/Users/CTQ/Desktop/FFT_IFFT_Protype_2__Expand_4__ABS {C:/Users/CTQ/Desktop/FFT_IFFT_Protype_2__Expand_4__ABS/fft_fifo_design.v}
vlog -vlog01compat -work work +incdir+C:/Users/CTQ/Desktop/FFT_IFFT_Protype_2__Expand_4__ABS {C:/Users/CTQ/Desktop/FFT_IFFT_Protype_2__Expand_4__ABS/code_change.v}
vlog -vlog01compat -work work +incdir+C:/Users/CTQ/Desktop/FFT_IFFT_Protype_2__Expand_4__ABS {C:/Users/CTQ/Desktop/FFT_IFFT_Protype_2__Expand_4__ABS/ifft_control.v}
vlog -vlog01compat -work work +incdir+C:/Users/CTQ/Desktop/FFT_IFFT_Protype_2__Expand_4__ABS {C:/Users/CTQ/Desktop/FFT_IFFT_Protype_2__Expand_4__ABS/ifft_fifo_design.v}


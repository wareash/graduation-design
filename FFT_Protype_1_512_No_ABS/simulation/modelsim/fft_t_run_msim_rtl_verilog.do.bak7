transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/TingQiang/Desktop/FFT__Protype/FFT_Protype_1_512_No_ABS {C:/Users/TingQiang/Desktop/FFT__Protype/FFT_Protype_1_512_No_ABS/fft_core.vo}
vlog -vlog01compat -work work +incdir+C:/Users/TingQiang/Desktop/FFT__Protype/FFT_Protype_1_512_No_ABS {C:/Users/TingQiang/Desktop/FFT__Protype/FFT_Protype_1_512_No_ABS/fft_contrl.v}
vlog -vlog01compat -work work +incdir+C:/Users/TingQiang/Desktop/FFT__Protype/FFT_Protype_1_512_No_ABS {C:/Users/TingQiang/Desktop/FFT__Protype/FFT_Protype_1_512_No_ABS/fft_fifo_design.v}
vlog -vlog01compat -work work +incdir+C:/Users/TingQiang/Desktop/FFT__Protype/FFT_Protype_1_512_No_ABS {C:/Users/TingQiang/Desktop/FFT__Protype/FFT_Protype_1_512_No_ABS/test_point.v}

vlog -vlog01compat -work work +incdir+C:/Users/TingQiang/Desktop/FFT__Protype/FFT_Protype_1_512_No_ABS {C:/Users/TingQiang/Desktop/FFT__Protype/FFT_Protype_1_512_No_ABS/fft_core_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneii_ver -L rtl_work -L work -voptargs="+acc"  work.fft_core_tb

add wave *
view structure
view signals
run -all

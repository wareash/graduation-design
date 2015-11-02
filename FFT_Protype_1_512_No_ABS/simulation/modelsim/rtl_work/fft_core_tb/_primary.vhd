library verilog;
use verilog.vl_types.all;
entity fft_core_tb is
    generic(
        NUM_FRAMES_c    : integer := 4;
        MAXVAL_c        : integer := 128;
        OFFSET_c        : integer := 256;
        MAXVAL_EXP_c    : integer := 32;
        OFFSET_EXP_c    : integer := 64
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of NUM_FRAMES_c : constant is 1;
    attribute mti_svvh_generic_type of MAXVAL_c : constant is 1;
    attribute mti_svvh_generic_type of OFFSET_c : constant is 1;
    attribute mti_svvh_generic_type of MAXVAL_EXP_c : constant is 1;
    attribute mti_svvh_generic_type of OFFSET_EXP_c : constant is 1;
end fft_core_tb;

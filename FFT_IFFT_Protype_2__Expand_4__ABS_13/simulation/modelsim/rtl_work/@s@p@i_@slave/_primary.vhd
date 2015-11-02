library verilog;
use verilog.vl_types.all;
entity SPI_Slave is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        SCK             : in     vl_logic;
        MOSI            : in     vl_logic;
        MISO            : out    vl_logic;
        NSS             : in     vl_logic;
        INT             : out    vl_logic;
        Data_Ready      : out    vl_logic;
        Data_Received   : out    vl_logic_vector(7 downto 0)
    );
end SPI_Slave;

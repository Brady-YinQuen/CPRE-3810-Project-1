library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity tb_dmem is
    generic(gCLK_HPER   : time := 10 ns;
	    DATA_WIDTH : natural := 32;
      	    ADDR_WIDTH : natural := 10
	);
end tb_dmem;


architecture behavior of tb_dmem is 
constant cCLK_PER  : time := gCLK_HPER * 2;
component mem 

port(
    clk		: in std_logic;
    addr	: in std_logic_vector((ADDR_WIDTH-1) downto 0);
    data	: in std_logic_vector((DATA_WIDTH-1) downto 0);
    we		: in std_logic := '1';
    q		: out std_logic_vector((DATA_WIDTH -1) downto 0)
);
end component;

signal s_clk  :  std_logic;
signal s_addr :  std_logic_vector((ADDR_WIDTH-1) downto 0);
signal s_data :  std_logic_vector((DATA_WIDTH-1) downto 0);
signal s_we   : std_logic;
signal s_q    :  std_logic_vector((DATA_WIDTH -1) downto 0);

begin
    dmem : mem
        port map (
            clk  => s_clk,
            addr => s_addr,
            data => s_data,
            we   => s_we,
            q    => s_q
        );


    stimulus_process: process
    begin
        s_clk <= '0';
        wait for gCLK_HPER;
        s_clk <= '1';
        wait for gCLK_HPER;
    end process;



    simulation: process
    begin 
    wait for cCLK_PER;
    for i in 0 to 9 loop
        s_addr <= std_logic_vector(to_unsigned(i, ADDR_WIDTH));
        s_we <= '0'; 
        wait for cCLK_PER;
    end loop;

    for i in 0 to 9 loop
	s_addr <= std_logic_vector(to_unsigned(i, ADDR_WIDTH));
        s_we <= '0'; 
        wait for cCLK_PER;
	s_addr <= std_logic_vector(to_unsigned(i +256, ADDR_WIDTH));
	s_data <= s_q; -- Data to write is the value just read
	s_we <= '1'; -- Write mode
        wait for cCLK_PER;
    end loop;

    for i in 0 to 9 loop
        s_addr <= std_logic_vector(to_unsigned(256 + i, ADDR_WIDTH));
        s_we <= '0'; -- Read mode
        wait for cCLK_PER;
    end loop;


    wait;


    end process;

end behavior;
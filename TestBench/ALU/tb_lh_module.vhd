library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_lh_module is
end tb_lh_module;

architecture behavior of tb_lh_module is

    -- Component Declaration for the Unit Under Test (UUT)
    component lh_module
        port(
            i_data : in  std_logic_vector(31 downto 0); 
            i_sel  : in  std_logic_vector(1 downto 0);   
            i_sign : in  std_logic;   
            o_data : out std_logic_vector(31 downto 0)   
        );
    end component;

    -- Signals to connect to UUT
    signal i_data_tb : std_logic_vector(31 downto 0);
    signal i_sel_tb  : std_logic_vector(1 downto 0);
    signal i_sign_tb : std_logic;
    signal o_data_tb : std_logic_vector(31 downto 0);

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: lh_module
        port map(
            i_data => i_data_tb,
            i_sel  => i_sel_tb,
            i_sign => i_sign_tb,
            o_data => o_data_tb
        );

    -- Testbench stimulus process
    stim_proc: process
    begin        
        -- Test Case 1: i_sel = "00", i_sign = '0', i_data = x"0000_1234"
        i_data_tb <= x"00001234";
        i_sel_tb  <= "00";
        i_sign_tb <= '0';
        wait for 10 ns;
        -- Expected: o_data = x"0000_1234"

        -- Test Case 2: i_sel = "00", i_sign = '1', i_data = x"FFFF_1234"
        i_data_tb <= x"FFFF1234";
        i_sel_tb  <= "00";
        i_sign_tb <= '1';
        wait for 10 ns;
        -- Expected: o_data = x"FFFFFFFF_1234" (sign extension of 16-bits)

        -- Test Case 3: i_sel = "01", i_sign = '0', i_data = x"0000_1234"
        i_data_tb <= x"00001234";
        i_sel_tb  <= "01";
        i_sign_tb <= '0';
        wait for 10 ns;
        -- Expected: o_data = x"0000_1234" (Upper 16-bits of i_data)

        -- Test Case 4: i_sel = "01", i_sign = '1', i_data = x"FFFF_1234"
        i_data_tb <= x"FFFF1234";
        i_sel_tb  <= "01";
        i_sign_tb <= '1';
        wait for 10 ns;
        -- Expected: o_data = x"FFFFFFFF_1234" (sign extension of upper 16-bits)

        -- Test Case 5: i_sel = "10", i_sign = '0', i_data = x"0000_1234"
        i_data_tb <= x"00001234";
        i_sel_tb  <= "10";
        i_sign_tb <= '0';
        wait for 10 ns;
        -- Expected: o_data = x"0000_1234" (Upper 16-bits of i_data)

        -- Test Case 6: i_sel = "10", i_sign = '1', i_data = x"FFFF_1234"
        i_data_tb <= x"FFFF1234";
        i_sel_tb  <= "10";
        i_sign_tb <= '1';
        wait for 10 ns;
        -- Expected: o_data = x"FFFFFFFF_1234" (sign extension of upper 16-bits)

        -- End of simulation
        wait;
    end process;

end behavior;

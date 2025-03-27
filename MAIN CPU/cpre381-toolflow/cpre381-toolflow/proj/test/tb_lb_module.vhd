library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_lb_module is
end tb_lb_module;

architecture behavior of tb_lb_module is

    -- Inputs
    signal i_data   : std_logic_vector(31 downto 0);
    signal i_sel    : std_logic_vector(1 downto 0);
    signal i_sign   : std_logic;

    -- Output
    signal o_data   : std_logic_vector(31 downto 0);

    -- Instantiate the unit under test (UUT)
    component lb_module
        port (
            i_data : in  std_logic_vector(31 downto 0); 
            i_sel  : in  std_logic_vector(1 downto 0); 
            i_sign : in  std_logic;   
            o_data : out std_logic_vector(31 downto 0)
        );
    end component;

begin
    -- Instantiate the lb_module
    uut: lb_module port map (
        i_data => i_data,
        i_sel  => i_sel,
        i_sign => i_sign,
        o_data => o_data
    );

    -- Test procedure
    process
    begin
        -- Test Case 1: i_data = x"12345678", i_sel = "00", i_sign = '0' (unsigned)
        i_data <= x"12345678";
        i_sel  <= "00";
        i_sign <= '0';
        wait for 10 ns;  -- Wait for 10 ns
        assert (o_data = x"00000078") report "Test Case 1 Failed" severity failure;

        -- Test Case 2: i_data = x"12345678", i_sel = "01", i_sign = '0' (unsigned)
        i_sel  <= "01";
        wait for 10 ns;
        assert (o_data = x"00000056") report "Test Case 2 Failed" severity failure;

        -- Test Case 3: i_data = x"12345678", i_sel = "10", i_sign = '0' (unsigned)
        i_sel  <= "10";
        wait for 10 ns;
        assert (o_data = x"00000034") report "Test Case 3 Failed" severity failure;

        -- Test Case 4: i_data = x"12345678", i_sel = "11", i_sign = '0' (unsigned)
        i_sel  <= "11";
        wait for 10 ns;
        assert (o_data = x"00000012") report "Test Case 4 Failed" severity failure;

        -- End of test
        wait;
    end process;

end behavior;

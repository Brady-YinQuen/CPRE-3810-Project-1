library IEEE;
use IEEE.std_logic_1164.all;

entity tb_fetchmodule is 
end entity tb_fetchmodule;

architecture behavior of tb_fetchmodule is 

    component Fetchmodule is 
        port(
            i_CLK       : in std_logic;  
            i_RST       : in std_logic;
            i_instruction :  in std_logic_vector(25 downto 0);
            i_imm       :  in std_logic_vector(31 downto 0);
            i_branch    : in std_logic; 
            i_zero      : in std_logic; 
            i_jump      : in std_logic; 
            i_RegJump   : in std_logic; 
            i_BNE       : in std_logic; 
            i_rs        : in std_logic_vector(31 downto 0);
            o_pcNew     : out std_logic_vector(31 downto 0);
            o_pc        : out std_logic_vector(31 downto 0)
        );
    end component Fetchmodule;

    -- Signal declarations
    signal s_CLK       : std_logic := '0';
    signal s_RST       : std_logic := '0';
    signal s_instruction : std_logic_vector(25 downto 0);
    signal s_imm       : std_logic_vector(31 downto 0);
    signal s_branch    : std_logic;
    signal s_zero      : std_logic;
    signal s_jump      : std_logic;
    signal s_RegJump   : std_logic;
    signal s_BNE       : std_logic;
    signal s_rs        : std_logic_vector(31 downto 0);
    signal s_pcNew     : std_logic_vector(31 downto 0);
    signal s_pc        : std_logic_vector(31 downto 0);

    -- Clock process (50 MHz clock -> 20 ns period)
    constant CLK_PERIOD : time := 20 ns;

begin 

    -- Instantiate the Fetchmodule
    g_fetch : Fetchmodule
    port map (
        i_CLK       => s_CLK,
        i_RST       => s_RST,
        i_instruction => s_instruction,
        i_imm       => s_imm,
        i_branch    => s_branch,
        i_zero      => s_zero,
        i_jump      => s_jump,
        i_RegJump   => s_RegJump,
        i_BNE       => s_BNE,
        i_rs        => s_rs,
        o_pcNew     => s_pcNew,
        o_pc        => s_pc
    );

    -- Clock process
    clk_process : process
    begin
        while true loop
            s_CLK <= '0';
            wait for CLK_PERIOD / 2;
            s_CLK <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
    end process clk_process;

    -- Simulation process
    simulation: process
    begin 
        -- Apply reset
        s_RST <= '1';
        wait for 2 * CLK_PERIOD;
        s_RST <= '0';

        -- Test case 1: No jump, no branch
        s_instruction <= "00000000000000000000000000";
        s_imm <= x"00000000";
        s_branch <= '0';
        s_zero <= '0';
        s_jump <= '0';
        s_RegJump <= '0';
        s_BNE <= '0';
        s_rs <= x"00000000";
        wait for 3 * CLK_PERIOD;

        -- Test case 2: Jump enabled
        s_instruction <= "00000000111100001111000000";
        s_imm <= x"00000010";
        s_branch <= '0';
        s_zero <= '0';
        s_jump <= '1';
        s_RegJump <= '0';
        s_BNE <= '0';
        s_rs <= x"00000000";
        wait for 3 * CLK_PERIOD;

        -- Test case 3: Branch taken (zero = 1)
        s_instruction <= "00000000000000000000000001";
        s_imm <= x"00000004";
        s_branch <= '1';
        s_zero <= '1';
        s_jump <= '0';
        s_RegJump <= '0';
        s_BNE <= '0';
        s_rs <= x"00000000";
        wait for 3 * CLK_PERIOD;

        -- Test case 4: Register jump
        s_instruction <= "00000000000000000000000010";
        s_imm <= x"00000008";
        s_branch <= '0';
        s_zero <= '0';
        s_jump <= '0';
        s_RegJump <= '1';
        s_BNE <= '0';
        s_rs <= x"00000100";
        wait for 3 * CLK_PERIOD;

        -- Test case 5: Branch Not Equal (BNE) with zero = 0
        s_instruction <= "00000000000000000000000011";
        s_imm <= x"0000000C";
        s_branch <= '0';
        s_zero <= '0';
        s_jump <= '0';
        s_RegJump <= '0';
        s_BNE <= '1';
        s_rs <= x"00000000";
        wait for 3 * CLK_PERIOD;

        -- End simulation
        wait;
    end process simulation; 

end architecture behavior;

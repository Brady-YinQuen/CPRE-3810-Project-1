library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ALU_tb is
end ALU_tb;

architecture sim of ALU_tb is

    -- Component declaration for the ALU
    component ALU is
        port( 
            i_input1    : in std_logic_vector(31 downto 0);
            i_input2    : in std_logic_vector(31 downto 0);
            i_control   : in std_logic_vector(3 downto 0);
            i_overflowEN: in std_logic;
            i_shiftregEN: in std_logic;
            i_shmt      : in std_logic_vector(4 downto 0);
            o_output    : out std_logic_vector(31 downto 0);
            o_overflow  : out std_logic;
            o_zero      : out std_logic
        );
    end component;

    -- Signal declarations
    signal i_input1    : std_logic_vector(31 downto 0);
    signal i_input2    : std_logic_vector(31 downto 0);
    signal i_control   : std_logic_vector(3 downto 0);
    signal i_overflowEN: std_logic;
    signal i_shiftregEN: std_logic;
    signal i_shmt      : std_logic_vector(4 downto 0);
    signal o_output    : std_logic_vector(31 downto 0);
    signal o_overflow  : std_logic;
    signal o_zero      : std_logic;

begin

    -- Instantiate the ALU
    uut: ALU
        port map(
            i_input1    => i_input1,
            i_input2    => i_input2,
            i_control   => i_control,
            i_overflowEN=> i_overflowEN,
            i_shiftregEN=> i_shiftregEN,
            i_shmt      => i_shmt,
            o_output    => o_output,
            o_overflow  => o_overflow,
            o_zero      => o_zero
        );

    -- Test process
    stim_proc: process
    begin
        -- Test case 1: Add 5 + 3
        i_input1 <= x"00000005";  -- 5 in hex
        i_input2 <= x"00000003";  -- 3 in hex
        i_control <= "0000";      -- Add operation (assuming control '0000' for ADD)
        i_overflowEN <= '0';      -- Overflow not enabled
        i_shiftregEN <= '0';      -- No shift
        i_shmt <= "00000";        -- No shift amount
        
        wait for 10 ns;  -- Wait for results

        -- Test output after addition
        report "Output: " & integer'image(to_integer(unsigned(o_output)));

        -- Finish simulation
        wait;
    end process stim_proc;

end sim;

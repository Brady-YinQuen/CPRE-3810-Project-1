library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Adder_4 is 
    port (
        i_pc :  in std_logic_vector(31 downto 0);
        o_pc : out std_logic_vector(31 downto 0)
    );
    end Adder_4;

    architecture structural of Adder_4 is 
        component nAdder_Sub is 
	 generic(N : integer := 32);
            port(
                i_A, i_B: in  std_logic_vector(31 downto 0);       -- Input signals
                i_C : in std_logic;                                 -- Input Carry
                i_S : out std_logic_vector(31 downto 0);            -- Output Sum
                i_C_out : out std_logic                              -- Output Carry
            );
            end component;

            signal s_overflow1 : std_logic;

            begin
            g_add4 : nAdder_Sub
            port MAP(
                i_A => i_pc,
                i_B => x"00000004",
                i_C => '0',
                i_s => o_pc,
                i_C_out => s_overflow1 
            );

            end architecture structural;
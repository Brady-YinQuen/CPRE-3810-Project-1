library IEEE;
use IEEE.std_logic_1164.all;

entity n_decoder_tb is
    generic(N : integer := 5);
end n_decoder_tb;


architecture behavior of n_decoder_tb is

    component N_decoder is port(
        i_sel : in std_logic_vector(N-1 downto 0);
        o_O   : out std_logic_vector(2**N-1 downto 0)
    );
    end component N_decoder;

    signal s_sel : std_logic_vector(N-1 downto 0);
    signal s_O   : std_logic_vector(2**N-1 downto 0);


begin 
    test_decoder : N_decoder port map(
        i_sel   => s_sel,
        o_O     => s_O
    );
    stimulus_process: process
    begin 
    -- Test case 1:
    s_sel <= "00000";
    wait for 10 ns;

    -- Test case 2:
     s_sel <= "00001";
     wait for 10 ns;

    -- Test case 3:
    s_sel <= "00010";
    wait for 10 ns;


     -- Test case 4:
     s_sel <= "11111";
     wait for 10 ns;

     wait;
    end process stimulus_process;
end architecture behavior;


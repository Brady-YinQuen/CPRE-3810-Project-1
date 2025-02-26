library IEEE;
use IEEE.std_logic_1164.all;

entity tb_extender is
end entity tb_extender;

architecture behavior of tb_extender is
component Extender is
    port(
        i_imm        : in std_logic_vector(15 downto 0);    
        i_sign       : in  std_logic;
        o_O          : out std_logic_vector(31 downto 0)
    );  
    end component Extender; 

    signal s_imm : std_logic_vector(15 downto 0);
    signal s_sign: std_logic;
    signal s_O : std_logic_vector(31 downto 0);

    begin 
    g_exten : Extender 
    port map (
        i_imm        => s_imm,   
        i_sign       => s_sign,
        o_O          => s_O
    );

    simulation: process
begin 
    -- case 1 
    s_imm <= x"FFFF"; 
    s_sign <= '0';
    wait for 10 ns;

    -- case 2
    s_imm <= x"FFFF"; s_sign <= '1';
    wait for 10 ns;
    wait;



    end process simulation; 


end architecture behavior;
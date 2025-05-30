library IEEE;
use IEEE.std_logic_1164.all;

entity xor_32 is
    port(
        i_A : in std_logic_vector(31 downto 0); 
        i_B : in std_logic_vector(31 downto 0); 
        o_F : out std_logic_vector(31 downto 0)  
    );
end xor_32;

architecture behavioral of xor_32 is
begin
    o_F <= i_A xor i_B;
end behavioral;
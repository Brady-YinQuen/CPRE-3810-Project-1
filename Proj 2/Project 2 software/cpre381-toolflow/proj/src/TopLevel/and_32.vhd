library IEEE;
use IEEE.std_logic_1164.all;

entity and_32 is
    port(
        i_A : in std_logic_vector(31 downto 0);  
        i_B : in std_logic_vector(31 downto 0);  
        o_F : out std_logic_vector(31 downto 0)  
    );
end and_32;

architecture behavioral of and_32 is
begin
    o_F <= i_A and i_B;
end behavioral;
library IEEE;
use IEEE.std_logic_1164.all;

entity Extender is
    port(
        i_imm  : in  std_logic_vector(15 downto 0);    
        i_sign : in  std_logic;
        o_O    : out std_logic_vector(31 downto 0)
    );
end Extender;

architecture dataflow of Extender is
begin
    o_O <= (31 downto 16 => i_imm(15)) & i_imm when i_sign = '1' 
           else
           (31 downto 16 => '0') & i_imm;
end dataflow;
library IEEE;
use IEEE.std_logic_1164.all;

entity Append is

    port(
        i_input1       : in std_logic_vector(27 downto 0);    
        i_input2       : in std_logic_vector(31 downto 0);
        o_output      : out std_logic_vector(31 downto 0)
    );  

  end Append;

  architecture dataflow of Append is
    begin 
        o_output <= i_input2(31 downto 28) & i_input1;
    end dataflow ; 
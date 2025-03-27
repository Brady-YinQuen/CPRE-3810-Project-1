library IEEE;
use IEEE.std_logic_1164.all;

entity SLL26bTo28b is

    port(
        i_input       : in std_logic_vector(25 downto 0);    
        o_output      : out std_logic_vector(27 downto 0)
    );  

  end SLL26bTo28b;

  architecture dataflow of SLL26bTo28b is
    begin 
        o_output <= i_input & "00";
    end dataflow ; 
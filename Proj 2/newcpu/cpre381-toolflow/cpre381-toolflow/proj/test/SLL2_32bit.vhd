library IEEE;
use IEEE.std_logic_1164.all;

entity SLL2_32bit is

    port(
        i_input       : in std_logic_vector(31 downto 0);    
        o_output      : out std_logic_vector(31 downto 0)
    );  

  end SLL2_32bit;

  architecture dataflow of SLL2_32bit is
    begin 
        o_output <= i_input(29 downto 0) & "00";
    end dataflow ; 
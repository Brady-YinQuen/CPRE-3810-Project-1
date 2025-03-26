library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Shifter is
    port(
        i_shiftamount: in std_logic_vector(4 downto 0);
        i_data: in std_logic_vector(31 downto 0);
        i_shiftright: in std_logic; 
        i_arithmetic: in std_logic;
        o_data: out std_logic_vector(31 downto 0)
    );
    end Shifter;


architecture structural of Shifter is
   
    begin
     
        process (i_shiftamount, i_data, i_shiftright, i_arithmetic )
        begin 
        if i_shiftright = '0' then 
        o_data <= std_logic_vector(shift_left(unsigned(i_data),to_integer(unsigned(i_shiftamount)))); 
        else 
            if i_arithmetic = '0'then 
            o_data <= std_logic_vector(shift_right(unsigned(i_data),to_integer(unsigned(i_shiftamount)))); 
            else 
            o_data <= std_logic_vector(shift_right(signed(i_data),to_integer(unsigned(i_shiftamount)))); 
            end if;
        end if;


        end process;

    end architecture structural;
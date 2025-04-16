library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.control_package.all;


entity mux16t1_32bit is
    port(
        i_d : in mux_bus_control;
        i_s : in std_logic_vector(3 downto 0);
        o_O : out std_logic_vector(31 downto 0)
    );

end mux16t1_32bit;

architecture dataflow of mux16t1_32bit is
    begin 
    o_O <= i_d(to_integer(unsigned(i_s)));
end dataflow;
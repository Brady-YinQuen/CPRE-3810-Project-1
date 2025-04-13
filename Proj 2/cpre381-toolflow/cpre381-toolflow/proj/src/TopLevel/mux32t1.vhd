library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.my_package.all;


entity mux32t1 is
    port(
        i_d : in mux_bus;
        i_s : in std_logic_vector(4 downto 0);
        o_O : out std_logic_vector(31 downto 0)
    );

end mux32t1;

architecture dataflow of mux32t1 is
    begin 
    o_O <= i_d(to_integer(unsigned(i_s)));
end dataflow;
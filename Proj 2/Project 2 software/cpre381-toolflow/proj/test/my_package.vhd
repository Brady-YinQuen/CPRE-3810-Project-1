library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package my_package is
    type mux_bus is array (31 downto 0) of std_logic_vector(31 downto 0);
end package my_package;
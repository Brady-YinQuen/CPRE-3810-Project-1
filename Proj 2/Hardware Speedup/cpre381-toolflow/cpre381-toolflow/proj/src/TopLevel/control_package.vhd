library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package control_package is
    type mux_bus_control is array (15 downto 0) of std_logic_vector(31 downto 0);
end package control_package;
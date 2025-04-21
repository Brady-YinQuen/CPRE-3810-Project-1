library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity declaration for the 2:1 mux
entity mux2to1 is
    port (
        i_D0, i_D1  : in std_logic; -- Input signals
        i_S    : in  std_logic;  -- Select signal
        o_O    : out std_logic   -- Output signal
    );
end entity mux2to1;

-- Dataflow architecture for the 2:1 mux
architecture dataflow of mux2to1 is
begin
    -- Conditional signal assignment
    o_O <= i_D0 when i_S = '0' 
	else i_D1;
end architecture dataflow;
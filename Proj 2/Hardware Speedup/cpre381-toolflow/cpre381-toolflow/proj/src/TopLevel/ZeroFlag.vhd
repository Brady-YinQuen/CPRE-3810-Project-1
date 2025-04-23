library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ZeroFlag is
    Port ( data_in : in std_logic_vector(31 downto 0); -- 8-bit input
           zero_flag : out std_logic);
end ZeroFlag;

architecture Dataflow of ZeroFlag is
begin
    -- Concurrent assignment: zero_flag is '1' if data_in is all zeros, else '0'
    zero_flag <= '1' when data_in = x"00000000" else '0';
end Dataflow;
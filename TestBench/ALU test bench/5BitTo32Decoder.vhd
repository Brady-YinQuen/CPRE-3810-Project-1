library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all; -- For arithmetic on std_logic_vector

entity shmtTo32Decoder is
    generic(N : integer := 5);  -- N is 5 for a 5-bit decoder
    port(
        i_sel : in std_logic_vector(N-1 downto 0);
        o_O   : out std_logic_vector(2**N-1 downto 0)  -- Output of size 32-bits
    );
end shmtTo32Decoder;

architecture dataflow of shmtTo32Decoder is
begin
with i_sel select

o_O  <= x"00000000" when "00000",
	    x"00000001" when "00001",  -- bit 1 set
       x"00000002" when "00010",  -- bit 2 set
       x"00000003" when "00011",  -- bit 3 set
       x"00000004" when "00100",  -- bit 4 set
       x"00000005" when "00101",  -- bit 5 set
       x"00000006" when "00110",  -- bit 6 set
       x"00000007" when "00111",  -- bit 7 set
       x"00000008" when "01000",  -- bit 8 set
       x"00000009" when "01001",  -- bit 9 set
       x"0000000A" when "01010",  -- bit 10 set
       x"0000000B" when "01011",  -- bit 11 set
       x"0000000C" when "01100",  -- bit 12 set
       x"0000000D" when "01101",  -- bit 13 set
       x"0000000E" when "01110",  -- bit 14 set
       x"0000000F" when "01111",  -- bit 15 set
       x"00000010" when "10000",  -- bit 16 set
       x"00000011" when "10001",  -- bit 17 set
       x"00000012" when "10010",  -- bit 18 set
       x"00000013" when "10011",  -- bit 19 set
       x"00000014" when "10100",  -- bit 20 set
       x"00000015" when "10101",  -- bit 21 set
       x"00000016" when "10110",  -- bit 22 set
       x"00000017" when "10111",  -- bit 23 set
       x"00000018" when "11000",  -- bit 24 set
       x"00000019" when "11001",  -- bit 25 set
       x"0000001A" when "11010",  -- bit 26 set
       x"0000001B" when "11011",  -- bit 27 set
       x"0000001C" when "11100",  -- bit 28 set
       x"0000001D" when "11101",  -- bit 29 set
       x"0000001E" when "11110",  -- bit 30 set
       x"0000001F" when "11111",   -- bit 31 set
	x"00000000" when others;

end dataflow;
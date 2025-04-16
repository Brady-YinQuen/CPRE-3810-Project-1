library IEEE;
use IEEE.std_logic_1164.all;

entity mux4to1_32bit is
    port(
        i_data0 : in  std_logic_vector(31 downto 0);  
        i_data1 : in  std_logic_vector(31 downto 0);  
        i_data2 : in  std_logic_vector(31 downto 0);  
        i_data3 : in  std_logic_vector(31 downto 0);  
        i_sel   : in  std_logic_vector(1 downto 0);   
        o_data  : out std_logic_vector(31 downto 0)   
    );
end mux4to1_32bit;

architecture Behavioral of mux4to1_32bit is
begin
    with i_sel select
        o_data <= 
            i_data0  when "00",  
            i_data1  when "01",  
            i_data2  when "10", 
            i_data3  when others; 


end Behavioral;
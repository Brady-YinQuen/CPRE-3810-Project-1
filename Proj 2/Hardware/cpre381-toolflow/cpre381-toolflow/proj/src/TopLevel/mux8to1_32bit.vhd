library IEEE;
use IEEE.std_logic_1164.all;

entity mux8to1_32bit is
    port(
        i_data0 : in  std_logic_vector(31 downto 0);  
        i_data1 : in  std_logic_vector(31 downto 0);  
        i_data2 : in  std_logic_vector(31 downto 0);  
        i_data3 : in  std_logic_vector(31 downto 0);  
        i_data4 : in  std_logic_vector(31 downto 0);  
        i_data5 : in  std_logic_vector(31 downto 0);  
        i_data6 : in  std_logic_vector(31 downto 0);  
        i_data7 : in  std_logic_vector(31 downto 0);  
        i_sel   : in  std_logic_vector(2 downto 0);   
        o_data  : out std_logic_vector(31 downto 0)   
    );
end mux8to1_32bit;

architecture Behavioral of mux8to1_32bit is
begin
    with i_sel select
        o_data <= 
            i_data0  when "000",  
            i_data1  when "001",  
            i_data2  when "010", 
            i_data3  when "011",  
            i_data4  when "100",  
            i_data5  when "101", 
            i_data6  when "110", 
            i_data7  when others; 


end Behavioral;
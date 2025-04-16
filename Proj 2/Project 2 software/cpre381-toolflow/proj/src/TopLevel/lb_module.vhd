library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity lb_module is
    port(
        i_data : in  std_logic_vector(31 downto 0); 
        i_sel   : in  std_logic_vector(1 downto 0);   
        i_sign  : in  std_logic;   
        o_data  : out std_logic_vector(31 downto 0)   
    );
end lb_module;

architecture Behavioral of lb_module is
    signal s_byte : std_logic_vector(7 downto 0);  
    signal s_extended : std_logic_vector(31 downto 0);  
begin

    with i_sel select
        s_byte <= 
            i_data(7 downto 0)   when "00",  
            i_data(15 downto 8)   when "01",  
            i_data(23 downto 16)   when "10",  
            i_data(31 downto 24)   when others; 
    
    s_extended <= std_logic_vector(resize(signed(s_byte),32)) when i_sign = '1' else 
                  std_logic_vector(resize(unsigned(s_byte),32));

    o_data <= s_extended;  
end Behavioral;
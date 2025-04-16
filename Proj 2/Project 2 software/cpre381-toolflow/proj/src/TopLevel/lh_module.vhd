library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity lh_module is
    port(
        i_data : in  std_logic_vector(31 downto 0); 
        i_sel   : in  std_logic_vector(1 downto 0);   
        i_sign  : in  std_logic;   
        o_data  : out std_logic_vector(31 downto 0)   
    );
end lh_module;

architecture Behavioral of lh_module is
    signal s_half : std_logic_vector(15 downto 0);  
    signal s_extended : std_logic_vector(31 downto 0);  
begin

    with i_sel select
        s_half <= 
            i_data(15 downto 0)   when "00",  
            i_data(31 downto 16)   when others; 
    
    s_extended <= std_logic_vector(resize(signed(s_half),32)) when i_sign = '1' else 
                  std_logic_vector(resize(unsigned(s_half),32));

    o_data <= s_extended;  
end Behavioral;
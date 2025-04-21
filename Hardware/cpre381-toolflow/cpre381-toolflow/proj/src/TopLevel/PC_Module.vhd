library IEEE;
use IEEE.std_logic_1164.all;

entity PC_Module is
    generic(N : integer := 32);
    port(
        i_CLK        : in std_logic;  
        i_RST        : in std_logic;
        i_WE         : in std_logic;
        i_pc         : in std_logic_vector(N-1 downto 0);
        o_Q          : out std_logic_vector(N-1 downto 0)
    );
end PC_Module;

architecture structural of PC_Module is

    component mux2t1_N is
        port(
            i_S          : in std_logic;
            i_D0         : in std_logic_vector(31 downto 0);
            i_D1         : in std_logic_vector(31 downto 0);
            o_O          : out std_logic_vector(31 downto 0)
        );
        end component;

    component N_Reg is
        port (
            i_CLK        : in std_logic;  
            i_RST        : in std_logic;
            i_WE         : in std_logic;
            i_D          : in std_logic_vector(31 downto 0);
            o_Q          : out std_logic_vector(31 downto 0)
        );
        end component;

        signal s_pc_in : std_logic_vector(31 downto 0) := x"00400000"; 

    begin

        g_pcMux : mux2t1_N
        port MAP(
            i_S => i_RST,
            i_D0 => i_pc,
            i_D1 => x"00400000",  -- initial PC value 
            o_O => s_pc_in
        );
         
        g_pc : N_Reg
        port MAP(
            i_CLK        =>  i_CLK, 
            i_RST        =>  '0',
            i_WE         =>  i_WE,
            i_D          => s_pc_in,
            o_Q          => o_Q 
        );

    end structural;

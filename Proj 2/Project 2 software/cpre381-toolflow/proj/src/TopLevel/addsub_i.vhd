library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity addsub_i is
    generic(N : integer := 32);
    port(
        i_A, i_B, i_imm: in  std_logic_vector(N-1 downto 0);
        i_C : in std_logic;   
        i_ALUSrc : in std_logic;   
        i_S : out std_logic_vector(N-1 downto 0);
        i_C_out : out std_logic  
    );
end addsub_i;

architecture structural of addsub_i is

    component nAdder_Sub is
        port(
            i_A, i_B: in  std_logic_vector(N-1 downto 0); 
            i_C : in std_logic;   
            i_S : out std_logic_vector(N-1 downto 0);
            i_C_out : out std_logic  
        );
    end component;

    component mux2t1_N is
        port(i_S          : in std_logic;
            i_D0         : in std_logic_vector(N-1 downto 0);
            i_D1         : in std_logic_vector(N-1 downto 0);
            o_O          : out std_logic_vector(N-1 downto 0));
    end component;
    
    signal s_mux_i : std_logic_vector(N-1 downto 0);

    begin
    G_mux: mux2t1_N
    port MAP(
        i_S  => i_ALUSrc,
        i_D0 => i_B,
        i_D1 => i_imm,
        o_O => s_mux_i
    );

    g_adder: nAdder_Sub
    port MAP(
        i_A => i_A,
        i_B => s_mux_i,
        i_C => i_C,
        i_S => i_S,
        i_C_out => i_C_out
    );


    end architecture structural; 
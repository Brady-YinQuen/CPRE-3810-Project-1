library IEEE;
use IEEE.std_logic_1164.all;

entity N_Reg is
    generic(N : integer := 32;
            INIT : std_logic_vector(31 downto 0) := x"00000000"
            );
    port(
        i_CLK        : in std_logic;  
        i_RST        : in std_logic;
        i_WE         : in std_logic;
        i_D          : in std_logic_vector(N-1 downto 0);
        o_Q          : out std_logic_vector(N-1 downto 0)
    );
end N_Reg;

architecture structural of N_Reg is

    component neg_dffg is
        generic (
            INIT :  std_logic := '0'
          );
        port(i_CLK        : in std_logic;     -- Clock input
            i_RST        : in std_logic;     -- Reset input
            i_WE         : in std_logic;     -- Write enable input
            i_D          : in std_logic;     -- Data value input
            o_Q          : out std_logic);   -- Data value output
    end component;

    begin

        NBit_DFF: for i in 0 to N-1 generate
        dffi: neg_dffg  
        generic map(
            INIT => INIT(i)
          )
        port map(
            i_CLK   => i_CLK,
            i_RST   => i_RST,
            i_WE    => i_WE,
            i_D     => i_D(i),
            o_Q     => o_Q(i)
        );
        end generate NBit_DFF;

    end structural;

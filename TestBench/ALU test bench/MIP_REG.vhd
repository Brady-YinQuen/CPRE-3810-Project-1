library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.my_package.all;

entity MIP_REG is
    port (
        i_rs : in std_logic_vector(4 downto 0);
        i_rt : in std_logic_vector(4 downto 0);
        i_rd : in std_logic_vector(4 downto 0);
        i_d  : in std_logic_vector(31 downto 0);
        i_reset : in std_logic;  
        i_clock : in std_logic;  
        i_we    : in std_logic;
        o_D1    : out std_logic_vector(31 downto 0);
        o_D2    : out std_logic_vector(31 downto 0)
    );
end MIP_REG;

architecture structural of MIP_REG is
    component andg2 is
        port(
            i_A          : in std_logic;
            i_B          : in std_logic;
            o_F          : out std_logic
        );
    end component;

    component mux32t1 is
        port(
            i_d : in mux_bus;
            i_s : in std_logic_vector(4 downto 0);
            o_O : out std_logic_vector(31 downto 0)
        );
    end component;

    component N_Reg is
        generic (
            INIT : std_logic_vector(31 downto 0):= x"00000000"
        );
        port(
            i_CLK        : in std_logic;  
            i_RST        : in std_logic;
            i_WE         : in std_logic;
            i_D          : in std_logic_vector(31 downto 0);
            o_Q          : out std_logic_vector(31 downto 0)
        );
    end component;

    component N_decoder is
        port(
            i_sel : in std_logic_vector(4 downto 0);
            o_O   : out std_logic_vector(31 downto 0)
        );
    end component;

    signal s_decoder : std_logic_vector(31 downto 0);
    signal s_and : std_logic_vector(31 downto 0);
    signal s_reg_o : mux_bus;


    begin 

    g_decoder : N_decoder 
    port MAP(
        i_sel => i_rd,
        o_O => s_decoder
    );
    
    g_and : for i in 0 to 31 generate
        andi: andg2 port map(
            i_A => i_we,
            i_B => s_decoder(i),
            o_F => s_and(i)
        );
    end generate g_and;
        
    g_reg1 : N_Reg
    port Map(
        i_CLK        => i_clock,  
        i_RST        => i_reset,
        i_WE         => '0',
        i_D          => x"00000000",
        o_Q          => s_reg_o(0)
    );

    g_reg : for i in 1 to 31 generate

        g_reg29: if i = 29 generate 
        reg29 : N_Reg
        generic map(
            INIT => x"7FFFEFFC"  -- Add generic to N_Reg for initialization
        )
        port Map(
            i_CLK        => i_clock,  
            i_RST        => i_reset,
            i_WE         => s_and(i),
            i_D          => i_d,
            o_Q          => s_reg_o(i)
        );
        end generate g_reg29;
        g_regOther: if i /= 29 generate 
        g_regi : N_Reg
        generic map(
            INIT => x"00000000"  -- Add generic to N_Reg for initialization
        )
        port Map(
            i_CLK        => i_clock,  
            i_RST        => i_reset,
            i_WE         => s_and(i),
            i_D          => i_d,
            o_Q          => s_reg_o(i)
        );
        end generate g_regOther;
    end generate g_reg;

    g_mux1 : mux32t1
    port MAP(
        i_d => s_reg_o,
        i_s => i_rs,
        o_O => o_D1
    );

    g_mux2 : mux32t1
    port MAP(
        i_d => s_reg_o,
        i_s => i_rt,
        o_O => o_D2
    );


    end architecture structural;









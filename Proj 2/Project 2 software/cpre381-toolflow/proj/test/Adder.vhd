library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Adder is
    port(
    i_A, i_B, i_C : in  std_logic;  -- Input signals
    i_S : out std_logic;            -- Output Sum
    i_C_out : out std_logic             -- Output Carry
    );
end entity Adder;

architecture structure of Adder is 
    component andg2
    port(
        i_A          : in std_logic;
        i_B          : in std_logic;
        o_F          : out std_logic
    );
    end component;

    component org2
    port(
        i_A          : in std_logic;
        i_B          : in std_logic;
        o_F          : out std_logic
    );
    end component;

    component xorg2
    port(
        i_A          : in std_logic;
        i_B          : in std_logic;
        o_F          : out std_logic
    );
    end component;

    signal s_XAB : std_logic;
    signal s_AAB : std_logic;
    signal s_ABC : std_logic;
    signal s_AAC : std_logic;
    signal s_XABAC : std_logic;

begin

  ---------------------------------------------------------------------------
  -- Level 0: 
  ---------------------------------------------------------------------------

    G_xor1 : xorg2
    port MAP(
        i_A          => i_A,
        i_B          => i_B,
        o_F          => s_XAB
    );

    G_xor2 : xorg2
    port MAP(
        i_A          => s_XAB,
        i_B          => i_C,
        o_F          => i_S
    );

---------------------------------------------------------------------------
  -- Level 2: 
---------------------------------------------------------------------------
    g_and1: andg2
	port MAP(
	i_A          => i_A,
        i_B          => i_B,
        o_F          => s_AAB
	);

    g_and2: andg2
	port MAP(
	    i_A          => i_B,
        i_B          => i_C,
        o_F          => s_ABC
	);

    g_and3: andg2
	port MAP(
	i_A          => i_A,
        i_B          => i_C,
        o_F          => s_AAC
	);

    g_or1 :org2
    port MAP(
	i_A          => s_AAB,
        i_B          => s_ABC,
        o_F          => s_XABAC 
	);

    g_or2 :org2
    port MAP(
	    i_A          => s_XABAC,
        i_B          => s_AAC,
        o_F          => i_C_out
	);

end architecture structure;




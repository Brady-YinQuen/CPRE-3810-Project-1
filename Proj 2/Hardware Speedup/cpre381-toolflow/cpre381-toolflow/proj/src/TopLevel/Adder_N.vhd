library IEEE;
use IEEE.std_logic_1164.all;

entity Adder_N is
    generic(N : integer := 32);
    port(
        i_A, i_B: in  std_logic_vector(N-1 downto 0);       -- Input signals
        i_C : in std_logic;                                 -- Input Carry
        i_S : out std_logic_vector(N-1 downto 0);            -- Output Sum
        i_C_out : out std_logic                              -- Output Carry
    );

end Adder_N;

architecture structural of Adder_N is
    component Adder is
        port(
        i_A, i_B, i_C : in  std_logic;  -- Input signals
        i_S : out std_logic;            -- Output Sum
        i_C_out : out std_logic             -- Output Carry
        );
    end component;

	component xorg2 is 
	  port(
	    i_A          : in std_logic;
        i_B          : in std_logic;
        o_F          : out std_logic);
	end component;

    signal carry : std_logic_vector(N downto 0);
begin
    carry(0) <= i_C;
    NBit_Adder: for i in 0 to N-1 generate
        adderI: Adder port map(
            i_A => i_A(i),
            i_B => i_B(i),
            i_C => carry(i),
            i_S => i_S(i),
            i_C_out => carry(i+1)
        );
        end generate NBit_Adder;


    overflow: xorg2 port MAP(
	    i_A         => carry(N-1),
       	i_B         =>carry(N),
      	o_F        =>  i_C_out
	);


end structural;


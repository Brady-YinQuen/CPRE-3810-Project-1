library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity nAdder_Sub is
    generic(N : integer := 32);
    port(
        i_A, i_B : in  std_logic_vector(N-1 downto 0); 
        i_C      : in  std_logic;  -- 0 for add, 1 for sub
        i_S      : out std_logic_vector(N-1 downto 0);
        i_C_out  : out std_logic  -- overflow flag
    );
end nAdder_Sub;

architecture Behavioral of nAdder_Sub is
begin
    process(i_A, i_B, i_C)
        variable A_signed, B_signed : signed(N-1 downto 0);
        variable result             : signed(N-1 downto 0);
        variable overflow           : std_logic;
    begin
        A_signed := signed(i_A);
        B_signed := signed(i_B);

        if i_C = '0' then
            -- ADDITION
            result := A_signed + B_signed;

            -- Overflow: same sign inputs, different sign output
            if (A_signed(N-1) = B_signed(N-1)) and (result(N-1) /= A_signed(N-1)) then
                overflow := '1';
            else
                overflow := '0';
            end if;

        else
            -- SUBTRACTION
            result := A_signed - B_signed;

            -- Overflow: different sign inputs, result sign differs from A
            if (A_signed(N-1) /= B_signed(N-1)) and (result(N-1) /= A_signed(N-1)) then
                overflow := '1';
            else
                overflow := '0';
            end if;
        end if;

        -- Assign outputs
        i_S      <= std_logic_vector(result);
        i_C_out  <= overflow;
    end process;
end Behavioral;

-- library IEEE;
-- use IEEE.std_logic_1164.all;
-- use IEEE.numeric_std.all;


-- entity nAdder_Sub is
--     generic(N : integer := 32);
--     port(
--         i_A, i_B: in  std_logic_vector(N-1 downto 0); 
--         i_C : in std_logic;   
--         i_S : out std_logic_vector(N-1 downto 0);
--         i_C_out : out std_logic  
--     );
-- end nAdder_Sub;

-- architecture structural of nAdder_Sub is
--     component Adder_N  is
--         port(
--             i_A, i_B: in  std_logic_vector(N-1 downto 0);       -- Input signals
--             i_C : in std_logic;                                 -- Input Carry
--             i_S : out std_logic_vector(N-1 downto 0);            -- Output Sum
--             i_C_out : out std_logic                              -- Output Carry
--         );
--     end component;
    
--     component mux2t1_N is
--         port(i_S          : in std_logic;
--             i_D0         : in std_logic_vector(N-1 downto 0);
--             i_D1         : in std_logic_vector(N-1 downto 0);
--             o_O          : out std_logic_vector(N-1 downto 0));
--     end component;

--     component OnesComp is
--         port(
--             i_A : in std_logic_vector(N-1 downto 0);
--             o_F : out std_logic_vector(N-1 downto 0)
--         );
--     end component;


--     signal s_mux : std_logic_vector(N-1 downto 0);
--     signal s_not : std_logic_vector(N-1 downto 0);



-- begin

--     g_not : OnesComp
--     port MAP(
--         i_A => i_B,
--         o_F => s_not
--     );

--     G_mux: mux2t1_N
--     port MAP(
--         i_S  => i_C,
--         i_D0 => i_B,
--         i_D1 => s_not,
--         o_O => s_mux
--     );

--     g_adder: Adder_N
--     port MAP(
--         i_A => i_A,
--         i_B => s_mux,
--         i_C => i_C,
--         i_S => i_S,
--         i_C_out => i_C_out
--     );

-- end architecture structural; 
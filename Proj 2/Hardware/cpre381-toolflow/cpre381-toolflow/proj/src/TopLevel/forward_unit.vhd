library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity forward_unit is 
    port (
        i_rs    : in std_logic_vector(4 downto 0);
        i_rt    : in std_logic_vector(4 downto 0);
        i_idRS  : in std_logic_vector(4 downto 0);
        i_idRT  : in std_logic_vector(4 downto 0);
        i_memRT : in std_logic_vector(4 downto 0);
        i_memrd : in std_logic_vector(4 downto 0);
        i_wbrd  : in std_logic_vector(4 downto 0);
        i_exrd  : in std_logic_vector(4 downto 0);
        i_IDWE  : in std_logic; 
        i_exWE  : in std_logic; 
        i_wbWE  : in std_logic; 
        i_jalwe   : in std_logic;
        i_jalex   : in std_logic;  
        i_jalid   : in std_logic; 
        o_forwardMem : out std_logic;
        o_forwardA: out std_logic_vector(1 downto 0);
        o_forwardB: out std_logic_vector(1 downto 0);
        o_forwardAReg : out std_logic;
        o_forwardBReg : out std_logic; 
        o_forwardA2 : out std_logic_vector(1 downto 0);
        o_forwardB2 : out std_logic_vector(1 downto 0)
    );
end forward_unit;

architecture dataflow of forward_unit is 

    -- EX stage forwarding (to EX)
    signal rs_memrd_and_exwe : std_logic;
    signal rs_wbrd_and_wbwe  : std_logic;
    signal rt_memrd_and_exwe : std_logic;
    signal rt_wbrd_and_wbwe  : std_logic;

    -- ID stage forwarding (to ID)
    signal IDrs_memrd_and_exwe : std_logic;
    signal IDrs_wbrd_and_wbwe  : std_logic;
    signal IDrs_exrd_and_idwe  : std_logic;

    signal IDrt_memrd_and_exwe : std_logic;
    signal IDrt_wbrd_and_wbwe  : std_logic;
    signal IDrt_exrd_and_idwe  : std_logic;
    
    signal memrd_jal : std_logic_vector(4 downto 0);
    signal wbrd_jal :std_logic_vector(4 downto 0);
    signal exrd_jal  : std_logic_vector(4 downto 0);


begin

    memrd_jal <= i_memrd when (i_jalex = '0') else "11111";
    wbrd_jal <= i_wbrd when (i_jalwe = '0') else "11111";
    exrd_jal <= i_exrd when (i_jalid = '0') else "11111";


    -- === Forwarding to EX ===
    rs_memrd_and_exwe  <= '1' when (i_rs = memrd_jal and i_exWE = '1') else '0';
    rs_wbrd_and_wbwe   <= '1' when (i_rs = wbrd_jal and i_wbWE = '1') else '0';

    rt_memrd_and_exwe  <= '1' when (i_rt = memrd_jal and i_exWE = '1') else '0';
    rt_wbrd_and_wbwe   <= '1' when (i_rt = wbrd_jal and i_wbWE = '1') else '0';

    o_forwardA <= "00" when ((i_memrd = "00000" and rs_memrd_and_exwe = '1')or (i_wbrd = "00000" and rs_wbrd_and_wbwe = '1')) or 
                            (rs_memrd_and_exwe = '0' and rs_wbrd_and_wbwe = '0') else
                  "11" when (rs_memrd_and_exwe = '1' and memrd_jal = "11111") else
                  "10" when (rs_memrd_and_exwe = '0' and rs_wbrd_and_wbwe = '1') else
                  "01";  -- default to EX forwarding

    o_forwardB <= "00" when ((i_memrd = "00000" and rt_memrd_and_exwe = '1')or (i_wbrd = "00000" and rt_wbrd_and_wbwe = '1')) or 
                            (rt_memrd_and_exwe = '0' and rt_wbrd_and_wbwe = '0') else
                  "10" when (rt_memrd_and_exwe = '0' and rt_wbrd_and_wbwe = '1') else
                  "01";

    -- === Forwarding to ID (e.g., for branch operands) ===
    IDrs_memrd_and_exwe  <= '1' when (i_idRS = memrd_jal and i_exWE = '1') else '0';
    IDrs_wbrd_and_wbwe   <= '1' when (i_idRS = wbrd_jal and i_wbWE = '1') else '0';
    IDrs_exrd_and_idwe   <= '1' when (i_idRS = exrd_jal and i_IDWE = '1') else '0';

    o_forwardA2 <= "00" when (IDrs_memrd_and_exwe = '0' and IDrs_wbrd_and_wbwe = '0' and IDrs_exrd_and_idwe = '0') else
                   "11" when (IDrs_exrd_and_idwe = '1') else
                   "01" when (IDrs_memrd_and_exwe = '1') else
                   "10";  -- Assume EX_RD (from decode stage) is lowest priority

    IDrt_memrd_and_exwe  <= '1' when (i_idRT = memrd_jal and i_exWE = '1') else '0';
    IDrt_wbrd_and_wbwe   <= '1' when (i_idRT = wbrd_jal and i_wbWE = '1') else '0';
    IDrt_exrd_and_idwe   <= '1' when (i_idRT = exrd_jal and i_IDWE = '1') else '0';

    o_forwardB2 <= "00" when (IDrt_memrd_and_exwe = '0' and IDrt_wbrd_and_wbwe = '0' and IDrt_exrd_and_idwe = '0') else
                   "11" when (IDrt_exrd_and_idwe  = '1') else
                   "01" when (IDrt_memrd_and_exwe = '1') else
                   "10";
  
    o_forwardMem <= '1' when (i_memRT = wbrd_jal and i_wbWE = '1' ) else '0';

    o_forwardAReg <= '0' when (i_wbrd = "00000" and  IDrs_wbrd_and_wbwe = '1' )else 
                    '1' when IDrs_wbrd_and_wbwe = '1' else '0';

    o_forwardBReg <= '0' when (i_wbrd = "00000" and  IDrt_wbrd_and_wbwe = '1' )else 
                     '1' when IDrt_wbrd_and_wbwe = '1' else '0';

end dataflow;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity hazzardDetection is 
    port (
        i_rs           : in  std_logic_vector(4 downto 0);
        i_rt           : in  std_logic_vector(4 downto 0);
        i_Opcode       : in  std_logic_vector(5 downto 0);
        i_OpcodeIF     : in  std_logic_vector(5 downto 0);
        i_idrt         : in  std_logic_vector(4 downto 0);
        i_exrd         : in  std_logic_vector(4 downto 0);
        i_memrd         : in  std_logic_vector(4 downto 0);
        i_wbrd         : in  std_logic_vector(4 downto 0);
        i_regjump    : in  std_logic;
        i_jump         : in  std_logic;
        i_branchTaken  : in  std_logic;
        i_branch       : in  std_logic;
        i_idwe         : in  std_logic;
        i_exwe         : in  std_logic;
        i_wbwe         : in  std_logic;
        o_pcWE         : out std_logic;
        o_ifWE         : out std_logic;
        o_flush        : out std_logic;
        o_stallsw      : out std_logic; 
        o_controlZero  : out std_logic
    );
end hazzardDetection;

architecture dataflow of hazzardDetection is

    signal rs_idrt_match : std_logic;
    signal rt_idrt_match : std_logic;

    signal rt_exrd_match : std_logic;
    signal rt_memrd_match : std_logic;
    signal rt_wbrd_match : std_logic;
    
    signal rs_exrd_match : std_logic;
    signal rs_memrd_match : std_logic;
    signal rs_wbrd_match : std_logic;

begin

    -- Match checks
    rs_idrt_match <= '1' when i_rs = i_idrt else '0';
    rt_idrt_match <= '1' when i_rt = i_idrt else '0';

    rt_exrd_match <= '1' when (i_rt = i_exrd and i_idwe = '1' )else '0';
    rt_memrd_match <= '1' when (i_rt = i_memrd and i_exwe = '1')  else '0';
    rt_wbrd_match <= '1' when (i_rt = i_wbrd and i_wbwe = '1' ) else '0';

    rs_exrd_match <= '1' when (i_rs = i_exrd and i_idwe = '1' )else '0';
    rs_memrd_match <= '1' when (i_rs = i_memrd and i_exwe = '1')  else '0';
    rs_wbrd_match <= '1' when (i_rs = i_wbrd and i_wbwe = '1' ) else '0';

-- (rs_idrt_match = '1' or rt_idrt_match = '1')
    -- Stall for lw and sw hazard
    o_pcWE <= '0' when (i_Opcode = "100011" and (i_idwe = '1' or i_exwe = '1' or i_wbwe = '1') ) or
                       ( i_OpcodeIF = "101011" and (rt_memrd_match = '1' or rt_exrd_match = '1' or  rt_wbrd_match = '1')  ) or
                       ( i_OpcodeIF = "101011" and (rs_memrd_match = '1' or rs_exrd_match = '1' or  rs_wbrd_match = '1')  ) or 
                       ( (i_OpcodeIF = "000100" or i_OpcodeIF = "000101")  and (rs_memrd_match = '1' or rs_exrd_match = '1' or  rs_wbrd_match = '1')  ) or 
                       ( (i_OpcodeIF = "000100" or i_OpcodeIF = "000101")  and (rt_memrd_match = '1' or rt_exrd_match = '1' or  rt_wbrd_match = '1')  ) or 
                       (i_regjump = '1' and (i_idwe = '1' or i_exwe = '1' or i_wbwe = '1') )or
                       ( i_OpcodeIF = "101011" and (i_idwe = '1' or i_exwe = '1' or i_wbwe = '1') )else '1';


    o_ifWE <= '0' when (i_Opcode = "100011" and (i_idwe = '1' or i_exwe = '1' or i_wbwe = '1') ) or
                        ( i_OpcodeIF = "101011" and (rt_memrd_match = '1' or rt_exrd_match = '1' or  rt_wbrd_match = '1')  ) or
                        ( i_OpcodeIF = "101011" and (rs_memrd_match = '1' or rs_exrd_match = '1' or  rs_wbrd_match = '1')  ) or 
                        ( (i_OpcodeIF = "000100" or i_OpcodeIF = "000101") and (rs_memrd_match = '1' or rs_exrd_match = '1' or  rs_wbrd_match = '1')  )or
                        ( (i_OpcodeIF = "000100" or i_OpcodeIF = "000101")  and (rt_memrd_match = '1' or rt_exrd_match = '1' or  rt_wbrd_match = '1')  ) or
                        (i_regjump = '1' and (i_idwe = '1' or i_exwe = '1' or i_wbwe = '1') ) or
                        ( i_OpcodeIF = "101011" and (i_idwe = '1' or i_exwe = '1' or i_wbwe = '1')  )else '1';


    o_controlZero <= '1' when (i_Opcode = "100011" and (i_idwe = '1' or i_exwe = '1' or i_wbwe = '1') ) or
                                ( i_OpcodeIF = "101011" and (rt_memrd_match = '1' or rt_exrd_match = '1' or  rt_wbrd_match = '1')  ) or
                                ( i_OpcodeIF = "101011" and (rs_memrd_match = '1' or rs_exrd_match = '1' or  rs_wbrd_match = '1')  ) or 
                                ( (i_OpcodeIF = "000100" or i_OpcodeIF = "000101") and (rs_memrd_match = '1' or rs_exrd_match = '1' or  rs_wbrd_match = '1')  ) or 
                                ( (i_OpcodeIF = "000100" or i_OpcodeIF = "000101")  and (rt_memrd_match = '1' or rt_exrd_match = '1' or  rt_wbrd_match = '1')  ) or
                                (i_regjump = '1' and (i_idwe = '1' or i_exwe = '1' or i_wbwe = '1') )or 
                                ( i_OpcodeIF = "101011" and (i_idwe = '1' or i_exwe = '1' or i_wbwe = '1')  ) else '0';

    o_stallsw <= '0' when ( i_OpcodeIF = "101011" and (rt_memrd_match = '1' or rt_exrd_match = '1' or  rt_wbrd_match = '1')  )else '1';

    -- Flush for branch or jump (control hazard)
    o_flush <= '1' when (i_jump = '1' or (i_branch = '1' and i_branchTaken = '1')) else '0';

end dataflow;
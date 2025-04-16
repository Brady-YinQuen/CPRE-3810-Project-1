-------------------------------------------------------------------------
-- Henry Duwe
-- Department of Electrical and Computer Engineering
-- Iowa State University
-------------------------------------------------------------------------


-- MIPS_Processor.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: This file contains a skeleton of a MIPS_Processor  
-- implementation.

-- 01/29/2019 by H3::Design created.
-------------------------------------------------------------------------


library IEEE;
use IEEE.std_logic_1164.all;

library work;
use work.MIPS_types.all;

entity MIPS_Processor is
  generic(N : integer := DATA_WIDTH);
  port(iCLK            : in std_logic;
       iRST            : in std_logic;
       iInstLd         : in std_logic;
       iInstAddr       : in std_logic_vector(N-1 downto 0);
       iInstExt        : in std_logic_vector(N-1 downto 0);
       oALUOut         : out std_logic_vector(N-1 downto 0)); -- TODO: Hook this up to the output of the ALU. It is important for synthesis that you have this output that can effectively be impacted by all other components so they are not optimized away.

end  MIPS_Processor;


architecture structure of MIPS_Processor is

  -- Required data memory signals
  signal s_DMemWr       : std_logic; -- TODO: use this signal as the final active high data memory write enable signal
  signal s_DMemAddr     : std_logic_vector(N-1 downto 0); -- TODO: use this signal as the final data memory address input
  signal s_DMemData     : std_logic_vector(N-1 downto 0); -- TODO: use this signal as the final data memory data input
  signal s_DMemOut      : std_logic_vector(N-1 downto 0); -- TODO: use this signal as the data memory output
 
  -- Required register file signals 
  signal s_RegWr        : std_logic; -- TODO: use this signal as the final active high write enable input to the register file
  signal s_RegWrAddr    : std_logic_vector(4 downto 0); -- TODO: use this signal as the final destination register address input
  signal s_RegWrData    : std_logic_vector(N-1 downto 0); -- TODO: use this signal as the final data memory data input

  -- Required instruction memory signals
  signal s_IMemAddr     : std_logic_vector(N-1 downto 0); -- Do not assign this signal, assign to s_NextInstAddr instead
  signal s_NextInstAddr : std_logic_vector(N-1 downto 0); -- TODO: use this signal as your intended final instruction memory address input.
  signal s_Inst         : std_logic_vector(N-1 downto 0); -- TODO: use this signal as the instruction signal 

  -- Required halt signal -- for simulation
  signal s_Halt         : std_logic;  -- TODO: this signal indicates to the simulation that intended program execution has completed. (Opcode: 01 0100)

  -- Required overflow signal -- for overflow exception detection
  signal s_Ovfl         : std_logic;  -- TODO: this signal indicates an overflow exception would have been initiated
  signal s_overflow1    : std_logic;  -- useless


  -- instruction fetch reg
  signal s_IFInst        : std_logic_vector(N-1 downto 0);
  signal s_IFPC          : std_logic_vector(N-1 downto 0);

  --fetch signals
  signal s_pcSrc : std_logic;
  signal s_adder4         : std_logic_vector(N-1 downto 0);
  signal s_JBSrc          : std_logic_vector(N-1 downto 0);  -- from fetch
  signal s_newPC          : std_logic_vector(N-1 downto 0);

  -- control signals 
  signal s_ALUSrc       : std_logic;
  signal s_ALUControl   : std_logic_vector(3 downto 0);
  signal s_memtoReg     : std_logic;
  signal s_RegDst       : std_logic;
  signal s_RegJump      : std_logic ;
  signal s_jump         : std_logic ;
  signal s_signExtend   : std_logic := '0' ;
  signal s_overflowEN   : std_logic;
  signal s_shiftregEN   : std_logic;
  signal s_BranchBNE    : std_logic;
  signal s_JumpLink     : std_logic;
  signal s_memOutSign   : std_logic;
  signal s_load         : std_logic_vector(1 downto 0);
  signal s_branch       : std_logic ; 

  -- sign extended module
  signal s_extended     : std_logic_vector(N-1 downto 0) ;
  signal s_xor : std_logic_vector(N-1 downto 0) ;
  signal s_zeroFlagBranch : std_logic ;
  signal s_regENJAL :std_logic ;
  signal s_MuxWECheck :std_logic ;
  signal s_writeEN:std_logic ;
  signal s_writeDMemEN:std_logic ;


  -- signal Main Reg
  signal s_rdMUX : std_logic_vector(4 downto 0);
  signal s_rt : std_logic_vector(N-1 downto 0) ;
  signal s_rs : std_logic_vector(N-1 downto 0) ;
  signal s_dummy  : std_logic ; 

  -- instruction fetch reg
  signal s_IDrs        : std_logic_vector(N-1 downto 0);
  signal s_IDrt         : std_logic_vector(N-1 downto 0);
  signal s_IDInst        : std_logic_vector(N-1 downto 0);
  signal s_IDextended         : std_logic_vector(N-1 downto 0);
  signal s_IDControl         : std_logic_vector(N-1 downto 0);
  signal s_IDPC          : std_logic_vector(N-1 downto 0);

  -- instruction in EX stage
  signal s_ALUin2  : std_logic_vector(N-1 downto 0);
  signal s_ALUDATA : std_logic_vector(N-1 downto 0) ;
  signal s_overflowsignal : std_logic ; 

  signal s_zero    : std_logic ; 
  signal s_EXrt         : std_logic_vector(N-1 downto 0);
  signal s_EXextended         : std_logic_vector(N-1 downto 0);
  signal s_EXalu         : std_logic_vector(N-1 downto 0);
  signal s_EXPC          : std_logic_vector(N-1 downto 0);
  signal s_EXControl         : std_logic_vector(N-1 downto 0);
  signal s_EXInst        : std_logic_vector(N-1 downto 0);
  signal s_EXrs        : std_logic_vector(N-1 downto 0);

-- instruction in WB stage
signal s_lb_out : std_logic_vector(N-1 downto 0) ;
signal s_lh_out : std_logic_vector(N-1 downto 0) ;
signal s_dataSelMux :  std_logic_vector(N-1 downto 0) ;
signal s_muxMemAlu: std_logic_vector(N-1 downto 0);
 
signal s_WBDMemOut        : std_logic_vector(N-1 downto 0);
signal s_WBalu         : std_logic_vector(N-1 downto 0);
signal s_WBControl         : std_logic_vector(N-1 downto 0);
signal s_WBInst         : std_logic_vector(N-1 downto 0);
signal s_WBPC         : std_logic_vector(N-1 downto 0);
signal s_WBOldPC         : std_logic_vector(N-1 downto 0);

  component mem is
    generic(ADDR_WIDTH : integer;
            DATA_WIDTH : integer);
    port(
          clk          : in std_logic;
          addr         : in std_logic_vector((ADDR_WIDTH-1) downto 0);
          data         : in std_logic_vector((DATA_WIDTH-1) downto 0);
          we           : in std_logic := '1';
          q            : out std_logic_vector((DATA_WIDTH -1) downto 0));
    end component;

  -- TODO: You may add any additional signals or components your implementation 
  --       requires below this comment
  component MIP_REG is 
  port(
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
  end component;

  component mux2t1_N is
    port(
        i_S          : in std_logic;
        i_D0         : in std_logic_vector(31 downto 0);
        i_D1         : in std_logic_vector(31 downto 0);
        o_O          : out std_logic_vector(31 downto 0)
    );
    end component;

  component lb_module is 
    port(
        i_data : in  std_logic_vector(31 downto 0); 
        i_sel   : in  std_logic_vector(1 downto 0);   
        i_sign  : in  std_logic;   
        o_data  : out std_logic_vector(31 downto 0)     
    );
    end component;

  component lh_module is 
    port(
        i_data : in  std_logic_vector(31 downto 0); 
        i_sel   : in  std_logic_vector(1 downto 0);   
        i_sign  : in  std_logic;   
        o_data  : out std_logic_vector(31 downto 0)     
    );
    end component;

  component mux4to1_32bit is 
    port(
      i_data0 : in  std_logic_vector(31 downto 0);  
      i_data1 : in  std_logic_vector(31 downto 0);  
      i_data2 : in  std_logic_vector(31 downto 0);  
      i_data3 : in  std_logic_vector(31 downto 0);  
      i_sel   : in  std_logic_vector(1 downto 0);   
      o_data  : out std_logic_vector(31 downto 0)   
    );
    end component;

  component mux2to1_5bit is
      port(
          i_S          : in std_logic;
          i_D0         : in std_logic_vector(4 downto 0);
          i_D1         : in std_logic_vector(4 downto 0);
          o_O          : out std_logic_vector(4 downto 0)
      );
      end component;

  component nAdder_Sub is 
    port(
        i_A, i_B: in  std_logic_vector(31 downto 0);       
        i_C : in std_logic;                                 
        i_S : out std_logic_vector(31 downto 0);            
        i_C_out : out std_logic                              
    );
    end component;
    

  component Extender is 
    port(
        i_imm        : in std_logic_vector(15 downto 0);    
        i_sign       : in  std_logic;
        o_O          : out std_logic_vector(31 downto 0)
    );  
    end component;

  component control is 
    port(
        i_Opcode : in std_logic_vector(5 downto 0);
        i_Funct : in std_logic_vector(5 downto 0);
        o_ALUSrc : out std_logic;
        o_ALUControl: out std_logic_vector(3 downto 0);
        o_MemtoReg : out std_logic;
        o_DMemWr : out std_logic;
        o_RegWr : out std_logic;
        o_RegDst : out std_logic;
        o_RegJump   :   out std_logic;
        o_Jump      :   out std_logic;
        o_signExtend:   out std_logic;
        o_overflowEN:   out std_logic;
        o_shiftRegEN:   out std_logic;
        o_BranchBNE :   out std_logic;
        o_JumpLink  :   out std_logic;
        o_halt      :   out std_logic;
        o_memOutSign:   out std_logic;
        o_load      :   out std_logic_vector(1 downto 0);
        o_Branch    :   out std_logic
    );
    end component control;

  component ALU is
      port(
          i_input1    : in std_logic_vector(31 downto 0);
          i_input2    : in std_logic_vector(31 downto 0);
          i_control   : in std_logic_vector(3 downto 0);
          i_overflowEN: in std_logic;
          i_shiftregEN: in std_logic;
          i_shmt      : in std_logic_vector(4 downto 0);
          o_output    : out std_logic_vector(31 downto 0);
          o_overflow  : out std_logic;
          o_zero      : out std_logic
      );
      end component ALU;

  component PC_Module is
      generic(N : integer := 32);
      port(
            i_CLK        : in std_logic;  
            i_RST        : in std_logic;
            i_pc         : in std_logic_vector(N-1 downto 0);
            o_Q          : out std_logic_vector(N-1 downto 0)
            );
      end component;
  
    component Fetchmodule is 
      port(
        i_pc        : in std_logic_vector(31 downto 0);
        i_instruction :  in std_logic_vector(25 downto 0);
        i_imm       : in std_logic_vector(31 downto 0);
        i_branch    : in std_logic; 
        i_zero      : in std_logic; 
        i_jump      : in std_logic; 
        i_RegJump   : in std_logic; 
        i_BNE       : in std_logic; 
        i_rs        : in std_logic_vector(31 downto 0);
        o_pcSrc     : out std_logic; 
        o_pc        : out std_logic_vector(31 downto 0)
      );
      end component Fetchmodule;
  
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

    component xor_32 is 
    port ( 
        i_A : in std_logic_vector(31 downto 0);  
        i_B : in std_logic_vector(31 downto 0);  
        o_F : out std_logic_vector(31 downto 0)  
        );
    end component;

    component xor_2 is 
    port ( 
        i_A : in std_logic;  
        i_B : in std_logic;  
        o_F : out std_logic 
        );
    end component;

    component ZeroFlag is 
    port ( 
        data_in : in std_logic_vector(31 downto 0);
        zero_flag : out std_logic
        );
    end component;

    component mux2to1 is
      port(i_S                  : in std_logic;
           i_D0                 : in std_logic;
           i_D1                 : in std_logic;
           o_O                  : out std_logic);
    end component;

begin

  -- TODO: This is required to be your final input to your instruction memory. This provides a feasible method to externally load the memory module which means that the synthesis tool must assume it knows nothing about the values stored in the instruction memory. If this is not included, much, if not all of the design is optimized out because the synthesis tool will believe the memory to be all zeros.
  with iInstLd select
    s_IMemAddr <= s_NextInstAddr when '0',
      iInstAddr when others;


  IMem: mem
    generic map(ADDR_WIDTH => ADDR_WIDTH,
                DATA_WIDTH => N)
    port map(clk  => iCLK,
             addr => s_IMemAddr(11 downto 2),
             data => iInstExt,
             we   => iInstLd,
             q    => s_Inst);
  
  DMem: mem
    generic map(ADDR_WIDTH => ADDR_WIDTH,
                DATA_WIDTH => N)
    port map(clk  => iCLK,
             addr => s_DMemAddr(11 downto 2),
             data => s_DMemData,
             we   =>  s_DMemWr,
             q    => s_DMemOut);

             s_DMemWr <= s_EXControl(11);

  -- TODO: Ensure that s_Halt is connected to an output control signal produced from decoding the Halt instruction (Opcode: 01 0100)
  -- TODO: Ensure that s_Ovfl is connected to the overflow output of your ALU

  -- TODO: Implement the rest of your processor below this comment! 

  pcSrcSel : mux2t1_N
  port map(
    i_S          => s_pcSrc, --s_WBControl(0)
    i_D0         => s_adder4,
    i_D1         => s_JBSrc,
    o_O          => s_newPC
  );

  PC: PC_Module
    port map(
      i_CLK        => iCLK,
      i_RST        => iRST,
      i_pc         => s_newPC,
      o_Q          => s_NextInstAddr
    );


  adder4: nAdder_Sub
    port map(
      i_A       => s_NextInstAddr,
      i_B       => x"00000004",
      i_C       => '0',
      i_s       => s_adder4,
      i_C_out   => s_overflow1
    );

  IFReg1 : N_Reg
  port map (
    i_CLK        => iCLK,
    i_RST        => iRST,
    i_WE         => '1',
    i_D          => s_Inst,
    o_Q          => s_IFInst
  );

  IFReg2 : N_Reg
  port map (
    i_CLK        => iCLK,
    i_RST        => iRST,
    i_WE         => '1',
    i_D          => s_adder4,
    o_Q          => s_IFPC
  );
  

---------------------------------------------------------------------------------
controlModule: control
port map(
    i_Opcode => s_IFInst (31 downto 26),
    i_Funct => s_IFInst (5 downto 0),
    o_ALUSrc => s_ALUSrc,
    o_ALUControl=> s_ALUControl,
    o_MemtoReg =>  s_memtoReg, 
    o_DMemWr => s_writeDMemEN,
    o_RegWr => s_writeEN,
    o_RegDst => s_RegDst,
    o_RegJump   => s_RegJump,
    o_Jump      => s_jump,
    o_signExtend => s_signExtend,
    o_overflowEN => s_overflowEn,
    o_shiftRegEN => s_shiftRegEn,
    o_BranchBNE  => s_BranchBNE,
    o_JumpLink  => s_JumpLink,
    o_halt      => s_halt,
    o_memOutSign=> s_memOutSign,
    o_load      => s_load,
    o_Branch    => s_branch
);

Fetch: Fetchmodule
port map(
    i_pc          => s_IFPC,
    i_instruction =>  s_IFInst(25 downto 0),
    i_imm       =>  s_extended,
    i_branch    => s_branch, 
    i_zero      => s_zeroFlagBranch , 
    i_jump      => s_jump,
    i_RegJump   => s_RegJump,
    i_BNE       => s_BranchBNE,
    i_rs        => s_rs,
    o_pcSrc     => s_pcSrc,
    o_pc        => s_JBSrc
);

g_xor : xor_32
port MAP(
    i_A => s_rs,
    i_B => s_rt,
    o_F => s_xor 
);


MuxWECheck: mux2to1 
port map(
  i_S      => s_WBControl(10),      
  i_D0     => s_WBControl(8), 
  i_D1     => '0',  
  o_O      => s_MuxWECheck
  );

g_zeroflag : ZeroFlag
port map(
    data_in => s_xor,
    zero_flag => s_zeroFlagBranch 
);

JALen: mux2to1 
port map(
  i_S      => s_JumpLink,      
  i_D0     => s_MuxWECheck, 
  i_D1     => '1',  
  o_O      => s_dummy
  );  

  s_RegWr <= s_WBControl(8);

extenderModule : Extender
port map(
  i_imm        => s_IFInst (15 downto 0), 
  i_sign       => s_signExtend,
  o_O          => s_extended 
);

RegDesMUX : mux2to1_5bit 
port map (
  i_S          => s_WBControl(7),
  i_D0         => s_WBInst(20 downto 16),
  i_D1         => s_WBInst(15 downto 11),
  o_O          => s_rdMUX 
); 

RegDesJALMUX : mux2to1_5bit 
port map (
  i_S          => s_WBControl(10),
  i_D0         => s_rdMUX,
  i_D1         => "11111",
  o_O          => s_RegWrAddr
); 

MainRegister : MIP_REG
port map(
  i_rs =>   s_IFInst(25 downto 21),
  i_rt =>   s_IFInst(20 downto 16),
  i_rd =>   s_RegWrAddr,
  i_d  =>   s_RegWrData,
  i_reset => iRST,
  i_clock => iCLK,
  i_we    => s_RegWr,
  o_D1    => s_rs,
  o_D2    => s_rt
);


IDRegRS : N_Reg
port map (
  i_CLK        => iCLK,
  i_RST        => iRST,
  i_WE         => '1',
  i_D          => s_rs,
  o_Q          => s_IDrs
);

IDRegRT : N_Reg
port map (
  i_CLK        => iCLK,
  i_RST        => iRST,
  i_WE         => '1',
  i_D          => s_rt,
  o_Q          => s_IDrt
);

IDRegExtend : N_Reg
port map (
  i_CLK        => iCLK,
  i_RST        => iRST,
  i_WE         => '1',
  i_D          => s_extended,
  o_Q          => s_IDextended
);

IDRegPC : N_Reg
port map (
  i_CLK        => iCLK,
  i_RST        => iRST,
  i_WE         => '1',
  i_D          => s_IFPC,
  o_Q          => s_IDPC
);

IDRegControl : N_Reg
port map (
  i_CLK        => iCLK,
  i_RST        => iRST,
  i_WE         => '1',
  i_D          =>     s_IFInst(25 downto 21) &     -- [0-4]       27-31 
                      s_ALUSrc &                   -- 5           26
                      s_ALUControl &               -- [6-9]       22- 25
                      s_overflowEN &              -- 10           21
                      s_shiftregEN &              -- 11           20
                      s_BranchBNE  &              -- 12           19
                      s_RegJump    &              -- 13           18
                      s_jump       &              -- 14           17
                      s_branch    &                 -- 15         16
                      s_memtoReg  &                 -- 16         15
                      s_load      &                 -- [17-18]    13-14
                      s_memOutSign &                 -- 19        12
                      s_writeDMemEN    &                   --20        11
                      s_JumpLink &                    -- 21       10
                      s_pcSrc    &                    -- 22       9 
                      s_writeEN  &                     -- 23       8
                      s_RegDst  &                     -- 7
                      (6 downto 0 => '0'),         -- 9 bits padding to reach 32 bits
  o_Q          => s_IDControl 
);

IDRegInst : N_Reg
port map (
  i_CLK        => iCLK,
  i_RST        => iRST,
  i_WE         => '1',
  i_D          => s_IFInst,
  o_Q          => s_IDInst
);

------------------------------------------------------------------------

SourceMUX : mux2t1_N
port map(
  i_S          => s_IDControl(26),
  i_D0         => s_IDrt,
  i_D1         => s_IDextended,
  o_O          => s_ALUin2
);


MainALU : ALU
port map(
  i_input1 => s_IDrs,
  i_input2  => s_ALUin2,
  i_control => s_IDControl(25 downto 22),
  i_overflowEN => s_IDControl(21),
  i_shiftregEN => s_IDControl(20),
  i_shmt  => s_IDInst(10 downto 6),
  o_output => s_ALUDATA,
  o_overflow => s_overflowsignal,
  o_zero => s_zero 
);

EXRegRT : N_Reg
port map (
  i_CLK        => iCLK,
  i_RST        => iRST,
  i_WE         => '1',
  i_D          => s_IDrt,
  o_Q          => s_EXrt
);


EXRegALU : N_Reg
port map (
  i_CLK        => iCLK,
  i_RST        => iRST,
  i_WE         => '1',
  i_D          => s_ALUDATA,
  o_Q          => s_EXalu
);


EXRegControl : N_Reg
port map (
  i_CLK        => iCLK,
  i_RST        => iRST,
  i_WE         => '1',
  i_D          => s_IDControl(31 downto 3) & s_zero & s_overflowsignal &  '0',
  o_Q          => s_EXControl
);

EXRegInst : N_Reg
port map (
  i_CLK        => iCLK,
  i_RST        => iRST,
  i_WE         => '1',
  i_D          => s_IDInst,
  o_Q          => s_EXInst
);

EXRegPC : N_Reg
port map (
  i_CLK        => iCLK,
  i_RST        => iRST,
  i_WE         => '1',
  i_D          => s_IDPC,
  o_Q          => s_EXPC
);
-----------------------------------------------------------------

    s_DMemData <= s_EXrt;
    s_DMemAddr <= s_EXalu;
    oALUOut <= s_EXalu;

  WBRegMEMout : N_Reg
    port map (
      i_CLK        => iCLK,
      i_RST        => iRST,
      i_WE         => '1',
      i_D          => s_DMemOut,
      o_Q          => s_WBDMemOut
    );

  WBRegALU : N_Reg
    port map (
      i_CLK        => iCLK,
      i_RST        => iRST,
      i_WE         => '1',
      i_D          => s_EXalu,
      o_Q          => s_WBalu
    );

  WBRegControl : N_Reg
  port map (
    i_CLK        => iCLK,
    i_RST        => iRST,
    i_WE         => '1',
    i_D          => s_EXControl,
    o_Q          => s_WBControl
  );

  WBRegINST : N_Reg
  port map (
  i_CLK        => iCLK,
  i_RST        => iRST,
  i_WE         => '1',
  i_D          => s_EXInst,
  o_Q          => s_WBInst
  );

  WBRegPC : N_Reg
  port map (
  i_CLK        => iCLK,
  i_RST        => iRST,
  i_WE         => '1',
  i_D          => s_EXPC,
  o_Q          => s_WBPC
);


----------------------------------------------------------

lhModule: lh_module
port map(
  i_data  => s_WBDMemOut,
  i_sel   => s_WBalu (1 downto 0),
  i_sign  => s_WBControl(12),
  o_data  => s_lh_out
);

lbModule: lb_module
port map(
  i_data  => s_WBDMemOut,
  i_sel   => s_WBalu (1 downto 0),
  i_sign  => s_WBControl(12),
  o_data  => s_lb_out
);

dataSelMux: mux4to1_32bit
port map(
    i_data0 => s_lb_out,
    i_data1 => s_lh_out,
    i_data2 => s_WBDMemOut,
    i_data3 =>  x"00000000",
    i_sel   =>  s_WBControl(14 downto 13),
    o_data  =>  s_dataSelMux
);

dataMUX : mux2t1_N
port map(
  i_S          => s_WBControl(15),
  i_D0         => s_WBalu,
  i_D1         => s_dataSelMux,
  o_O          => s_muxMemAlu
);

JumpLinkMUX : mux2t1_N
port map(
  i_S          => s_WBControl(10),
  i_D0         => s_muxMemAlu,
  i_D1         => s_WBPC,
  o_O          => s_RegWrData
);

s_Ovfl <= s_WBControl(1);
end structure;


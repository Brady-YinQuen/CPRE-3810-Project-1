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

  signal s_extended     : std_logic_vector(N-1 downto 0) ;
  signal s_branch       : std_logic ; 
  signal s_zero         : std_logic ; 
  signal s_jump         : std_logic ;
  signal s_RegJump      : std_logic ;
  signal s_ALUSrc       : std_logic;
  signal s_ALUControl   : std_logic_vector(3 downto 0);
  signal s_memtoReg     : std_logic;
  signal s_RegDst       : std_logic;
  signal s_signExtend   : std_logic := '0' ;
  signal s_overflowEN   : std_logic;
  signal s_shiftregEN   : std_logic;

  signal s_ALUDATA : std_logic_vector(N-1 downto 0) ;

  signal s_rdMUX : std_logic_vector(4 downto 0);
  


  signal s_rt : std_logic_vector(N-1 downto 0) ;
  signal s_rs : std_logic_vector(N-1 downto 0) ;



  signal s_ALUin2 : std_logic_vector(N-1 downto 0) ;



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
        o_halt      :   out std_logic;
        o_Branch    :   out std_logic
    );
    end component control;

  
  component Fetchmodule is 
    port(
        i_CLK : in std_logic;  
        i_RST : in std_logic;
        i_instruction :  in std_logic_vector(25 downto 0);
        i_imm       :  in std_logic_vector(31 downto 0);
        i_branch    : in std_logic; 
        i_zero      : in std_logic; 
        i_jump      : in std_logic; 
        i_RegJump   : in std_logic; 
        i_rs        : in std_logic_vector(31 downto 0);
        o_pc        : out std_logic_vector(31 downto 0)
    );
    end component Fetchmodule;

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
            -- oALUOut <= s_Inst;
  
  DMem: mem
    generic map(ADDR_WIDTH => ADDR_WIDTH,
                DATA_WIDTH => N)
    port map(clk  => iCLK,
             addr => s_DMemAddr(11 downto 2),
             data => s_DMemData,
             we   => s_DMemWr,
             q    => s_DMemOut);

  Fetch: Fetchmodule
    port map(
        i_CLK => iCLK, 
        i_RST => iRST,
        i_instruction =>  s_Inst (25 downto 0),
        i_imm       =>   s_extended,
        i_branch    => s_branch, 
        i_zero      => s_zero , 
        i_jump      => s_jump,
        i_RegJump   => s_RegJump,
        i_rs        => s_rs,
        o_pc        => s_NextInstAddr
    );

  controlModule: control
    port map(
        i_Opcode => s_Inst (31 downto 26),
        i_Funct => s_Inst (5 downto 0),
        o_ALUSrc => s_ALUSrc,
        o_ALUControl=> s_ALUControl,
        o_MemtoReg =>  s_memtoReg, 
        o_DMemWr => s_DMemWr,
        o_RegWr => s_RegWr,
        o_RegDst => s_RegDst,
        o_RegJump   => s_RegJump,
        o_Jump      => s_jump,
        o_signExtend => s_signExtend,
        o_overflowEN => s_overflowEn,
        o_shiftRegEN => s_shiftRegEn,
        o_halt      => s_halt,
        o_Branch    => s_branch
    );

    extenderModule : Extender
      port map(
        i_imm        => s_Inst (15 downto 0), 
        i_sign       => s_signExtend,
        o_O          => s_extended 
      );

    SourceMUX : mux2t1_N
      port map(
        i_S          => s_ALUSrc,
        i_D0         => s_rt,
        i_D1         => s_extended,
        o_O          => s_ALUin2
      );
    
    RegDesMUX : mux2to1_5bit 
    port map (
      i_S          => s_RegDst,
      i_D0         => s_Inst(20 downto 16),
      i_D1         => s_Inst(15 downto 11),
      o_O          => s_RegWrAddr
    ); 

    MainRegister : MIP_REG
      port map(
        i_rs =>   s_Inst(25 downto 21),
        i_rt =>   s_Inst(20 downto 16),
        i_rd =>   s_RegWrAddr,
        i_d  =>   s_RegWrData,
        i_reset => iRST,
        i_clock => iCLK,
        i_we    => s_RegWr,
        o_D1    => s_rs,
        o_D2    => s_rt
      );

    MainALU : ALU
    port map(
      i_input1 => s_rs,
      i_input2  => s_ALUin2,
      i_control => s_ALUControl,
      i_overflowEN => s_overflowEN,
      i_shiftregEN => s_shiftregEN,
      i_shmt  => s_Inst(10 downto 6),
      o_output => s_ALUDATA,
      o_overflow => s_Ovfl,
      o_zero => s_zero 
    );


    dataMUX : mux2t1_N
    port map(
      i_S          => s_memtoReg,
      i_D0         => s_ALUDATA,
      i_D1         => s_DMemOut,
      o_O          => s_RegWrData
    );



    oALUOut <= s_ALUDATA;


  -- TODO: Ensure that s_Halt is connected to an output control signal produced from decoding the Halt instruction (Opcode: 01 0100)
  -- TODO: Ensure that s_Ovfl is connected to the overflow output of your ALU

  -- TODO: Implement the rest of your processor below this comment! 

end structure;

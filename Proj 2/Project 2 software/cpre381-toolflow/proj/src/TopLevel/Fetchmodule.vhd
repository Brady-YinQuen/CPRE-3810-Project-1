library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Fetchmodule is 
    port (
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
    end Fetchmodule;

    architecture structural of Fetchmodule is 
        component nAdder_Sub is 
            port(
                i_A, i_B: in  std_logic_vector(31 downto 0);       -- Input signals
                i_C : in std_logic;                                 -- Input Carry
                i_S : out std_logic_vector(31 downto 0);            -- Output Sum
                i_C_out : out std_logic                              -- Output Carry
            );
            end component;

        component SLL26bTo28b is
            port(
                i_input       : in std_logic_vector(25 downto 0);    
                o_output      : out std_logic_vector(27 downto 0)
            );
            end component;

        component SLL2_32bit is
            port(
                i_input       : in std_logic_vector(31 downto 0);    
                o_output      : out std_logic_vector(31 downto 0)
            );
            end component;

        component Append is 
            port(
                i_input1       : in std_logic_vector(27 downto 0);    
                i_input2       : in std_logic_vector(31 downto 0);
                o_output      : out std_logic_vector(31 downto 0)
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

        component andg2 is
            port(
                i_A          : in std_logic;
                i_B          : in std_logic;
                o_F          : out std_logic
            );
            end component;

        component invg is 
            port (
                i_A          : in std_logic;
                o_F          : out std_logic
            );
            end component;
        
        component xor_32 is 
            port ( 
                i_A : in std_logic_vector(31 downto 0);  
                i_B : in std_logic_vector(31 downto 0);  
                o_F : out std_logic_vector(31 downto 0)  
                );
            end component;

        component ZeroFlag is 
            port ( 
                data_in : in std_logic_vector(31 downto 0);
                zero_flag : out std_logic
                );
            end component;
            

            signal s_sll26  : std_logic_vector(27 downto 0);
            signal s_append : std_logic_vector(31 downto 0);
            signal s_sll32 : std_logic_vector(31 downto 0);
            signal s_adderbranch : std_logic_vector(31 downto 0);
            signal s_branchmux :  std_logic_vector(31 downto 0);
            signal s_and : std_logic;
            signal s_andbne : std_logic;
            signal s_jumpmux: std_logic_vector(31 downto 0);
            signal s_overflow1 : std_logic;
            signal s_overflow2 : std_logic;
            signal s_inv : std_logic;
            signal s_branchmuxbne :std_logic_vector(31 downto 0);
            signal s_branchMaster :std_logic_vector(31 downto 0); 
            signal s_output :std_logic_vector(31 downto 0); 
            signal s_xor :std_logic_vector(31 downto 0); 
            signal s_zeroFlag : std_logic;
          

        



            begin

            g_SLL26bit : SLL26bTo28b
            port MAP(
                i_input     =>  i_instruction,
                o_output    =>  s_sll26
            );
            

            g_append : Append
            port MAP(
                i_input1 => s_sll26, 
                i_input2 => i_pc,
                o_output => s_append
            );

            g_sll32 : SLL2_32bit
            port MAP(
                i_input => i_imm,
                o_output => s_sll32
            );

            g_adder :  nAdder_Sub
            port MAP(
                i_A => i_pc,
                i_B => s_sll32,
                i_C => '0',
                i_s => s_adderbranch,
                i_C_out => s_overflow2
            );

            g_and : andg2 
            port MAP(
                i_A => i_branch,
                i_B => i_zero,
                o_F => s_and 
            );

            g_MuxBranch : mux2t1_N
            port MAP(
                i_S => s_and,
                i_D0 => i_pc,
                i_D1 => s_adderbranch,
                o_O => s_branchmux
            );
            
            g_inv : invg
            port MAP(
                i_A  =>  i_zero,
                o_F  =>  s_inv
            );

            g_andBNE : andg2 
            port MAP(
                i_A => i_branch,
                i_B => s_inv,
                o_F => s_andbne  
            );

            g_MuxBNE : mux2t1_N
            port MAP(
                i_S => s_andbne,
                i_D0 => i_pc,
                i_D1 => s_adderbranch,
                o_O => s_branchmuxbne
            );

            g_MuxBranchMaster : mux2t1_N
            port MAP(
                i_S => i_BNE,
                i_D0 => s_branchmux,
                i_D1 => s_branchmuxbne,
                o_O => s_branchMaster
            );

            g_muxjump : mux2t1_N
            port MAP(
                i_S => i_jump,
                i_D0 => s_branchMaster,
                i_D1 => s_append,
                o_O => s_jumpmux
            );

            g_RegJump : mux2t1_N
            port MAP(
                i_S => i_RegJump,
                i_D0 => s_jumpmux,
                i_D1 => i_rs,
                o_O => s_output 
            );

            g_xor : xor_32
            port MAP(
                i_A => i_pc,
                i_B => s_output,
                o_F => s_xor 
            );

            g_zeroflag : ZeroFlag
            port map(
                data_in => s_xor,
                zero_flag => s_zeroFlag
            );

            g_invzero : invg
            port MAP(
                i_A  =>  s_zeroFlag,
                o_F  =>  o_pcSrc
            );
    
            o_pc <= s_output;

            end architecture structural;

        
        

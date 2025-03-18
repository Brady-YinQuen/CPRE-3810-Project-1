library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Fetchmodule is 
    port (
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

        component N_Reg is
            port (
                i_CLK        : in std_logic;  
                i_RST        : in std_logic;
                i_WE         : in std_logic;
                i_D          : in std_logic_vector(31 downto 0);
                o_Q          : out std_logic_vector(31 downto 0)
            );
            end component;
            
            signal s_pc_in : std_logic_vector(31 downto 0);
            signal s_pc_out : std_logic_vector(31 downto 0) := x"00400000";
            signal s_adder4 : std_logic_vector(31 downto 0);
            signal s_sll26  : std_logic_vector(27 downto 0);
            signal s_append : std_logic_vector(31 downto 0);
            signal s_sll32 : std_logic_vector(31 downto 0);
            signal s_adderbranch : std_logic_vector(31 downto 0);
            signal s_branchmux :  std_logic_vector(31 downto 0);
            signal s_and : std_logic;
            signal s_jumpmux: std_logic_vector(31 downto 0);
            signal s_overflow1 : std_logic;
            signal s_overflow2 : std_logic;
            signal s_newpc: std_logic_vector(31 downto 0);

        



            begin

            g_pcMux : mux2t1_N
            port MAP(
                i_S => i_RST,
                i_D0 => s_newpc,
                i_D1 => x"00400000",  -- initial PC value 
                o_O => s_pc_in
            );
             
            g_pc : N_Reg
            port MAP(
                i_CLK        =>  i_CLK, 
                i_RST        =>  '0',
                i_WE         =>  '1',
                i_D          => s_pc_in,
                o_Q          => s_pc_out
            );

            g_add4 : nAdder_Sub 
            port MAP(
                i_A => s_pc_out,
                i_B => x"00000004",
                i_C => '0',
                i_s => s_adder4,
                i_C_out => s_overflow1
            );

            g_SLL26bit : SLL26bTo28b
            port MAP(
                i_input     =>  i_instruction,
                o_output    =>  s_sll26
            );

            g_append : Append
            port MAP(
                i_input1 => s_sll26, 
                i_input2 => s_adder4,
                o_output => s_append
            );

            g_sll32 : SLL2_32bit
            port MAP(
                i_input => i_imm,
                o_output => s_sll32
            );

            g_adder :  nAdder_Sub
            port MAP(
                i_A => s_adder4,
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
                i_D0 => s_adder4,
                i_D1 => s_adderbranch,
                o_O => s_branchmux
            );

            g_muxjump : mux2t1_N
            port MAP(
                i_S => i_jump,
                i_D0 => s_branchmux,
                i_D1 => s_append,
                o_O => s_jumpmux
            );

            g_RegJump : mux2t1_N
            port MAP(
                i_S => i_RegJump,
                i_D0 => s_jumpmux,
                i_D1 => i_rs,
                o_O => s_newpc
            );

                o_pc <= s_pc_out;

            end architecture structural;

        
        

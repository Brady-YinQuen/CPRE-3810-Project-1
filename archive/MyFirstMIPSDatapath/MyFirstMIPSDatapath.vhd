library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.my_package.all;

entity MyFirstMIPSDatapath is
    port (
        i_rs : in std_logic_vector(4 downto 0);
        i_rt : in std_logic_vector(4 downto 0);
        i_rd : in std_logic_vector(4 downto 0);
        i_reset : in std_logic;  
        i_clock : in std_logic;  
        i_we    : in std_logic; 
        i_C : in std_logic;   -- this is to select add or sub 
        i_imm: in  std_logic_vector(31 downto 0);
        i_ALUSrc : in std_logic;
        o_OF : out std_logic;
	o_ALU_debug: out std_logic_vector(31 downto 0)
    );
    end MyFirstMIPSDatapath;

    architecture structural of MyFirstMIPSDatapath is
        component addsub_i is 
            port(
                i_A, i_B, i_imm: in  std_logic_vector(31 downto 0);
                i_C : in std_logic;   
                i_ALUSrc : in std_logic;   
                i_S : out std_logic_vector(31 downto 0);
                i_C_out : out std_logic  
            );
            end component;

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

        signal s_reg_rs : std_logic_vector(31 downto 0);
        signal s_reg_rt : std_logic_vector(31 downto 0);
        signal s_d :  std_logic_vector(31 downto 0);



        begin 
        g_mipReg : MIP_REG
        port MAP(
            i_rs => i_rs,
            i_rt => i_rt,
            i_rd => i_rd,
            i_d  => s_d,
            i_reset => i_reset,
            i_clock => i_clock,
            i_we    => i_we,
            o_D1    => s_reg_rs,
            o_D2    => s_reg_rt 
        );

        g_addsub : addsub_i
        port MAP(
            i_A => s_reg_rs,
            i_B => s_reg_rt, 
            i_imm => i_imm,
            i_C => i_C,
            i_ALUSrc => i_ALUSrc,
            i_S => s_d,
            i_C_out => o_OF
        );

o_ALU_debug <= s_d;
	
	


        end architecture structural;
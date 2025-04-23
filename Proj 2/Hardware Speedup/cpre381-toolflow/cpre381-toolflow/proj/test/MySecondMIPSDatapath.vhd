library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.my_package.all;

entity MySecondMIPSDatapath is
    port (
        i_rs : in std_logic_vector(4 downto 0);
        i_rt : in std_logic_vector(4 downto 0);
        i_rd : in std_logic_vector(4 downto 0);
        i_reset : in std_logic;  
        i_clock : in std_logic;  
        i_we    : in std_logic; 
        i_addsub_en : in std_logic;   -- this is to select add or sub 
        i_imm: in  std_logic_vector(15 downto 0);
        i_ALUSrc : in std_logic;
        i_sw_en : in std_logic;
        i_sign_ext : in std_logic;
        i_memToReg_en : in std_logic;
        o_OF : out std_logic;
	    o_ALU_debug: out std_logic_vector(31 downto 0)
    );
    end MySecondMIPSDatapath;


    architecture structural of MySecondMIPSDatapath is 
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


    component mux2t1_N is
    port(
        i_S          : in std_logic;
        i_D0         : in std_logic_vector(31 downto 0);
        i_D1         : in std_logic_vector(31 downto 0);
        o_O          : out std_logic_vector(31 downto 0)
    );
    end component;

    component Extender is 
    port(
        i_imm        : in std_logic_vector(15 downto 0);    
        i_sign       : in  std_logic;
        o_O          : out std_logic_vector(31 downto 0)
    );  
    end component;

    component mem is
    port 
	(
		clk		: in std_logic;
		addr	: in std_logic_vector(9 downto 0);
		data	: in std_logic_vector(31 downto 0);
		we		: in std_logic := '1';
		q		: out std_logic_vector(31 downto 0)
	);
    end component;

    signal s_reg_rs : std_logic_vector(31 downto 0);
    signal s_reg_rt : std_logic_vector(31 downto 0);
    signal s_d :  std_logic_vector(31 downto 0);
    signal s_d3 : std_logic_vector(31 downto 0);
    signal s_d2 :  std_logic_vector(31 downto 0);
    signal s_extendedIMM :  std_logic_vector(31 downto 0);


    begin 
    g_mipReg : MIP_REG
    port MAP(
        i_rs => i_rs,
        i_rt => i_rt,
        i_rd => i_rd,
        i_d  => s_d2,
        i_reset => i_reset,
        i_clock => i_clock,
        i_we    => i_we,
        o_D1    => s_reg_rs,
        o_D2    => s_reg_rt 
    );

    g_extender: Extender
    port MAP(
        i_imm        => i_imm,
        i_sign       => i_sign_ext,
        o_O          => s_extendedIMM
    );


    g_addsub : addsub_i
    port MAP(
        i_A => s_reg_rs,
        i_B => s_reg_rt, 
        i_imm => s_extendedIMM,
        i_C =>  i_addsub_en,
        i_ALUSrc => i_ALUSrc,
        i_S => s_d,
        i_C_out => o_OF
    );

    g_mem : mem
    port MAP(
        clk	=> i_clock,
	addr	=>   s_d(9 downto 0),
	data	=> s_reg_rt, 
	we	=> i_sw_en,
	q	=> s_d3
    );

    mux_data_sel : mux2t1_N
    port MAP(
        i_S  => i_memToReg_en,
        i_D0 => s_d,
        i_D1 => s_d3,
        o_O => s_d2
    );


    o_ALU_debug <= s_d;

    end architecture structural;


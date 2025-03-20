library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.control_package.all;

entity ALU is
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
    end ALU;

    architecture structural of ALU is
        
        component mux2to1_N is
            port(
                i_S          : in std_logic;
                i_D0         : in std_logic_vector(31 downto 0);
                i_D1         : in std_logic_vector(31 downto 0);
                o_O          : out std_logic_vector(31 downto 0)
            );
            end component;
        
        component N_decoder is 
            port(
                i_sel : in std_logic_vector(4 downto 0);
                o_O   : out std_logic_vector(31 downto 0)
            );
            end component; 
        
        component Shifter is 
            port(
                i_shiftamount: in std_logic_vector(31 downto 0);
                i_data: in std_logic_vector(31 downto 0);
                i_shiftleft: in std_logic;
                i_arithmetic: in std_logic;
                o_data: out std_logic_vector(31 downto 0)
            );
            end component;
        
        component nAdder_Sub is 
            port(
                i_A, i_B: in  std_logic_vector(31 downto 0);       -- Input signals
                i_C : in std_logic;                                 -- Input Carry
                i_S : out std_logic_vector(31 downto 0);            -- Output Sum
                i_C_out : out std_logic                              -- Output Carry
            );
            end component;
        
        component OnesComp is
            port(
                i_A : in std_logic_vector(31 downto 0);
                o_F : out std_logic_vector(31 downto 0)
                );
            end component;
        
        component andg2 is
            port(
                i_A          : in std_logic;
                i_B          : in std_logic;
                o_F          : out std_logic
                );
            end component;

        component ZeroFlag is 
            port ( 
                data_in : in std_logic_vector(31 downto 0);
                zero_flag : out std_logic
                );
            end component;

        component and_32 is 
            port ( 
                i_A : in std_logic_vector(31 downto 0);  
                i_B : in std_logic_vector(31 downto 0);  
                o_F : out std_logic_vector(31 downto 0)  
                );
            end component;

        component or_32 is 
            port ( 
                i_A : in std_logic_vector(31 downto 0);  
                i_B : in std_logic_vector(31 downto 0);  
                o_F : out std_logic_vector(31 downto 0)  
                );
            end component;

        component xor_32 is 
            port ( 
                i_A : in std_logic_vector(31 downto 0);  
                i_B : in std_logic_vector(31 downto 0);  
                o_F : out std_logic_vector(31 downto 0)  
                );
            end component;
        
        component mux16t1_32bit is 
            port(
                i_d : in mux_bus_control;
                i_s : in std_logic_vector(3 downto 0);
                o_O : out std_logic_vector(31 downto 0)
                );
            end component;
        
        


        signal s_extender : std_logic_vector(31 downto 0);  
        signal s_overflow : std_logic; 
        signal s_adderOutput : std_logic_vector(31 downto 0); 
        signal s_and :  std_logic_vector(31 downto 0); 
        signal s_or :  std_logic_vector(31 downto 0); 
        signal s_nor:   std_logic_vector(31 downto 0); 
        signal s_xor :  std_logic_vector(31 downto 0); 
        signal s_decoder : std_logic_vector(31 downto 0); 
        signal s_shiftamount: std_logic_vector(31 downto 0); 
        signal s_shifter: std_logic_vector(31 downto 0); 
        signal s_output : std_logic_vector(31 downto 0); 

        signal s_mux_input : mux_bus_control;

        
        
    
    begin
        s_mux_input(0) <= s_and;
        s_mux_input(1) <= s_or;
        s_mux_input(2) <= s_adderOutput;
        s_mux_input(3) <= s_adderOutput;
        s_mux_input(7) <= std_logic_vector(shift_right(unsigned(s_adderOutput), 31));
        s_mux_input(8) <= s_shifter;
        s_mux_input(10) <= s_shifter;
        s_mux_input(11) <= s_shifter;
        s_mux_input(12) <= s_nor;
        s_mux_input(14) <= std_logic_vector(shift_left(unsigned(i_input2), 16));
        s_mux_input(15) <= s_xor;


        g_adder :  nAdder_Sub
        port MAP(
            i_A => i_input1,
            i_B => i_input2,
            i_C => i_control(0),
            i_s => s_adderOutput,
            i_C_out => s_overflow
        );

        g_overflow : andg2 
        port MAP(
            i_A => s_overflow,
            i_B => i_overflowEN,
            o_F => o_overflow
        );

        g_and : and_32
        port MAP(
            i_A => i_input1,
            i_B => i_input2,
            o_F => s_and 
        );

        g_or : or_32
        port MAP(
            i_A => i_input1,
            i_B => i_input2,
            o_F => s_or 
        );
        g_xor : xor_32
        port MAP(
            i_A => i_input1,
            i_B => i_input2,
            o_F => s_xor 
        );

        g_nor : OnesComp 
        port MAP(
            i_A => s_or,
            o_F => s_nor
        );

        g_decoder : N_decoder
        port MAP(
            i_sel => i_shmt,
            o_O   => s_decoder
        );

        g_MuxShift : mux2to1_N
        port MAP(
            i_S =>  i_shiftregEN,
            i_D0 => s_decoder,
            i_D1 => i_input2,
            o_O => s_shiftamount 
        );

        g_shifter : Shifter
        port map(
            i_shiftamount   => s_shiftamount,
            i_data          => i_input1,
            i_shiftleft     => i_control(1),
            i_arithmetic    => i_control(0),
            o_data          => s_shifter
        );

        g_bigmux : mux16t1_32bit
        port map(
            i_d => s_mux_input,
            i_s => i_control,
            o_O => s_output
        );

        g_zeroflag : ZeroFlag
        port map(
            data_in => s_output,
            zero_flag => o_zero
        );

        o_output <= s_output;




    
    end structural ; -- structural
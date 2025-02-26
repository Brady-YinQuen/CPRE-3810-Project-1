library IEEE;
use IEEE.std_logic_1164.all;
use work.my_package.all;


entity MyFirstMIPSDatapath_tb is
    generic(gCLK_HPER   : time := 10 ns);
end entity MyFirstMIPSDatapath_tb;


architecture behavior of MyFirstMIPSDatapath_tb  is
    constant cCLK_PER  : time := gCLK_HPER * 2;
    component MyFirstMIPSDatapath is
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
        end component MyFirstMIPSDatapath;

        signal s_rs :  std_logic_vector(4 downto 0);
        signal s_rt :  std_logic_vector(4 downto 0);
        signal s_rd :  std_logic_vector(4 downto 0);
        signal s_reset  :  std_logic;  
        signal s_clock  :  std_logic;  
        signal s_we     :  std_logic;
        signal s_C      :  std_logic;
        signal s_imm    :  std_logic_vector(31 downto 0);
        signal s_ALUSrc :  std_logic;
        signal s_OF     :  std_logic;
	signal s_ALU_debug:  std_logic_vector(31 downto 0);


begin
    g_mip_alu: MyFirstMIPSDatapath
    port Map(
        i_rs => s_rs,
        i_rt => s_rt,
        i_rd => s_rd,
        i_reset => s_reset,
        i_clock => s_clock,  
        i_we    => s_we,
        i_C     => s_C,
        i_imm   => s_imm,
        i_ALUSrc  => s_ALUSrc,  
        o_OF      => s_OF,
	o_ALU_debug => s_ALU_debug
    );


    stimulus_process: process
    begin
        s_clock <= '0';
        wait for gCLK_HPER;
        s_clock <= '1';
        wait for gCLK_HPER;
    end process;


    simulation: process
    begin

        s_reset <= '1';
        wait for cCLK_PER;
        s_reset <= '0';
        wait for cCLK_PER;
	



    -- case 1: 
        s_rs <= "00000";
        s_rt <= "00000";
        s_rd <= "00001";
        s_we    <= '1';
        s_C     <= '0';
        s_imm   <=  x"00000001";
        s_ALUSrc  <= '1';  
	wait for cCLK_PER;
    -- case 2: 
        s_rs <= "00000";
        s_rt <= "00000";
        s_rd <= "00010";
        s_we    <= '1';
        s_C     <= '0';
        s_imm   <=  x"00000002";
        s_ALUSrc  <= '1';  
	wait for cCLK_PER;
    -- case 3: 
        s_rs <= "00000";
        s_rt <= "00000";
        s_rd <= "00011";
        s_we    <= '1';
        s_C     <= '0';
        s_imm   <=  x"00000003";
        s_ALUSrc  <= '1';  
	wait for cCLK_PER;
    -- case 4: 
        s_rs <= "00000";
        s_rt <= "00000";
        s_rd <= "00100";
        s_we    <= '1';
        s_C     <= '0';
        s_imm   <=  x"00000004";
        s_ALUSrc  <= '1';  
	wait for cCLK_PER;
    -- case 5: 
        s_rs <= "00000";
        s_rt <= "00000";
        s_rd <= "00101";
        s_we    <= '1';
        s_C     <= '0';
        s_imm   <=  x"00000005";
        s_ALUSrc  <= '1';  
	wait for cCLK_PER;
    -- case 6: 
        s_rs <= "00000";
        s_rt <= "00000";
        s_rd <= "00110";
        s_we    <= '1';
        s_C     <= '0';
        s_imm   <=  x"00000006";
        s_ALUSrc  <= '1';  
	wait for cCLK_PER;
    -- case 7: 
        s_rs <= "00000";
        s_rt <= "00000";
        s_rd <= "00111";
        s_we    <= '1';
        s_C     <= '0';
        s_imm   <=  x"00000007";
        s_ALUSrc  <= '1';  
	wait for cCLK_PER;
    -- case 8: 
        s_rs <= "00000";
        s_rt <= "00000";
        s_rd <= "01000";
        s_we    <= '1';
        s_C     <= '0';
        s_imm   <=  x"00000008";
        s_ALUSrc  <= '1';  
	wait for cCLK_PER;
    -- case 9: 
        s_rs <= "00000";
        s_rt <= "00000";
        s_rd <= "01001";
        s_we    <= '1';
        s_C     <= '0';
        s_imm   <=  x"00000009";
        s_ALUSrc  <= '1';  
	wait for cCLK_PER;
    -- case 10: 
        s_rs <= "00000";
        s_rt <= "00000";
        s_rd <= "01010";
        s_we    <= '1';
        s_C     <= '0';
        s_imm   <=  x"0000000A";
        s_ALUSrc  <= '1';  
	wait for cCLK_PER;

    -- case 11: output should be 3
        s_rs <= "00001";
        s_rt <= "00010";
        s_rd <= "01011";
        s_we    <= '1';
        s_C     <= '0';
        s_imm   <=  x"00000000";
        s_ALUSrc  <= '0';  
	wait for cCLK_PER;
    -- case 12: output should be  0
        s_rs <= "01011";
        s_rt <= "00011";
        s_rd <= "01100";
        s_we    <= '1';
        s_C     <= '1';
        s_imm   <=  x"00000000";
        s_ALUSrc  <= '0';  
	wait for cCLK_PER;
    -- case 13: output should be  4
        s_rs <= "01100";
        s_rt <= "00100";
        s_rd <= "01101";
        s_we    <= '1';
        s_C     <= '0';
        s_imm   <=  x"00000000";
        s_ALUSrc  <= '0';  
	wait for cCLK_PER;
    -- case 14: output should be  -1
        s_rs <= "01101";
        s_rt <= "00101";
        s_rd <= "01110";
        s_we    <= '1';
        s_C     <= '1';
        s_imm   <=  x"00000000";
        s_ALUSrc  <= '0';  
	wait for cCLK_PER;
    -- case 15: output should be  -1 + 6 = 5
        s_rs <= "01110";
        s_rt <= "00110";
        s_rd <= "01111";
        s_we    <= '1';
        s_C     <= '0';
        s_imm   <=  x"00000000";
        s_ALUSrc  <= '0';  
	wait for cCLK_PER;
    -- case 16: output should be   5 - 7 = -2
        s_rs <= "01111";
        s_rt <= "00111";
        s_rd <= "10000";
        s_we    <= '1';
        s_C     <= '1';
        s_imm   <=  x"00000000";
        s_ALUSrc  <= '0';  
	wait for cCLK_PER;
    -- case 17: output should be   -2 + 8 = 6
        s_rs <= "10000";
        s_rt <= "01000";
        s_rd <= "10001";
        s_we    <= '1';
        s_C     <= '0';
        s_imm   <=  x"00000000";
        s_ALUSrc  <= '0';  
	wait for cCLK_PER;
    -- case 18: output should be   6 - 9 = -3
        s_rs <= "10001";
        s_rt <= "01001";
        s_rd <= "10010";
        s_we    <= '1';
        s_C     <= '1';
        s_imm   <=  x"00000000";
        s_ALUSrc  <= '0';  
	wait for cCLK_PER;
    -- case 19: output should be   -3 + 10 = 7
        s_rs <= "10010";
        s_rt <= "01010";
        s_rd <= "10011";
        s_we    <= '1';
        s_C     <= '0';
        s_imm   <=  x"00000000";
        s_ALUSrc  <= '0';  
	wait for cCLK_PER;
    -- case 20: output should be   -35  
        s_rs <= "00000";
        s_rt <= "00000";
        s_rd <= "10100";
        s_we    <= '1';
        s_C     <= '1';
        s_imm   <=  x"00000023";
        s_ALUSrc  <= '1';  
	wait for cCLK_PER;
    -- case 21: output should be   7 - 35 = -28  
        s_rs <= "10011";
        s_rt <= "10100";
        s_rd <= "10101";
        s_we    <= '1';
        s_C     <= '0';
        s_imm   <=  x"00000023";
        s_ALUSrc  <= '0';  
	wait for cCLK_PER;






	










    end process;



end architecture behavior ; 
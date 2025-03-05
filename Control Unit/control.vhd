library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all; 

entity control is
    port(
        i_Opcode : in std_logic_vector(5 downto 0);
        o_ALUSrc : out std_logic;
        o_ALUOp: out std_logic_vector(1 downto 0);
        o_MemtoReg : out std_logic;
        o_DMemWr : out std_logic;
        o_RegWr : out std_logic;
        o_RegDst : out std_logic;
    );
end control;

architecture dataflow of control is
begin


ALUSrc <= '1' when  opcode = "001000" or  -- addi
                    opcode = "001001" or  -- addiu
                    opcode = "001100" or  -- andi
                    opcode = "001111" or  -- lui
                    opcode = "100011" or  -- lw
                    opcode = "001110" or  -- xori
                    opcode = "001101" or  -- ori
                    opcode = "001010" or  -- slti
                    opcode = "101011" or  -- sw
                    opcode = "100000" or  -- lb
                    opcode = "100001" or  -- lh
                    opcode = "100100" or  -- lbu
                    opcode = "100101" else -- lhu
                    '0';

ALUOp  <= "10"    when opcode = "000000" else -- R-type 
          "00"    when opcode = "101011" or   -- sw        
                  when opcode = "100000" or   -- lb       
                  when opcode = "100001" or   -- lh   
                  when opcode = "100100" or   -- lbu   
                  when opcode = "100101" or   -- lhu
                  when opcode = "100011" else   -- lw      
          "01"    when opcode = "000100" or     -- beq
                  when opcode = "000101" else   --bne
                  "11"


MemtoReg <= '1' when    opcode = "100011" or  -- lw
                        opcode = "100000" or  -- lb
                        opcode = "100001" or  -- lh
                        opcode = "100100" or  -- lbu
                        opcode = "100101" else -- lhu
                        '0';

DMemWr <= '1' when      opcode = "101011" else -- sw
                        '0';

RegWr <= '1' when   opcode = "001000" or  -- addi
                    opcode = "000000" or  -- R-type (add, addu, and, or, etc.)
                    opcode = "001001" or  -- addiu
                    opcode = "001100" or  -- andi
                    opcode = "001111" or  -- lui
                    opcode = "100011" or  -- lw
                    opcode = "001110" or  -- xori
                    opcode = "001101" or  -- ori
                    opcode = "001010" or  -- slti
                    opcode = "100000" or  -- lb
                    opcode = "100001" or  -- lh
                    opcode = "100100" or  -- lbu
                    opcode = "100101" or  -- lhu
                    opcode = "000011" else -- jal
                    '0';

RegDst <= '1' when opcode = "000000" else -- R-type (add, addu, and, or, etc.)
'0';

end dataflow;
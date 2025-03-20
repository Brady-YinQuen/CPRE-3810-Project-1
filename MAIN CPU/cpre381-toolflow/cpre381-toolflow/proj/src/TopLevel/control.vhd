library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all; 

entity control is
    port(
        i_Opcode    :   in std_logic_vector(5 downto 0);
        i_Funct     :   in std_logic_vector(5 downto 0);
        o_ALUSrc    :   out std_logic;
        o_ALUControl:   out std_logic_vector(3 downto 0);
        o_MemtoReg  :   out std_logic;
        o_DMemWr    :   out std_logic;
        o_RegWr     :   out std_logic;
        o_RegDst    :   out std_logic;
        o_RegJump   :   out std_logic;
        o_Jump      :   out std_logic;
        o_signExtend:   out std_logic;
        o_overflowEN:   out std_logic;
        o_shiftRegEN:   out std_logic;
        o_BranchBNE :   out std_logic;
        o_halt      :   out std_logic;
        o_Branch    :   out std_logic
    );
end control;

architecture dataflow of control is
begin

o_signExtend <= '0' when   -- i_Opcode = "001001" or                           -- addiu
                            (i_Opcode = "000000" and i_Funct = "100001") or --addu
                            (i_Opcode = "000000" and i_Funct = "100011") or 
                            (i_Opcode = "000000" and i_Funct = "100110") or -- xor
                            i_Opcode = "001110" or  -- xori
                             i_Opcode = "100100" or 
                             i_Opcode = "100101" or 
                             i_Opcode = "001101" or  -- ori
                             i_Opcode = "001100" or  -- andi
                             i_Opcode = "100101" else 
                             '1';

o_overflowEN <= '0' when   i_Opcode = "001001" or 
                            (i_Opcode = "000000" and i_Funct ="100111") or -- nor
                            (i_Opcode = "000000" and i_Funct = "100001") or --addu
                            (i_Opcode = "000000" and i_Funct = "100011") or 
                            (i_Opcode = "000000" and i_Funct = "100100") or -- and
                            (i_Opcode = "000000" and i_Funct = "100101") or -- or
                            i_Opcode = "100100" or 
                            i_Opcode = "100101" or 
                            (i_Opcode = "000000" and i_Funct = "100110") or -- xor
                            i_Opcode = "001110" or  -- xori
                            i_Opcode = "001101" or  -- ori
                            i_Opcode = "100101" else 
                            '1';
o_shiftRegEN <= '1' when   (i_Opcode = "000000" and i_Funct = "000100") or 
                            (i_Opcode = "000000" and i_Funct = "000110") or 
                            (i_Opcode = "000000" and i_Funct = "000111") else 
                            '0';


o_BranchBNE <= '1' when     i_Opcode = "000101" else -- bne        
                            '0';                


                           

o_ALUSrc <= '1' when  i_Opcode = "001000" or  -- addi
                    i_Opcode = "001001" or  -- addiu
                    i_Opcode = "001100" or  -- andi
                    i_Opcode = "001111" or  -- lui
                    i_Opcode = "100011" or  -- lw
                    i_Opcode = "001110" or  -- xori
                    i_Opcode = "001101" or  -- ori
                    i_Opcode = "001010" or  -- slti
                    i_Opcode = "101011" or  -- sw
                    i_Opcode = "100000" or  -- lb
                    i_Opcode = "100001" or  -- lh
                    i_Opcode = "100100" or  -- lbu
                    i_Opcode = "100101" else -- lhu
                    '0';

o_ALUControl  <= "0010"  when i_Opcode = "001000" or -- addi
                         (i_Opcode = "000000" and  i_Funct = "100000") or --add
                         i_Opcode = "001001" or --addiu
                         (i_Opcode = "000000" and i_Funct = "100001") or --addu
                         i_Opcode = "100011" or -- lw
                         i_Opcode = "101011" or -- sw
                         i_Opcode = "100000" or -- lb
                         i_Opcode = "100001" or -- lh
                         i_Opcode = "100100" or -- lbu
                         i_Opcode = "100101" else -- lhu
            "1110"  when i_Opcode = "001111" else -- lui
            "1100"  when (i_Opcode = "000000" and i_Funct ="100111") else -- nor
            "1111"  when (i_Opcode = "000000" and i_Funct = "100110") or -- xor
                         i_Opcode = "001110" else -- xori
            "0001"  when (i_Opcode = "000000" and i_Funct = "100101") or -- or
                         i_Opcode = "001101" else -- ori
            "0111"  when (i_Opcode = "000000" and i_Funct = "101010") or -- slt
                         i_Opcode = "001010" else -- slti
            "1000"  when (i_Opcode = "000000" and i_Funct = "000000") or -- sll
                         (i_Opcode = "000000" and i_Funct = "000100") else -- sllv
            "1010"  when (i_Opcode = "000000" and i_Funct = "000010") or --srl
                         (i_Opcode = "000000" and i_Funct = "000110") else --srlv
            "1011"  when (i_Opcode = "000000" and i_Funct = "000011") or --sra
                         (i_Opcode = "000000" and i_Funct = "000111") else --srav
            "0011"  when (i_Opcode = "000000" and i_Funct = "100010") or -- sub
                         (i_Opcode = "000000" and i_Funct = "100011") or -- subu
                         i_Opcode = "000100" or -- beq
                         i_Opcode = "000101" else -- bne
            "0000";


o_MemtoReg <= '1' when    i_Opcode = "100011" or  -- lw
                        i_Opcode = "100000" or  -- lb
                        i_Opcode = "100001" or  -- lh
                        i_Opcode = "100100" or  -- lbu
                        i_Opcode = "100101" else -- lhu
                        '0';

o_DMemWr <= '1' when      i_Opcode = "101011" else -- sw
                        '0';

o_RegWr  <= '0' when   (i_Opcode = "000000" and i_Funct = "001000") else
            '1' when   i_Opcode = "001000" or  -- addi
                    i_Opcode = "000000" or  -- R-type (add, addu, and, or, etc.)
                    i_Opcode = "001001" or  -- addiu
                    i_Opcode = "001100" or  -- andi
                    i_Opcode = "001111" or  -- lui
                    i_Opcode = "100011" or  -- lw
                    i_Opcode = "001110" or  -- xori
                    i_Opcode = "001101" or  -- ori
                    i_Opcode = "001010" or  -- slti
                    i_Opcode = "100000" or  -- lb
                    i_Opcode = "100001" or  -- lh
                    i_Opcode = "100100" or  -- lbu
                    i_Opcode = "100101" or  -- lhu
                    i_Opcode = "000011" else -- jal
                    '0';

o_RegDst <= '0' when   (i_Opcode = "000000" and i_Funct = "001000") else
            '1' when i_Opcode = "000000" else -- R-type (add, addu, and, or, etc.)
            '0';

o_RegJump <= '1' when  (i_Opcode = "000000" and i_Funct = "001000") else 
             '0';

o_Jump    <= '1' when  (i_Opcode = "000000" and i_Funct = "001000" ) or
                       i_Opcode = "000011" or 
                       i_Opcode = "000010" else
             '0';

o_halt <= '1' when  i_Opcode = "010100"  else
          '0';    

o_Branch <= '1' when i_Opcode = "000100" or -- beq
                     i_Opcode = "000101" else -- bne
            '0';

end dataflow;
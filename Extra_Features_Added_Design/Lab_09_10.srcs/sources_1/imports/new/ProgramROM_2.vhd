----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/09/2022 04:34:39 PM
-- Design Name: 
-- Module Name: ProgramROM - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ProgramROM_2 is
Port ( MemSel : in STD_LOGIC_VECTOR (2 downto 0);
Instruction : out STD_LOGIC_VECTOR (11 downto 0));
end ProgramROM_2;

architecture Behavioral of ProgramROM_2 is
type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);
signal ProgramROM_0 : rom_type :=(
   --Another program to count from (-8) to 6 with increment 2 
     "101110001000",  -- MOVI R7,(-8)    --line->0
     "100100000010",  -- MOVI R2,2
     "001110100000",  -- ADD R7,R2
     "110000000010",  -- JZR R0,2    --line->3 ,after this nothing will execute and always jump to line 2
     "000010100000",  -- ADD R1,R2
     "110010000111",  -- JZR R1,7
     "110000000011",  -- JZR R0,3
     "110000000111"   -- JZR R0,7     --line->7
);

begin
Instruction <= ProgramROM_0(to_integer(unsigned(MemSel)));
end Behavioral;
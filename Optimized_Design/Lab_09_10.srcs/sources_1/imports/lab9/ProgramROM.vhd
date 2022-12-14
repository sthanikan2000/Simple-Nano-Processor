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

entity ProgramROM is
Port ( MemSel : in STD_LOGIC_VECTOR (2 downto 0);
Instruction : out STD_LOGIC_VECTOR (11 downto 0));
end ProgramROM;

architecture Behavioral of ProgramROM is
type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);
signal ProgramROM_0 : rom_type :=(
    --program to add numbers 1 to 3 and wait till a reset
   "100010000011",  -- MOVI R1,3    --line->0
   "100100000001",  -- MOVI R2,1
   "010100000000",  -- NEG R2
   "001110010000",  -- ADD R7,R1    --line->3
   "000010100000",  -- ADD R1,R2
   "110010000111",  -- JZR R1,7
   "110000000011",  -- JZR R0,3
   "110000000111"   -- JZR R0,7     --line->7
   
);

begin
Instruction <= ProgramROM_0(to_integer(unsigned(MemSel)));
end Behavioral;
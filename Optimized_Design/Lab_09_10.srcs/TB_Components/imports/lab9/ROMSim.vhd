----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/09/2022 04:43:42 PM
-- Design Name: 
-- Module Name: ROMSim - Behavioral
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

entity RomSim is
-- Port ( );
end RomSim;

architecture Behavioral of RomSim is
component ProgramROM 

  port(
MemSel : in STD_LOGIC_VECTOR (2 downto 0);
Instruction : out STD_LOGIC_VECTOR (11 downto 0)
);
end component;

Signal MemSel : STD_LOGIC_VECTOR(2 downto 0);
Signal Instruction : STD_LOGIC_VECTOR(11 downto 0);


begin
UUT : ProgramROM port map(
MemSel => MemSel,
Instruction => Instruction
);
process begin
wait for 10ns;
MemSel <= "000"; 
wait for 100ns; 
MemSel <= "001";
wait for 100ns; 
MemSel <= "010";
wait for 100ns; 
MemSel <= "011";
wait for 100ns; 
MemSel <= "100";
wait; 
end process;
end Behavioral;
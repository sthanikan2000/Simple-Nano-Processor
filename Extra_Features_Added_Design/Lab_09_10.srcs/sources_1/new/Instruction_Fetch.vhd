----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/09/2022 06:47:03 PM
-- Design Name: 
-- Module Name: Instruction_Fetch - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Instruction_Fetch is
    Port ( Clk : in STD_LOGIC;
           Ins : in STD_LOGIC_VECTOR (11 downto 0);
           Operation : out STD_LOGIC_VECTOR (1 downto 0);
           RegA : out STD_LOGIC_VECTOR (2 downto 0);
           RegB : out STD_LOGIC_VECTOR (2 downto 0);
           Im_Value : out STD_LOGIC_VECTOR (3 downto 0));
end Instruction_Fetch;

architecture Behavioral of Instruction_Fetch is

begin
process (Clk)
    begin
        if (falling_edge(Clk)) then
           Operation<=Ins(11 downto 10);
           RegA<=Ins(9 downto 7);
           RegB<=Ins(6 downto 4);
           Im_Value<=Ins(3 downto 0); 
            
        end if;
end process;


end Behavioral;

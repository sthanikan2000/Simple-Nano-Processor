----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/09/2022 08:42:51 PM
-- Design Name: 
-- Module Name: Mux_Sel - Behavioral
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

entity Mux_Sel is
    Port ( Op : in STD_LOGIC_VECTOR (1 downto 0);
           RegA : in STD_LOGIC_VECTOR (2 downto 0);
           RegB : in STD_LOGIC_VECTOR (2 downto 0); 
           MuxA : out STD_LOGIC_VECTOR (2 downto 0);
           MuxB : out STD_LOGIC_VECTOR (2 downto 0));
end Mux_Sel;

architecture Behavioral of Mux_Sel is

begin
process (Op)
begin
   case Op is
   when "00" =>
        MuxA<=RegA;
        MuxB<=RegB;
   when "01" =>
        MuxA<="000";
        MuxB<=RegA;
   when "10" =>
        MuxA<="000";
        MuxB<="000";
   when "11" =>         
        MuxA<=RegA;
        MuxB<="000";
   when others =>
        MuxA<="000";
        MuxB<="000";
   end case;
end process;

end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/27/2022 06:57:14 PM
-- Design Name: 
-- Module Name: ResetController - Behavioral
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

entity ResetController is
    Port ( ResIn : in STD_LOGIC;
           Clk   : in STD_LOGIC;
           ResOut : out STD_LOGIC);
end ResetController;

architecture Behavioral of ResetController is
signal PreReset:std_logic:='1';

begin    
    process (Clk)
    begin
        if (rising_edge(Clk)) then
        if ResIn='1' then
                ResOut<='1';
                PreReset<='0';
            elsif PreReset='1' then
                ResOut<='1';
            else
                ResOut<='0';             
            end if;
        end if;
    end process;

end Behavioral;

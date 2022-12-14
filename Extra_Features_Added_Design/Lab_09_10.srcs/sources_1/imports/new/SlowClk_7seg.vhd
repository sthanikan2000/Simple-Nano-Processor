----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/12/2022 08:11:33 AM
-- Design Name: 
-- Module Name: SlowClk_7seg - Behavioral
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

entity SlowClk_7seg is
    Generic (count_max:integer:= 100000000); 
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end SlowClk_7seg;

architecture Behavioral of SlowClk_7seg is

signal count : integer :=1;
signal clk_status:std_logic:='0';

begin

process (clk_in) begin
    if(rising_edge(clk_in)) then
        count<=count+1;
        if (count=count_max) then
            clk_status<= not(clk_status);
            clk_out<= clk_status;
            count<=1;
        end if;
     end if;
end process;

end Behavioral;

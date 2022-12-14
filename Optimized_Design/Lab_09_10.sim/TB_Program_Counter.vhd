----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/09/2022 10:41:48 AM
-- Design Name: 
-- Module Name: TB_Program_Counter - Behavioral
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

entity TB_Program_Counter is
--  Port ( );
end TB_Program_Counter;

architecture Behavioral of TB_Program_Counter is
component Program_Counter
Port (     Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (2 downto 0);
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;
signal Q,D :STD_LOGIC_VECTOR (2 downto 0);
signal Res,Clk:std_logic:='0';
begin
UUT:Program_Counter
    port map(
        Clk=>Clk,
        Reset=>Res,
        D=>D,
        Q=>Q);
process
begin
   wait for 40ns;
   Clk<=not(Clk);
end process; 

process
begin
Res<='1';
wait for 50ns;
D<="001";
wait for 50ns;
Res<='0';
wait for 100ns;
D<="111";
wait for 100ns;
D<="101";
wait;

end process;
end Behavioral;

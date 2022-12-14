----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/16/2022 03:56:47 PM
-- Design Name: 
-- Module Name: Sim_Reset_Controller - Behavioral
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

entity Sim_Reset_Controller is
--  Port ( );
end Sim_Reset_Controller;

architecture Behavioral of Sim_Reset_Controller is
component ResetController 
Port ( ResIn : in STD_LOGIC;
           Clk   : in STD_LOGIC;
           ResOut : out STD_LOGIC);
end component;

signal ResIn,ResOut:std_logic;
signal Clk:std_logic := '0';
begin
UUT:ResetController
    port map(
        Clk=>Clk,
        ResIn=>ResIn,
        ResOut => ResOut);
process 
begin
    wait for 1ns;
    Clk<=not(Clk);
end process;


process
begin
    ResIn <= '0';
    wait for 100ns;
    ResIn <= '1';
    wait for 100ns;
    ResIn <= '0';
    wait;
end process;
end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2022 03:37:00 PM
-- Design Name: 
-- Module Name: sim_Nano_Processor - Behavioral
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

entity sim_Nano_Processor is
--  Port ( );
end sim_Nano_Processor;

architecture Behavioral of sim_Nano_Processor is
component Nano_Processor
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           Negative:out Std_logic;
           R7_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;
signal Overflow,Zero,Negative:std_logic;
signal Clk,Reset:std_logic:='1';
signal R7_out :STD_LOGIC_VECTOR (3 downto 0);
begin
UUT:Nano_processor
    port map(
        Clk=>Clk,
        Reset=>Reset,
        OverFlow=>Overflow,
        Zero=>Zero,
        Negative=>Negative,
        R7_out=>R7_out);
process 
begin
    wait for 1ns;
    Clk<=not(Clk);
end process;

process 
begin
wait for 80ns;
Reset<='0';
wait for 1200ns;
Reset<='1';
--wait;
end process;
end Behavioral;

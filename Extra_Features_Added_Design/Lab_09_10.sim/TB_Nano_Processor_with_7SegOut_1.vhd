----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/14/2022 09:34:36 AM
-- Design Name: 
-- Module Name: TB_Nano_Processor_with_7SegOut_1 - Behavioral
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

entity TB_Nano_Processor_with_7SegOut_1 is
--  Port ( );
end TB_Nano_Processor_with_7SegOut_1;

architecture Behavioral of TB_Nano_Processor_with_7SegOut_1 is
component 
    Nano_Processor_with_7SegOut
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           ROMSel: in STD_LOGIC;
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           Negative : out STD_LOGIC;
           LED_out : out STD_LOGIC_VECTOR (3 downto 0);
           Anode_7Seg : out STD_LOGIC_VECTOR (3 downto 0);
           Cathode_7Seg : out STD_LOGIC_VECTOR (6 downto 0));
end component;
signal Clk : std_logic := '0';
signal Reset : std_logic;
signal ROMSel : std_logic:='0';
signal overflow,Zero,Negative : std_logic;
signal LED_out,Anode_7Seg : STD_LOGIC_VECTOR (3 downto 0);
signal Cathode_7Seg :STD_LOGIC_VECTOR (6 downto 0);
begin
UUT:Nano_Processor_with_7SegOut
    port map(
        Clk=>Clk,
        Reset=>Reset,
        ROMSel=>ROMSel,
        OverFlow=>Overflow,
        Zero=>Zero,
        Negative=>Negative,
        LED_out => LED_out,
        Anode_7Seg => Anode_7Seg,
        Cathode_7Seg => Cathode_7Seg);
process 
begin
    wait for 1ns;
    Clk<=not(Clk);
end process;

process 
begin
wait for 200ns;
Reset<='1';
wait for 20ns;
Reset<='0';
wait for 1500ns;
ROMSel<='1';
wait for 200ns;
Reset<='1';
wait for 10ns;
Reset<='0';
wait;
end process;
end Behavioral;

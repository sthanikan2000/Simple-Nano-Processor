----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/11/2022 05:29:00 PM
-- Design Name: 
-- Module Name: Nano_Processor_7_Seg - Behavioral
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

entity Nano_Processor_7_Seg is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Negative:out STD_Logic;
           R7_Out : out STD_LOGIC_VECTOR (3 downto 0);
           S_7_Seg : out STD_LOGIC_VECTOR (6 downto 0);
           Anode_Activate : out STD_LOGIC_VECTOR (3 downto 0));
end Nano_Processor_7_Seg;

architecture Behavioral of Nano_Processor_7_Seg is
component Nano_Processor 
    Port ( Clk : in STD_LOGIC;
       Reset : in STD_LOGIC;
       Overflow : out STD_LOGIC;
       Zero : out STD_LOGIC;
       Negative : out STD_LOGIC;
       R7_out : out STD_LOGIC_VECTOR (3 downto 0);
       Anode_Activate : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component LUT_16_7
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));

end component;

signal Zero,Overflow : STD_LOGIC;
signal R7 : STD_LOGIC_VECTOR (3 downto 0);
begin
Nano_Processor_0 : Nano_Processor
    port map(Clk =>  Clk,
           Reset => Reset,
           R7_Out => R7,
           Zero => Zero,
           Negative => Negative,
           Overflow => Overflow,
           Anode_Activate => Anode_Activate
           );
           
LUT_16_7_0 : LUT_16_7
    port map(address => R7,
             data => S_7_Seg
             );           

process(Negative)
begin
 case Negative is
 when "00" =>
     Anode_Activate <= "0111"; 
     -- activate LED1 and Deactivate LED2, LED3, LED4
     LED_BCD <= displayed_number(15 downto 12);
     -- the first hex digit of the 16-bit number
 when "01" =>
     Anode_Activate <= "1011"; 
     -- activate LED2 and Deactivate LED1, LED3, LED4
     LED_BCD <= displayed_number(11 downto 8);
     -- the second hex digit of the 16-bit number
 when "10" =>
     Anode_Activate <= "1101"; 
     -- activate LED3 and Deactivate LED2, LED1, LED4
     LED_BCD <= displayed_number(7 downto 4);
     -- the third hex digit of the 16-bit number
 when "11" =>
     Anode_Activate <= "1110"; 
     -- activate LED4 and Deactivate LED2, LED3, LED1
     LED_BCD <= displayed_number(3 downto 0);
     -- the fourth hex digit of the 16-bit number    
 end case;
end process;
end Behavioral;

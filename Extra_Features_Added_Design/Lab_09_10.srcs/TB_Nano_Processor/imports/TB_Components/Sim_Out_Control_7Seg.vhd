----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/16/2022 04:13:03 PM
-- Design Name: 
-- Module Name: Sim_Out_Control_7Seg - Behavioral
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

entity Sim_Out_Control_7Seg is
--  Port ( );
end Sim_Out_Control_7Seg;

architecture Behavioral of Sim_Out_Control_7Seg is
component Out_controll_7seg
    Port ( Clk : in STD_LOGIC;
           R7_out : in STD_LOGIC_VECTOR (3 downto 0);
           Anode_out : out STD_LOGIC_VECTOR (3 downto 0);
           Cathode_out : out STD_LOGIC_VECTOR (6 downto 0));
end component ;

signal Clk: std_logic := '1';
signal R7_out,Anode_out :STD_LOGIC_VECTOR (3 downto 0);
signal Cathode_out :STD_LOGIC_VECTOR (6 downto 0);

begin
UUT:Out_controll_7seg
    port map(
        Clk=>Clk,
        R7_out=>R7_out,
        Anode_out => Anode_out,
        Cathode_out=>Cathode_out);
        
process 
begin
    wait for 1ns;
    Clk<=not(Clk);
end process;

process 
begin
    wait for 100ns;
    R7_out <= "0011";
    wait for 100ns;
    R7_out <= "0101";
    wait for 100ns;
    R7_out <= "0110";
    wait for 100ns;
    R7_out <= "1000";
    wait for 100ns;
    R7_out <= "1111";
    wait for 100ns;
    R7_out <= "1001";
    wait;        
end process;

end Behavioral;

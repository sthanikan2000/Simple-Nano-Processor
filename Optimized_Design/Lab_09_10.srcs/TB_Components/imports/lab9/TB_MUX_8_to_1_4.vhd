----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/08/2022 08:39:29 PM
-- Design Name: 
-- Module Name: TB_MUX1 - Behavioral
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

entity TB_MUX_8_to_1_4 is
--  Port ( );
end TB_MUX_8_to_1_4;

architecture Behavioral of TB_MUX_8_to_1_4 is
component MUX_8_to_1_4
    Port (     R0 : in STD_LOGIC_VECTOR (3 downto 0);
               R1 : in STD_LOGIC_VECTOR (3 downto 0);
               R2 : in STD_LOGIC_VECTOR (3 downto 0);
               R3 : in STD_LOGIC_VECTOR (3 downto 0);
               R4 : in STD_LOGIC_VECTOR (3 downto 0);
               R5 : in STD_LOGIC_VECTOR (3 downto 0);
               R6 : in STD_LOGIC_VECTOR (3 downto 0);
               R7 : in STD_LOGIC_VECTOR (3 downto 0);
               S : in STD_LOGIC_VECTOR (2 downto 0);
               Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal R0,R1,R2,R3,R4,R5,R6,R7,Y : std_logic_vector(3 downto 0);
signal S : std_logic_vector(2 downto 0);

begin

UUT: MUX_8_to_1_4
    port map (
        R0 => R0,
        R1 => R1,
        R2 => R2,
        R3 => R3,
        R4 => R4,
        R5 => R5,
        R6 => R6,
        R7 => R7,
        S => S,
        Y => Y        
    );
    
process
begin
    --200240M 0011 0000 1110 0011 0000
    --200635E 0011 0000 1111 1011 1011
    --200575T 0011 0000 1111 0111 1111
    R0 <= "0000";
    R1 <= "0011";
    R2 <= "1011";
    R3 <= "1110";
    R4 <= "0000";
    R5 <= "0111";
    R6 <= "1011";
    R7 <= "1111";
    
    S <= "000";
    wait for 100 ns;
    S <= "001";
    wait for 100 ns;
    S <= "010";
    wait for 100 ns;
    S <= "011";
    wait for 100 ns;
    S <= "100";
    wait for 100 ns;
    S <= "101";
    wait for 100 ns;
    S <= "110";
    wait for 100 ns;
    S <= "111";
    wait;
end process;    

end Behavioral;
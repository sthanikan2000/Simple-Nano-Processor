----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/08/2022 08:51:01 PM
-- Design Name: 
-- Module Name: sim_ADD_SUB_4 - Behavioral
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

entity sim_ADD_SUB_4 is
--  Port ( );
end sim_ADD_SUB_4;

architecture Behavioral of sim_ADD_SUB_4 is
component ADD_SUB_4
Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Sub_Sel : in STD_LOGIC;
           Zero:out std_logic;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           C_out : out STD_LOGIC);
end component;
signal A,B,S_out: std_logic_vector (3 downto 0);
signal c_out,K,Zero:std_logic;
begin
UUT: ADD_SUB_4
    PORT MAP(
        A=>A(3 downto 0),
        B=>B(3 downto 0),
        Sub_Sel=>K,
        zero=>Zero,
        S=>S_out(3 downto 0),      
        C_out=>c_out ); 
process
    begin
    K<='0';    --add
    A<="1000"; --2
    B<="1000"; --3
    wait for 100ns;
    
    A<="1111"; --(-1)
    B<="0011"; --1
    wait for 100ns;
    
    K<='1';
    A<="0010"; --2
    B<="0011"; --3
    wait for 100ns;
    
    A<="0111"; --7
    B<="0111"; --7
    wait for 100ns;

    K<='0';
    A<="1111"; --8
    B<="1111"; --8
    wait for 100ns;

    A<="1110"; --8
    B<="1110"; --e
    wait for 100ns;

    A<="1001"; --9
    B<="0110"; --6
    wait for 100ns;
 
    K<='1';
    A<="1010"; --a
    B<="1100"; --c
    wait for 100ns; 
    
    A<="0001"; --1
    B<="1001"; --(-7)
    wait for 100ns;   
    
    K<='0';
    A<="0001"; --1
    B<="0111"; --7
    wait for 100ns;
end process;


end Behavioral;

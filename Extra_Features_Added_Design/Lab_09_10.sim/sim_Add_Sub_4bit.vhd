----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/07/2022 04:35:00 PM
-- Design Name: 
-- Module Name: sim_Add_Sub_4bit - Behavioral
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

entity sim_Add_Sub_4bit is
--  Port ( );
end sim_Add_Sub_4bit;

architecture Behavioral of sim_Add_Sub_4bit is
component Add_Sub_4bit
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Sub_Sel : in STD_LOGIC;
           Zero:out std_logic;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC;
           Negative: out std_logic);
end component;
signal A,B,S_out: std_logic_vector (3 downto 0);
signal Overflow,K,Zero,Negative:std_logic;
begin
UUT: Add_Sub_4bit
    PORT MAP(
        A=>A(3 downto 0),
        B=>B(3 downto 0),
        Sub_Sel=>K,
        zero=>Zero,
        S=>S_out(3 downto 0),      
        Overflow=>Overflow,
        Negative=>Negative ); 
process
            begin
            K<='0';    --add
            A<="0111"; --7
            B<="1000"; --(-8)
            wait for 100ns;
            
            A<="1000"; --(-8)
            B<="0010"; --2
            wait for 100ns;
            
            K<='1';    -- Sub
            A<="1010"; --(-6)
            B<="1010"; --(-6)
            wait for 100ns;
            
            A<="0111"; --7
            B<="0111"; --7
            wait for 100ns;
        
            K<='0';
            A<="1000"; --(-8)
            B<="1000"; --(-8)
            wait for 100ns;
        
            A<="1111"; --(-1)
            B<="0001"; --1
            wait for 100ns;
        
            A<="0000"; --0
            B<="1100"; --(-4)
            wait for 100ns;
         
            K<='1';
            A<="1010"; --(-6)
            B<="1100"; --(-4)
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

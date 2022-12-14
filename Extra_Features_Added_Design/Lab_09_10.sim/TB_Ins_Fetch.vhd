----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/11/2022 11:31:43 PM
-- Design Name: 
-- Module Name: TB_Ins_Fetch - Behavioral
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

entity TB_Ins_Fetch is
--  Port ( );
end TB_Ins_Fetch;

architecture Behavioral of TB_Ins_Fetch is
component Instruction_Fetch
    Port ( Clk : in STD_LOGIC;
           Ins : in STD_LOGIC_VECTOR (11 downto 0);
           Operation : out STD_LOGIC_VECTOR (1 downto 0);
           RegA : out STD_LOGIC_VECTOR (2 downto 0);
           RegB : out STD_LOGIC_VECTOR (2 downto 0);
           Im_Value : out STD_LOGIC_VECTOR (3 downto 0));
end component;
signal Clk:std_logic:='0';
signal Ins:std_logic_vector(11 downto 0);
signal Operation:std_logic_vector(1 downto 0);
signal RegA,RegB:std_logic_vector(2 downto 0);
signal Im_Value:std_logic_vector(3 downto 0);

begin
UUT:Instruction_Fetch
    port map(
    Clk=>Clk,
    Ins=>Ins,
    Operation=>Operation,
    RegA=>RegA,
    RegB=>RegB,
    Im_Value=>Im_Value  );

process
begin
    wait for 35ns;
    Clk <= not Clk;
end process;

process 
begin
    --200635->11 0000 1111 1011 1011
    --200240->11 0000 1110 0011 0000
    --200575->11 0000 1111 0111 1111
    --200647->11 0000 1111 1100 0111
    --200655->11 0000 1111 1100 1111

    --unique 4bit numbers from index numbers=>0011,0000,1111,1110,1011,0011,0111,1100

    Ins <= "101110000110"; --MOVI R7,6;
    wait for 100ns;        --R7=6
     
    Ins <= "101100000101"; --MOVI R6,5;
    wait for 100ns;        --R6=5
     
    Ins <= "011110000000"; --NEG R7;
    wait for 100ns;        --R7=-6
     
    Ins <= "001101110000"; --ADD R6,R7;
    wait for 100ns;        
    
    Ins <= "111110000110";    --JZR R7,6;
    wait for 100ns;
    
    Ins <= "110000000010";    --JZR R0,2;  
    wait;
 
end process;

end Behavioral;

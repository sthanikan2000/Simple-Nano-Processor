----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/09/2022 09:51:21 PM
-- Design Name: 
-- Module Name: TB_Instruction_Decoder - Behavioral
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

entity TB_Instruction_Decoder is
--  Port ( );
end TB_Instruction_Decoder;

architecture Behavioral of TB_Instruction_Decoder is
component Instruction_Decoder
    Port ( Ins : in STD_LOGIC_VECTOR (11 downto 0);
           Reg_Che_For_Jump : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_En : out STD_LOGIC_VECTOR(2 downto 0);
           Load_Im : out STD_LOGIC;
           Im_Val : out STD_LOGIC_VECTOR(3 downto 0);
           MuxA_Sel : out STD_LOGIC_VECTOR (2 downto 0);
           MuxB_Sel : out STD_LOGIC_VECTOR (2 downto 0);
           Sub_Sel : out STD_LOGIC;
           Jump : out STD_LOGIC;
           Address_Jump : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal Load_Im,sub_sel,jump : std_logic;
signal Reg_Che_For_Jump,Im_Val : STD_LOGIC_VECTOR(3 downto 0);
signal Reg_En,MuxA_Sel,MuxB_Sel,Address_Jump : STD_LOGIC_VECTOR (2 downto 0);
signal Ins : STD_LOGIC_VECTOR (11 downto 0);
begin

UUT : Instruction_Decoder
        port map (
                   Ins => Ins,
                   Reg_Che_For_Jump => Reg_Che_For_Jump,
                   Reg_En => Reg_En,
                   Load_Im => Load_Im,
                   Im_Val => Im_Val,
                   MuxA_Sel => MuxA_Sel,
                   MuxB_Sel => MuxB_Sel,
                   Sub_Sel => Sub_Sel,
                   Jump => Jump,
                   Address_Jump => Address_Jump
        );
        

process 
begin
 Ins <= "100010001110";
 wait for 100ns;
 
 Ins <= "100100000101";
 wait for 100ns;
 
 Ins <= "100110001110";
 wait for 100ns;
 
 Ins <= "010110000000";
 wait for 100ns;
 
 Reg_Che_For_Jump<="0000";
 Ins <= "000010110000";
 wait for 100ns;
 
 Ins <= "110010000010";
 wait for 100ns;

 Ins <= "010100000000";
 wait for 100ns;
 
 
end process;
end Behavioral;

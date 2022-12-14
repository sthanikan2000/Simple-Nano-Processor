----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/08/2022 08:07:14 PM
-- Design Name: 
-- Module Name: ADD_SUB_4 - Behavioral
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

entity ADD_SUB_4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           S : out STD_LOGIC_VECTOR (3 downto 0);
           C_out : out STD_LOGIC;
           Sub_Sel : in STD_LOGIC;
           Zero : out STD_LOGIC);
end ADD_SUB_4;

architecture Behavioral of ADD_SUB_4 is
component RCA_4
 Port (    A : in STD_LOGIC_VECTOR (3 downto 0);
           B: in STD_LOGIC_VECTOR (3 downto 0);            
           S: out STD_LOGIC_VECTOR (3 downto 0);     
           C_in : in STD_LOGIC;
           C_out : out STD_LOGIC);
end component;
signal B0,S0:std_logic_vector(3 downto 0);
signal C_out0,Zero0:std_logic;
begin
    B0(0)<=B(0) xor Sub_Sel;
    B0(1)<=B(1) xor Sub_Sel;
    B0(2)<=B(2) xor Sub_Sel;
    B0(3)<=B(3) xor Sub_Sel;
    RCA_4_0:RCA_4
        port map(
            A=>A,
            B=>B0,
            S=>S0,
            C_in=>Sub_Sel,
            C_out=>C_out0 );
            
    Zero0<=not((S0(0)) or (S0(1)) or (S0(2)) or (S0(3)));
    S<=S0;
    Zero<=Zero0;
    C_out<=not(Zero0) and C_out0;
end Behavioral;

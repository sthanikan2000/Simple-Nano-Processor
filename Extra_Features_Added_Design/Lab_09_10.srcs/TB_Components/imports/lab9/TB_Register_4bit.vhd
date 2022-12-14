----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/09/2022 12:24:56 PM
-- Design Name: 
-- Module Name: TB_Register_4bit - Behavioral
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

entity TB_Register_4bit is
--  Port ( );
end TB_Register_4bit;

architecture Behavioral of TB_Register_4bit is
component Register_4bit
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
          EN : in STD_LOGIC;
          Clk : in STD_LOGIC;
          Reset : in STD_LOGIC;
          Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;
signal D : STD_LOGIC_VECTOR (3 downto 0):="1111";
signal EN,Res,Clk:std_logic:='0';
signal Q : STD_LOGIC_VECTOR (3 downto 0);
begin
UUT: Register_4bit
    port map(
    D=>D,
    EN=>EN,
    Clk=>Clk,
    Reset=>Res,
    Q=>Q
    );
    
    process begin
        wait for 40ns;
        Clk <= Not(Clk);
    end process;
        
    
    process begin
        wait for 10ns;
        Res <= Not(Res);
        wait for 95ns;
        Res <= Not(Res);
        wait for 5ns;
        EN <= '1';
        wait;                    
    end process;
    
    process begin
        wait for 100ns;
        D <= "1101";
        wait for 100ns;
        D <= "1001";
        wait for 100ns;
        D <= "1111";
        wait for 100ns;
        D <= "1000";
        wait;    
    end process;


end Behavioral;

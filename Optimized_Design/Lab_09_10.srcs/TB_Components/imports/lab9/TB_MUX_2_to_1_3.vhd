
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_MUX_2_to_1_3 is
--  Port ( );
end TB_MUX_2_to_1_3;

architecture Behavioral of TB_MUX_2_to_1_3 is

component MUX_2_to_1_3
    Port ( D0 : in STD_LOGIC_VECTOR(2 downto 0);
           D1 : in STD_LOGIC_VECTOR(2 downto 0);
           S : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR(2 downto 0));
end component;

signal D0,D1,Y : std_logic_vector(2 downto 0);
signal S : std_logic;

begin

UUT: MUX_2_to_1_3
    port map(
        D0 => D0,
        D1 => D1,
        S => S,
        Y => Y
    );
    

process
begin
    --200240M 0011 0000 1110 0011 0000
    --200635E 0011 0000 1111 1011 1011
    --200575T 0011 0000 1111 0111 1111
    D0 <= "111";
    D1 <= "110";    
    S <= '0';
    wait for 100 ns;    
    S <= '1';
    wait for 100 ns;
    
    D0 <= "001";
    D1 <= "011";    
    S <= '0';
    wait for 100 ns;
    S <= '1';
    wait for 100 ns;
    
    D0 <= "000";
    D1 <= "101";    
    S <= '0';
    wait for 100 ns;
    S <= '1';
    wait for 100 ns;
    
    D0 <= "111";
    D1 <= "000";    
    S <= '0';
    wait for 100 ns;    
    S <= '1';
    wait;
    
end process;

end Behavioral;
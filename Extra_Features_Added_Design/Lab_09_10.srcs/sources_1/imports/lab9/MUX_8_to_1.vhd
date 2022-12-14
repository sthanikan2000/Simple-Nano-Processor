
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX_8_to_1 is
    Port ( D : in STD_LOGIC_VECTOR (7 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC);
end MUX_8_to_1;

architecture mux_arch of MUX_8_to_1 is
begin
process (D,S)
    begin

    case S is
        when "000" => Y <= D(0);
        when "001" => Y <= D(1);
        when "010" => Y <= D(2);
        when "011" => Y <= D(3);
        when "100" => Y <= D(4);
        when "101" => Y <= D(5);
        when "110" => Y <= D(6);
        when "111" => Y <= D(7);
        when others => Y <= '0';
    end case;
end process; 
end mux_arch;

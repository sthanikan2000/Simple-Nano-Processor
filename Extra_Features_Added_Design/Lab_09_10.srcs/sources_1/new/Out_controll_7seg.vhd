

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Out_controll_7seg is
    Port ( Clk : in STD_LOGIC;
           R7_out : in STD_LOGIC_VECTOR (3 downto 0);
           Anode_out : out STD_LOGIC_VECTOR (3 downto 0);
           Cathode_out : out STD_LOGIC_VECTOR (6 downto 0));
end Out_controll_7seg;

architecture Behavioral of Out_controll_7seg is
    component SlowClk_7seg
        Generic (count_max:integer:= 100000000); --100 million
        Port ( Clk_in : in STD_LOGIC;
               Clk_out : out STD_LOGIC);
    end component;
    
    component LUT_16_7
        Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
               data : out STD_LOGIC_VECTOR (6 downto 0));
    end component;
    
    signal Clk_out_7seg,MSB_R7out:std_logic;
    signal selected_display:integer:=0;
    signal S_7seg:std_logic_vector(6 downto 0);
    
begin
    SlowClk_7seg_0:SlowClk_7seg
        Generic map(count_max => 2) --for simulation
        port map(
            Clk_in=>Clk,
            Clk_out=>Clk_out_7seg   );
    LUT_16_7_0:LUT_16_7
            port map(
                    address=>R7_out,
                    data=>S_7Seg    );    
                
    process(Clk_out_7seg)
    begin
        if (rising_edge(Clk_out_7seg)) then
            selected_display<=selected_display + 1;
            if (selected_display=2)then
                selected_display<=0;
            end if;
        end if;    
    end process;
    
    MSB_R7out<=R7_out(3);
    process(selected_display,MSB_R7out,S_7Seg)
        begin
        if (selected_display = 0) then
            Anode_out<="1110";
            Cathode_out<=S_7Seg;
        elsif(selected_display = 1)then
            Anode_out<="1101";
            if (MSB_R7out='1') then
                Cathode_out<="0111111"; -- to show minus(-)
            elsif(MSB_R7out='0')then
                Cathode_out<="1000000"; -- show zero
            end if;
       
        end if;
    end process;

end Behavioral;

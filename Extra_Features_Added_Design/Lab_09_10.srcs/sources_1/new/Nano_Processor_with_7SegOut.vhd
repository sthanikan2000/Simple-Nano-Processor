
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Nano_Processor_with_7SegOut is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           ROMSel: in STD_LOGIC;
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           Negative : out STD_LOGIC;
           LED_out : out STD_LOGIC_VECTOR (3 downto 0);
           Anode_7Seg : out STD_LOGIC_VECTOR (3 downto 0);
           Cathode_7Seg : out STD_LOGIC_VECTOR (6 downto 0));
end Nano_Processor_with_7SegOut;

architecture Behavioral of Nano_Processor_with_7SegOut is
    component Nano_Processor 
        Port ( Clk : in STD_LOGIC;
               Reset : in STD_LOGIC;
               ROMSel: in STD_LOGIC;
               Overflow : out STD_LOGIC;
               Zero : out STD_LOGIC;
               Negative:out STD_Logic;
               R7_out : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    component Out_controll_7seg 
        Port ( Clk : in STD_LOGIC;
               R7_out : in STD_LOGIC_VECTOR (3 downto 0);
               Anode_out : out STD_LOGIC_VECTOR (3 downto 0);
               Cathode_out : out STD_LOGIC_VECTOR (6 downto 0));
    end component;
    
    component ResetController
        Port ( ResIn : in STD_LOGIC;
               Clk : in STD_Logic;
               ResOut : out STD_LOGIC);
    end component;
    
    signal R7_output:std_logic_vector(3 downto 0);
    signal ResINPUT:std_logic;

begin
ResetController_0:ResetController
    port map(
        ResIn=>Reset,
        Clk=>Clk,
        ResOut=>ResINPUT    );
        
Nano_Processor_0:Nano_processor
    port map(
           Clk=>Clk,
           Reset=>ResINPUT,
           ROMSel=>ROMSel,
           Overflow=>Overflow,
           Zero=>Zero,
           Negative=>Negative,
           R7_out=>R7_output    );
           
LED_out<=R7_output;

Out_controll_7seg_0:Out_controll_7seg 
    Port map ( 
           Clk =>Clk,
           R7_out=>R7_output,
           Anode_out=>Anode_7Seg,
           Cathode_out=>Cathode_7Seg);
           
end Behavioral;

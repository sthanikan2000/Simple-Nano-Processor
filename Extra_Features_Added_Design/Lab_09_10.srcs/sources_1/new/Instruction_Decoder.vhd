
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Instruction_Decoder is
    Port ( Clk : in STD_LOGIC;
           Ins : in STD_LOGIC_VECTOR (11 downto 0);
           Reg_Che_For_Jump : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_En : out STD_LOGIC_VECTOR(2 downto 0);
           Load_Im : out STD_LOGIC;
           Im_Val : out STD_LOGIC_VECTOR(3 downto 0);
           MuxA_Sel : out STD_LOGIC_VECTOR (2 downto 0);
           MuxB_Sel : out STD_LOGIC_VECTOR (2 downto 0);
           Sub_Sel : out STD_LOGIC;
           Jump : out STD_LOGIC;
           Address_Jump : out STD_LOGIC_VECTOR (2 downto 0));
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is
component Instruction_Fetch
    Port ( Clk : in STD_LOGIC;
           Ins : in STD_LOGIC_VECTOR (11 downto 0);
           Operation : out STD_LOGIC_VECTOR (1 downto 0);
           RegA : out STD_LOGIC_VECTOR (2 downto 0);
           RegB : out STD_LOGIC_VECTOR (2 downto 0);
           Im_Value : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal SUB,JZR:std_logic;
signal Op:std_logic_vector(1 downto 0);
signal Reg_A,Reg_B:std_logic_vector(2 downto 0);
signal Im_Val_Temp,R:std_logic_vector(3 downto 0);

begin
Instruction_Fetch_0:Instruction_Fetch
    port map(
        Clk=>Clk,
        Ins=>Ins,
        Operation=>Op,
        RegA=>Reg_A,
        RegB=>Reg_B,
        Im_Value=>Im_Val_Temp);    

Im_Val<=Im_Val_Temp;
Reg_En<=Reg_A;
Address_Jump<=Im_Val_Temp(2 downto 0);    
R<=Reg_Che_For_Jump;
      
Load_Im<=Op(1) and not(Op(0));
SUB<=not(Op(1)) and Op(0);
JZR<=Op(1) and Op(0);
MuxA_Sel<=Reg_A;
MuxB_Sel<=Reg_B;

Sub_Sel<=SUB;
Jump<=JZR and (not(R(0) or R(1) or R(2) or R(3)));

end Behavioral;

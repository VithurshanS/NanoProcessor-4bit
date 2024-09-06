----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.04.2024 08:19:42
-- Design Name: 
-- Module Name: ALU - Behavioral
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

entity NanoProcessor is
    Port ( Res : in std_logic;
           LedOut : out STD_LOGIC_VECTOR (3 downto 0);
           Zero : out STD_LOGIC;
           Overflow : out STD_LOGIC;
           Clk : in STD_LOGIC);
end NanoProcessor;

architecture Behavioral of Nanoprocessor is
component program_decoder
    Port ( Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           RCJ : in STD_LOGIC_VECTOR (3 downto 0);
           RegisterEnabler : out STD_LOGIC_VECTOR (2 downto 0);
           LoadSelector : out STD_LOGIC;
           MULSelector : out STD_LOGIC;
           InputValue : out STD_LOGIC_VECTOR (3 downto 0);
           RegSelMuxA : out STD_LOGIC_VECTOR (2 downto 0);
           RegSelMuxB : out STD_LOGIC_VECTOR (2 downto 0);
           AddSubb : out STD_LOGIC);
end component;
component Reg_Bank
    Port ( Register_Enable : in STD_LOGIC_VECTOR (2 downto 0);
       D_in : in STD_LOGIC_VECTOR (3 downto 0);
       Clk : in STD_LOGIC;
       Reset : in STD_LOGIC;
       Reg_0_Out : out STD_LOGIC_VECTOR (3 downto 0);
       Reg_1_Out : out STD_LOGIC_VECTOR (3 downto 0);
       Reg_2_Out : out STD_LOGIC_VECTOR (3 downto 0);
       Reg_3_Out : out STD_LOGIC_VECTOR (3 downto 0);
       Reg_4_Out : out STD_LOGIC_VECTOR (3 downto 0);
       Reg_5_Out : out STD_LOGIC_VECTOR (3 downto 0);
       Reg_6_Out : out STD_LOGIC_VECTOR (3 downto 0);
       Reg_7_Out : out STD_LOGIC_VECTOR (3 downto 0));

end component;
component Slow_Clk
 Port ( Clk_in : in STD_LOGIC;
Clk_out : out STD_LOGIC);
end component;

component mux8way4bit
    Port ( I0 : in STD_LOGIC_VECTOR (3 downto 0);
       I1 : in STD_LOGIC_VECTOR (3 downto 0);
       I2 : in STD_LOGIC_VECTOR (3 downto 0);
       I3 : in STD_LOGIC_VECTOR (3 downto 0);
       I4 : in STD_LOGIC_VECTOR (3 downto 0);
       I5 : in STD_LOGIC_VECTOR (3 downto 0);
       I6 : in STD_LOGIC_VECTOR (3 downto 0);
       I7 : in STD_LOGIC_VECTOR (3 downto 0);
       EN : in STD_LOGIC;
       S : in STD_LOGIC_VECTOR (2 downto 0);
       Y : out STD_LOGIC_VECTOR (3 downto 0));

end component;
component Add_Sub
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
       B : in STD_LOGIC_VECTOR (3 downto 0);
       M : in STD_LOGIC;
       S : out STD_LOGIC_VECTOR (3 downto 0);
       Overflow : out STD_LOGIC;
       Zero : out STD_LOGIC);
end component;

component Multiplier_2
    Port ( A : in STD_LOGIC_VECTOR (1 downto 0);
           B : in STD_LOGIC_VECTOR (1 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0);
           Zero : out STD_LOGIC;
           OverFlow : out STD_LOGIC);
end component;

component mux2way4bit
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
       B : in STD_LOGIC_VECTOR (3 downto 0);
       EN : in STD_LOGIC;
       S : in STD_LOGIC;
       Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;
signal calout, MULout, immivalue,corrvalue, Data : std_logic_vector (3 downto 0);
signal RIA,RIB,RE,RSS : std_logic_vector (2 downto 0);
signal loadsel, mulsel, AS, Clki, MulZeroFlag, MulOverFlowFlag, AddSubZeroFlag, AddSubOverFlowFlag : std_logic;
signal R0,R1,R2,R3,R4,R5,R6,R7,NA,NB : std_logic_vector (3 downto 0);
signal NA_2Bit, NB_2Bit :  std_logic_vector (1 downto 0); -- input for 2 bit multiplier
begin
Slow:Slow_Clk
port map(
Clk_in => Clk,
Clk_out => Clki);

ProgramDecoder:program_decoder
port map(
Clk => Clki,
Res => Res,
RCJ => NA,
RegisterEnabler => RE,
LoadSelector => loadsel,
MULSelector => mulsel,
InputValue => immivalue,
RegSelMuxA => RIA,
RegSelMuxB => RIB,
AddSubb => AS);

LoadSelectorMuxSwitch : mux2way4bit
port map(
B => calout,
A => immivalue,
EN => '1',
S => loadsel,
Y => corrvalue);

MULSelectorMuxSwitch : mux2way4bit 
port map(
B => corrvalue,
A => MULout,
EN => '1',
S => mulsel, -- if it is '0' B will be selected which is addsub or immidiate value
Y => Data);

RegisterBank : Reg_Bank
port map(
D_in => Data,
Clk => Clki,
Reset => Res,
Reg_0_Out => R0,
Reg_1_Out => R1,
Reg_2_Out => R2,
Reg_3_Out => R3,
Reg_4_Out => R4,
Reg_5_Out => R5,
Reg_6_Out => R6,
Reg_7_Out => R7,
Register_Enable => RE);

MuxA: mux8way4bit
port map(
I0 => R0,
I1 => R1,
I2 => R2,
I3 => R3,
I4 => R4,
I5 => R5,
I6 => R6,
I7 => R7,
EN => '1',
S => RIA,
Y => NA);

MuxB: mux8way4bit
port map(
I0 => R0,
I1 => R1,
I2 => R2,
I3 => R3,
I4 => R4,
I5 => R5,
I6 => R6,
I7 => R7,
EN => '1',
S => RIB,
Y => NB);


AddSubUnit : Add_Sub
port map(
A => NB, -- value from Mux B
B => NA, -- value from Mux A
M => AS,
S => calout,
Overflow => AddSubOverFlowFlag,
Zero => AddSubZeroFlag);


NA_2Bit <= NA(1 downto 0);
NB_2Bit <= NB(1 downto 0);
MulUnit : Multiplier_2
port map(  
           A => NA_2Bit,
           B => NB_2Bit,
           Y => MULout,
           Zero => MulZeroFlag,
           OverFlow => MulOverFlowFlag
);

Zero <= (AddSubZeroFlag AND (NOT mulsel)) OR (MulZeroFlag AND mulsel);
Overflow <= (AddSubOverFlowFlag AND (NOT mulsel)) OR (MulOverFlowFlag AND mulsel);


LedOut <= R7;

end Behavioral;
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.04.2024 05:06:42
-- Design Name: 
-- Module Name: prodecode - Behavioral
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

entity program_decoder is
    Port ( Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           RCJ : in STD_LOGIC_VECTOR (3 downto 0);
           RegisterEnabler : out STD_LOGIC_VECTOR (2 downto 0);
           LoadSelector : out STD_LOGIC;
           InputValue : out STD_LOGIC_VECTOR (3 downto 0);
           RegSelMuxA : out STD_LOGIC_VECTOR (2 downto 0);
           RegSelMuxB : out STD_LOGIC_VECTOR (2 downto 0);
           MULSelector : out std_logic;
           AddSubb : out STD_LOGIC);
end program_decoder;

architecture Behavioral of program_decoder is
component Rom_Incrementor
    Port ( Res : in STD_LOGIC;
       Clk : in STD_LOGIC;
       JumpFlag : in STD_LOGIC;
       JumpAddress : in STD_LOGIC_VECTOR (2 downto 0);
       SelectedRom : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component program_rom
    Port ( MemorySel : in STD_LOGIC_VECTOR (2 downto 0);     
       Instruction : out STD_LOGIC_VECTOR (12 downto 0));

end component;

component Instruction_decoder
    Port ( Instruction_bus : in STD_LOGIC_VECTOR (12 downto 0); -- input from program rom
       Reg_Value : in STD_LOGIC_VECTOR (3 downto 0); -- to check if a register has value zero stored in it 
       -- reg which we check is given with JZR instruction
       Reg_a_address : out STD_LOGIC_VECTOR (2 downto 0); -- selecting input for AU via 8 way 2 bit mux 
       Reg_b_address : out STD_LOGIC_VECTOR (2 downto 0); -- selecting input for AU via 8 way 2 bit mux
       Reg_select : out STD_LOGIC_VECTOR (2 downto 0); -- to select Reg from reg bank to write to a reg
       AddSub_select : out STD_LOGIC; -- selecting Add or Subtract (if neg instruction sub will be selceted)
       
       Jump_flag : out STD_LOGIC; -- to  jump to another instruction in PC(Program counter), 
       -- by checking Reg_Value and this output connected to 2 way 3 bit MUX selector (PC area)
       Jump_address : out STD_LOGIC_VECTOR (2 downto 0); -- which instruction to execute, this output connected to 2 way 3 bit MUX 
       
       Load_select : out STD_LOGIC; -- select between AU output and immediate value (connected to 2 way 4 bit MUX)
       Immediate_value : out STD_LOGIC_VECTOR (3 downto 0);
       MUL_select :  out STD_LOGIC); -- select between output from 2 way 4 bit mux and Multiplier output

end component;

signal JumpFlag:std_logic;
signal JumpAddress,SelectedRom:std_logic_vector (2 downto 0);
signal Ins:std_logic_vector (12 downto 0);

begin
RomIncrementor:Rom_Incrementor
port map(
Res => Res,
Clk => Clk,
JumpFlag => JumpFlag,
JumpAddress => JumpAddress,
SelectedRom => SelectedRom);

prom:program_rom
port map(
MemorySel => SelectedRom,
Instruction => Ins);


Insde:Instruction_decoder
port map(
Instruction_bus => Ins, -- input from program rom
       Reg_Value => RCJ, -- to check if a register has value zero stored in it 
       -- reg which we check is given with JZR instruction
       Reg_a_address => RegSelMuxA, -- selecting input for AU via 8 way 2 bit mux 
       Reg_b_address => RegSelMuxB, -- selecting input for AU via 8 way 2 bit mux
       Reg_select => RegisterEnabler, -- to select Reg from reg bank to write to a reg
       AddSub_select => AddSubb, -- selecting Add or Subtract (if neg instruction sub will be selceted)
       
       Jump_flag => JumpFlag, -- to  jump to another instruction in PC(Program counter), 
       -- by checking Reg_Value and this output connected to 2 way 3 bit MUX selector (PC area)
       Jump_address => JumpAddress, -- which instruction to execute, this output connected to 2 way 3 bit MUX 
       
       Load_select => LoadSelector,
       MUL_select =>  MULSelector,-- select between AU output and immediate value (connected to 2 way 4 bit MUX)
       Immediate_value => InputValue);



end Behavioral;

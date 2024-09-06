----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.04.2024 03:17:02
-- Design Name: 
-- Module Name: nextter - Behavioral
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

entity Rom_Incrementor is
    Port ( Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           JumpFlag : in STD_LOGIC;
           JumpAddress : in STD_LOGIC_VECTOR (2 downto 0);
           SelectedRom : out STD_LOGIC_VECTOR (2 downto 0));
end Rom_Incrementor;

architecture Behavioral of Rom_Incrementor is
component program_counter_3bit
port (Address : in STD_LOGIC_VECTOR (2 downto 0);
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           MemorySel : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component RCA3
    Port ( A0 : in STD_LOGIC;
       A1 : in STD_LOGIC;
       A2 : in STD_LOGIC;
       S0 : out STD_LOGIC;
       S1 : out STD_LOGIC;
       S2 : out STD_LOGIC;
       C_IN : in STD_LOGIC;
       C_OUT : out STD_LOGIC);

end component;
component mux2way3bit
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
       B : in STD_LOGIC_VECTOR (2 downto 0);
       EN : in STD_LOGIC;
       S : in STD_LOGIC;
       Y : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal muxout,pcout,addout : std_logic_vector(2 downto 0);
begin

PC:program_counter_3bit
port map(
Address => muxout,
Res => Res,
Clk => Clk,
MemorySel => pcout);

SelectedRom <= pcout;

Counter: RCA3
port map(
A0 => pcout(0),
A1 => pcout(1),
A2 => pcout(2),
S0 => addout(0),
S1 => addout(1),
S2 => addout(2),
C_IN => '0');

mux: mux2way3bit 
port map (
A => addout,
B => JumpAddress,
EN => '1',
S => JumpFlag,
Y => muxout);






end Behavioral;

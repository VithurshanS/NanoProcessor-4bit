----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.04.2024 05:30:23
-- Design Name: 
-- Module Name: prodecodetb - Behavioral
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

entity prodecodetb is
--  Port ( );
end prodecodetb;

architecture Behavioral of prodecodetb is
component program_decoder
port(Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           RCJ : in STD_LOGIC_VECTOR (3 downto 0);
           RegisterEnabler : out STD_LOGIC_VECTOR (2 downto 0);
           LoadSelector : out STD_LOGIC;
           InputValue : out STD_LOGIC_VECTOR (3 downto 0);
           RegSelMuxA : out STD_LOGIC_VECTOR (2 downto 0);
           RegSelMuxB : out STD_LOGIC_VECTOR (2 downto 0);
           AddSubb : out STD_LOGIC);
end component;
signal Res,LoadSelector,AddSubb:std_logic;
signal Clk : std_logic:='0';
signal RCJ,InputValue : std_logic_vector (3 downto 0);
signal RegisterEnabler,RegSelMuxA,RegSelMuxB : std_logic_vector (2 downto 0);

begin
UUT : program_decoder
port map(
Clk => Clk,
Res => Res,
RCJ => RCJ,
RegisterEnabler => RegisterEnabler,
LoadSelector => LoadSelector,
InputValue => InputValue,
RegSelMuxA => RegSelMuxA,
RegSelMuxB => RegSelMuxB,
AddSubb => AddSubb);

process begin 
Clk <= not (Clk);
wait for 40 ns;
end process;

process begin
Res <= '1';
RCJ <= "1010";
wait for 50 ns;
Res <= '0';
wait for 50 ns;
RCJ <= "0000";
wait for 50 ns;
end process;


end Behavioral;

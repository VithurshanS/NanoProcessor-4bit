----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.04.2024 20:57:38
-- Design Name: 
-- Module Name: TB_PI - Behavioral
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

entity TB_PI is
--  Port ( );
end TB_PI;

architecture Behavioral of TB_PI is
component Rom_Incrementor
    Port ( Res : in STD_LOGIC;
       Clk : in STD_LOGIC;
       JumpFlag : in STD_LOGIC;
       JumpAddress : in STD_LOGIC_VECTOR (2 downto 0);
       SelectedRom : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal Res,JumpFlag : std_logic;
signal Clk : std_logic:='0';
signal JumpAddress,SelectedRom:std_logic_vector (2 downto 0);



begin
UUT: Rom_Incrementor
port map (
Res => Res,
Clk => Clk,
Jumpflag => Jumpflag,
JumpAddress => JumpAddress,
SelectedRom => SelectedRom);

process begin
Clk <= not(Clk);
wait for 10 ns;
end process;

process begin
Res <= '1';
wait for 20ns;
Res <= '0';
JumpAddress <= "101";
Jumpflag <= '1';
wait for 20 ns;
Jumpflag <= '0';
wait for 200ns;
Res <= '1';
wait for 20ns;
Res <= '0';
Jumpflag <= '0';
wait for 200 ns;
JumpAddress <= "011";
Jumpflag <= '1';
wait for 20 ns;
Jumpflag <= '0';
wait;

end process;


end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.04.2024 09:22:51
-- Design Name: 
-- Module Name: ALU_TB - Behavioral
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

entity NanoProcessor_TB is
--  Port ( );
end NanoProcessor_TB;

architecture Behavioral of NanoProcessor_TB is
component NanoProcessor
    Port ( Res : in std_logic;
      LedOut : out STD_LOGIC_VECTOR (3 downto 0);
       Zero : out STD_LOGIC;
       Overflow : out STD_LOGIC;
       Clk : in STD_LOGIC);
end component;
signal Clk : std_logic:='0';
signal Res,Zero,Overflow : std_logic;
signal LedOut: std_logic_vector(3 downto 0);


begin
UUT : NanoProcessor
port map(   
Res => Res,
LedOut => LedOut,
Zero => Zero,
Overflow => Overflow,
Clk => Clk);


process begin
wait for 3 ns;
Clk <= not (Clk);
end process;


process begin
wait for 45ns;
Res <= '1';
wait for 50ns;
Res <= '0';
wait;
end process;



end Behavioral;

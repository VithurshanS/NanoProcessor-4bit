----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/14/2024 08:05:38 PM
-- Design Name: 
-- Module Name: TB_NP_7Seg - Behavioral
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

entity TB_7Seg_With_Multi is
--  Port ( );
end TB_7Seg_With_Multi;

architecture Behavioral of TB_7Seg_With_Multi is
component NanoProcessor_7Seg 
    Port ( Reset : in std_logic;
           Clk : in STD_LOGIC;
           LED_Out : out STD_LOGIC_VECTOR (3 downto 0);
           Zero : out STD_LOGIC;
           Overflow : out STD_LOGIC;
           Seven_Seg_out_Anode : out STD_LOGIC_VECTOR (3 downto 0);
           Seven_Seg_out_Cathode : out STD_LOGIC_VECTOR (6 downto 0)
       );
end component;

signal Clk : std_logic := '0';
signal Overflow, Zero, Reset : std_logic;
signal led : std_logic_vector (3 downto 0);
signal segOut : std_logic_vector (6 downto 0);

begin
UUT : NanoProcessor_7Seg 
    port map (
        Reset => Reset,
        Clk => Clk,
        Zero => Zero,
        Overflow => Overflow,
        LED_Out => led,
        Seven_Seg_out_Cathode => segOut);

process 
begin
    Clk <= not(Clk);
    wait for 2 ns;
end process;        

process
begin
    wait for 45 ns; 
    Reset <= '1';
    wait for 50 ns;
    Reset <= '0';
    wait;
end process;
end Behavioral;
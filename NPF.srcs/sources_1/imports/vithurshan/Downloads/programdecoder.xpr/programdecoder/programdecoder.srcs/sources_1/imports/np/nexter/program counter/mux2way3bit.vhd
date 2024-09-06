----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.04.2024 02:17:06
-- Design Name: 
-- Module Name: mux2way3bit - Behavioral
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

entity mux2way3bit is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           S : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (2 downto 0));
end mux2way3bit;

architecture Behavioral of mux2way3bit is

begin
Y(0) <= EN and ( (not S and A(0)) OR (S and B(0)));
Y(1) <= EN and ((not S and A(1)) OR (S and B(1)));
Y(2) <= EN and ((not S and A(2)) OR (S and B(2)));




end Behavioral;

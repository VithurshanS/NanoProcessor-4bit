----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2024 01:59:44 PM
-- Design Name: 
-- Module Name: Multiplier_2 - Behavioral
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

entity Multiplier_2 is
    Port ( A : in STD_LOGIC_VECTOR (1 downto 0);
           B : in STD_LOGIC_VECTOR (1 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0);
           Zero : out STD_LOGIC;
           OverFlow : out STD_LOGIC);
end Multiplier_2;

architecture Behavioral of Multiplier_2 is

component FA 
    port( A : in STD_LOGIC;
          B : in STD_LOGIC;
          C_in : in STD_LOGIC;
          S : out STD_LOGIC;
          C_out : out STD_LOGIC);
end component;
signal b0a0,b1a0,b0a1,b1a1: STD_LOGIC;
signal c1,s1,c2,s2: STD_LOGIC;

begin
b0a0 <= A(0) AND B(0);
b1a0 <= A(0) AND B(1);
b0a1 <= A(1) AND B(0);
b1a1 <= A(1) AND B(1);

FA_0 : FA
    port map( 
         A => b1a0,
         B => b0a1,
         C_in => '0',
         S => s1, 
         C_out => c1 );       

FA_1 : FA
    port map( 
         A => c1,
         B => b1a1,
         C_in => '0',
         S => s2, 
         C_out => c2 ); 

Y(0) <= b0a0;
Y(1) <= s1;
Y(2) <= s2;
Y(3) <= c2;

Zero <= NOT (b0a0 OR s1 OR s2 Or c2);
OverFlow <= '0'; -- since maximum 3 x 3 result 9 which can be reprecented by 4 bit so no overflow

end Behavioral;

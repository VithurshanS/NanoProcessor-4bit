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

entity mux8way4bit is
    Port ( I0 : in STD_LOGIC_VECTOR (3 downto 0); -- input 4 bit values I0 to I7
           I1 : in STD_LOGIC_VECTOR (3 downto 0);
           I2 : in STD_LOGIC_VECTOR (3 downto 0);
           I3 : in STD_LOGIC_VECTOR (3 downto 0);
           I4 : in STD_LOGIC_VECTOR (3 downto 0);
           I5 : in STD_LOGIC_VECTOR (3 downto 0);
           I6 : in STD_LOGIC_VECTOR (3 downto 0);
           I7 : in STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC;
           S : in STD_LOGIC_VECTOR (2 downto 0); --3 bit value selector
           Y : out STD_LOGIC_VECTOR (3 downto 0)); --selected 4 bit value
end mux8way4bit;

architecture Behavioral of mux8way4bit is
component Decoder_3_to_8
port(EN: in std_logic;
I : in std_logic_vector;
Y : out std_logic_vector);
end component;

signal sel : std_logic_vector (7 downto 0);


begin
Decoder3to8_0 : Decoder_3_to_8
port map(
EN => EN,
I => S,
Y => sel);

Y(0) <= EN and ( (sel(0) and I0(0)) OR (sel(1) and I1(0)) OR (sel(2) and I2(0)) OR (sel(3) and I3(0)) OR (sel(4) and I4(0)) OR (sel(5) and I5(0)) OR (sel(6) and I6(0)) OR (sel(7) and I7(0)));
Y(1) <= EN and ( (sel(0) and I0(1)) OR (sel(1) and I1(1)) OR (sel(2) and I2(1)) OR (sel(3) and I3(1)) OR (sel(4) and I4(1)) OR (sel(5) and I5(1)) OR (sel(6) and I6(1)) OR (sel(7) and I7(1)));
Y(2) <= EN and ( (sel(0) and I0(2)) OR (sel(1) and I1(2)) OR (sel(2) and I2(2)) OR (sel(3) and I3(2)) OR (sel(4) and I4(2)) OR (sel(5) and I5(2)) OR (sel(6) and I6(2)) OR (sel(7) and I7(2)));
Y(3) <= EN and ( (sel(0) and I0(3)) OR (sel(1) and I1(3)) OR (sel(2) and I2(3)) OR (sel(3) and I3(3)) OR (sel(4) and I4(3)) OR (sel(5) and I5(3)) OR (sel(6) and I6(3)) OR (sel(7) and I7(3)));




end Behavioral;

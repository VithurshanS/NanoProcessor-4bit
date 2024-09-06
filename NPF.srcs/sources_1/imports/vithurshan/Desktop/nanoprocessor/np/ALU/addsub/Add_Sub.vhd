----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2024 04:40:42 PM
-- Design Name: 
-- Module Name: Add_Sub - Behavioral
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

entity Add_Sub is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           M : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC);
end Add_Sub;

architecture Behavioral of Add_Sub is
component FA 
Port ( A : in STD_LOGIC;
       B : in STD_LOGIC;
       C_IN : in STD_LOGIC;
       S : out STD_LOGIC;
       C_OUT : out STD_LOGIC);
end component;
signal B0,B1,B2,B3 : std_logic; --signals to bring input
signal C0,C1,C2,C3,Overflow_sig : std_logic;
signal S_sig : std_logic_vector(3 downto 0);
begin
B0 <= B(0) xor M;
B1 <= B(1) xor M;
B2 <= B(2) xor M;
B3 <= B(3) xor M;

FA_0 : FA 
    port map (
        A => A(0),
        B => B0,
        C_IN => M,
        S => S_sig(0),
        C_OUT => C0);
FA_1 : FA 
    port map (
        A => A(1),
        B => B1,
        C_IN => C0,
        S => S_sig(1),
        C_OUT => C1);
FA_2 : FA
    port map (
        A => A(2),
        B => B2,
        C_IN => C1,
        S => S_sig(2),
        C_OUT => C2);
FA_3 : FA
    port map (
        A => A(3),
        B => B3,
        C_IN => C2,
        S => S_sig(3),
        C_OUT => C3);

S <= S_sig;
Overflow_sig <= C2 xor C3;
Zero <= not (S_sig(0) or S_sig(1) or S_sig(2) or S_sig(3));
--Zero <= '1' when (S_sig = "0000") else '0'; 
Overflow <= Overflow_sig;
end Behavioral;

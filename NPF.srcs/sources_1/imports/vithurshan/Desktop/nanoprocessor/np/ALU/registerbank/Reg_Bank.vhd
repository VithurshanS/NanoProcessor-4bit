----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/12/2024 05:38:25 PM
-- Design Name: 
-- Module Name: Reg_Bank - Behavioral
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

entity Reg_Bank is
    Port ( Register_Enable : in STD_LOGIC_VECTOR (2 downto 0);
           D_in : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Reg_0_Out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_1_Out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_2_Out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_3_Out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_4_Out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_5_Out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_6_Out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_7_Out : out STD_LOGIC_VECTOR (3 downto 0));
end Reg_Bank;

architecture Behavioral of Reg_Bank is
component Reg 
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Decoder_3_TO_8 
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal Y : std_logic_vector (7 downto 0);
signal En0,En1,En2,En3,En4,En5,En6,En7 : std_logic;
begin
Decoder_3_TO_8_0 : Decoder_3_TO_8 
    port map (
        I => Register_Enable,
        EN => '1',
        Y => Y);
En0 <= Y(0);
        En1 <= Y(1);
        En2 <= Y(2);
        En3 <= Y(3);
        En4 <= Y(4);
        En5 <= Y(5);
        En6 <= Y(6);
        En7 <= Y(7);
Reg_0 : Reg 
    port map (
        D => "0000",
        Clk => Clk,
        EN => En0,
        Reset => Reset,
        Q => Reg_0_Out);
Reg_1 : Reg 
    port map (
        D => D_in,
        Clk => Clk,
        EN => En1,
        Reset => Reset,
        Q => Reg_1_Out);
Reg_2 : Reg 
    port map (
        D => D_in,
        Clk => Clk,
        EN => En2,
        Reset => Reset,
        Q => Reg_2_Out);
Reg_3 : Reg 
    port map (
        D => D_in,
        Clk => Clk,
        EN => En3,
        Reset => Reset,
        Q => Reg_3_Out);
Reg_4 : Reg 
    port map (
        D => D_in,
        Clk => Clk,
        EN => En4,
        Reset => Reset,
        Q => Reg_4_Out);
Reg_5 : Reg 
    port map (
        D => D_in,
        Clk => Clk,
        EN => En5,
        Reset => Reset,
        Q => Reg_5_Out);
Reg_6 : Reg 
    port map (
        D => D_in,
        Clk => Clk,
        EN => En6,
        Reset => Reset,
        Q => Reg_6_Out);
Reg_7 : Reg 
    port map (
        D => D_in,
        Clk => Clk,
        EN => En7,
        Reset => Reset,
        Q => Reg_7_Out);
end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/14/2024 07:54:23 PM
-- Design Name: 
-- Module Name: NanoProcessor_7Seg - Behavioral
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

entity NanoProcessor_7Seg is
    Port ( Reset : in std_logic;
           Clk : in STD_LOGIC;
           LED_Out : out STD_LOGIC_VECTOR (3 downto 0);
           Zero : out STD_LOGIC;
           Overflow : out STD_LOGIC;
           Seven_Seg_out_Anode : out STD_LOGIC_VECTOR (3 downto 0);
           Seven_Seg_out_Cathode : out STD_LOGIC_VECTOR (6 downto 0)
       );
end NanoProcessor_7Seg;

architecture Behavioral of NanoProcessor_7Seg is
component LUT_16_7
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end component;
    
component NanoProcessor 
    Port ( Res : in std_logic;
           LedOut : out STD_LOGIC_VECTOR (3 downto 0);
           Zero : out STD_LOGIC;
           Overflow : out STD_LOGIC;
           Clk : in STD_LOGIC);
end component;

signal OutSig : std_logic_vector (3 downto 0);
signal To7Seg : std_logic_vector (6 downto 0);

begin
    
Processor_0 : NanoProcessor
    port map (
        Res => Reset,
        Clk => Clk,
        LedOut => OutSig,
        Overflow => Overflow,
        Zero => Zero);

LUT_0 : LUT_16_7 
    port map (
        Address => OutSig,
        Data => To7Seg);
LED_Out <= OutSig;

Seven_Seg_out_Cathode <= To7Seg;
Seven_Seg_out_Anode <= "1110";           
end Behavioral;

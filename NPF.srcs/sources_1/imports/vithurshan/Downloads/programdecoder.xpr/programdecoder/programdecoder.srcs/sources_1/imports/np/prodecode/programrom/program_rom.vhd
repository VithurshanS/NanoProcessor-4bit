----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/12/2024 04:19:53 PM
-- Design Name: 
-- Module Name: program_rom - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity program_rom is
    Port ( MemorySel : in STD_LOGIC_VECTOR (2 downto 0);
           Instruction : out STD_LOGIC_VECTOR (12 downto 0));
end program_rom;

architecture Behavioral of program_rom is
type rom_type is array(0 to 7) of std_logic_vector(12 downto 0);
signal p_rom :rom_type:=(
    "0101110000011", -- MOVI R7,3 --line->0
    "0100100000010", -- MOVI R2,2
    "1001110100000", -- MUL R7,R2
    "0101010000011", -- MOVI R5,3 --line->0
    "0001111010000", -- ADD R7,R5
    "0011010000000", -- NEG R5 --line->0
    "0001111010000", -- ADD R7,R5
    "0110000000111" --  JZR R0,7 -- 
); -- output R7 : 3 6 9 6 3 0

begin
Instruction <= p_rom(to_integer(unsigned(MemorySel)));


end Behavioral;

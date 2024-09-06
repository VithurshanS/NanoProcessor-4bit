----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/12/2024 11:47:09 AM
-- Design Name: 
-- Module Name: program_counter_3bit - Behavioral
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

entity program_counter_3bit is
    Port ( Address : in STD_LOGIC_VECTOR (2 downto 0);
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           MemorySel : out STD_LOGIC_VECTOR (2 downto 0));
end program_counter_3bit;

architecture Behavioral of program_counter_3bit is
component D_FF
port(
           D : in STD_LOGIC;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC;
           Qbar : out STD_LOGIC);
end component;


begin


D_FF_0:D_FF PORT MAP(
D=>ADDRESS(0),
Res=>Res,
Clk=>Clk,
Q=>MEMORYSEL(0));

D_FF_1:D_FF PORT MAP(
D=>ADDRESS(1),
Res=>Res,
Clk=>Clk,
Q=>MEMORYSEL(1));

D_FF_2:D_FF PORT MAP(
D=>ADDRESS(2),
Res=>Res,
Clk=>Clk,
Q=>MEMORYSEL(2));



end Behavioral;

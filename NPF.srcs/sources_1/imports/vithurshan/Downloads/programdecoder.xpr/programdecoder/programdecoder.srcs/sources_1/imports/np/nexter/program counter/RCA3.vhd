----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2024 08:48:34 AM
-- Design Name: 
-- Module Name: RCA3 - Behavioral
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

entity RCA3 is
    Port ( A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           S0 : out STD_LOGIC;
           S1 : out STD_LOGIC;
           S2 : out STD_LOGIC;
           C_IN : in STD_LOGIC;
           C_OUT : out STD_LOGIC);
end RCA3;

architecture Behavioral of RCA3 is
COMPONENT FA
PORT(
A,B,C_IN :IN STD_LOGIC;
S,C_OUT :OUT STD_LOGIC);
END COMPONENT;
SIGNAL FA0_C_OUT,FA1_C_OUT,FA2_C_OUT:STD_LOGIC;

begin
FA0:FA
PORT MAP(
A=>A0,
B=>'1',
C_IN=>'0',
S=>S0,
C_OUT=>FA0_C_OUT

);
FA1:FA
PORT MAP(
A=>A1,
B=>'0',
C_IN=>FA0_C_OUT,
S=>S1,
C_OUT=>FA1_C_OUT
);
FA2:FA
PORT MAP(
A=>A2,
B=>'0',
C_IN=>FA1_C_OUT,
S=>S2,
C_OUT=>FA2_C_OUT
);

C_OUT<=FA2_C_OUT;



end Behavioral;

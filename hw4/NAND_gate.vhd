library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NAND_gate is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           c : out STD_LOGIC);
end NAND_gate;

architecture Behavioral of NAND_gate is

begin

    c <= not (a and b) after 1 ns;
end Behavioral;

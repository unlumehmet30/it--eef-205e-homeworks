library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NAND_3 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           D : out STD_LOGIC);
end NAND_3;

architecture Behavioral of NAND_3 is

begin

    D <= not (A and B and C) after 1 ns;

end Behavioral;

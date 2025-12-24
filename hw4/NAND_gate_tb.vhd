library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity NAND_gate_tb is
end NAND_gate_tb;

architecture Behavioral of NAND_gate_tb is
component NAND_gate is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           c : out STD_LOGIC);
end component;
signal a, b, c : STD_LOGIC := '0';
begin

DUT: NAND_gate Port map(a,b,c);

process begin

wait for 10 ns;

a <= '0';
b <= '1';

wait for 10 ns;

a <= '1';
b <= '1';

wait for 10 ns;

a <= '0';
b <= '0';

wait for 10 ns;

a <= '1';
b <= '0';

wait;

end process;

end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity inv_gate is
    Port (
        I : in  STD_LOGIC;
        O : out STD_LOGIC
    );
end inv_gate;

architecture structure of inv_gate is
begin
    O <= not I;
end structure;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and2_gate is
    Port (
        I1 : in  STD_LOGIC;
        I2 : in  STD_LOGIC;
        O  : out STD_LOGIC
    );
end and2_gate;

architecture structure of and2_gate is
begin
    O <= I1 and I2;
end structure;

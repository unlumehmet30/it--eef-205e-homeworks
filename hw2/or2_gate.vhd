library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity or2_gate is
    Port (
        I1 : in  STD_LOGIC;
        I2 : in  STD_LOGIC;
        O  : out STD_LOGIC
    );
end or2_gate;

architecture structure of or2_gate is
begin
    O <= I1 or I2;
end structure;

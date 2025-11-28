library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity HALF_ADDER is
    Port ( A : in  STD_LOGIC;
        B : in  STD_LOGIC;
        S : out STD_LOGIC;
        Cout : out STD_LOGIC);
end HALF_ADDER;

architecture Dataflow of HALF_ADDER is
begin
    -- Dataflow Modeling
    S <= A xor B;
    Cout <= A and B;
end Dataflow;
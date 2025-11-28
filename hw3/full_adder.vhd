library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FULL_ADDER is
    Port ( A : in  STD_LOGIC;
        B : in  STD_LOGIC;
        Cin : in  STD_LOGIC; -- Carry In
        S : out STD_LOGIC; -- Sum
        Cout : out STD_LOGIC); -- Carry Out
end FULL_ADDER;

architecture Dataflow of FULL_ADDER is
begin
    -- Dataflow Modeling
    -- Toplam (S) için denklem: A XOR B XOR Cin
    S <= A xor B xor Cin;
    
    -- Elde (Cout) için sadeleştirilmiş denklem: (A AND B) OR (A AND Cin) OR (B AND Cin)
    Cout <= (A and B) or (A and Cin) or (B and Cin);
end Dataflow;
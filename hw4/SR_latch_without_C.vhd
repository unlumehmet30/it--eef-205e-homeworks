library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SR_latch_without_C is
    Port ( S_bar : in  STD_LOGIC;
        R_bar : in  STD_LOGIC;
        Q     : inout STD_LOGIC;
        Q_bar : inout STD_LOGIC);
end SR_latch_without_C;

architecture Structural of SR_latch_without_C is
    -- Sağlanan NAND_gate bileşeni tanımlanır
    component NAND_gate
    Port ( a : in STD_LOGIC;
        b : in STD_LOGIC;
        c : out STD_LOGIC);
end component;
begin
    -- NAND 1: Q = (S_bar NAND Q_bar)
    U1: NAND_gate port map (a => S_bar, b => Q_bar, c => Q);
    
    -- NAND 2: Q_bar = (R_bar NAND Q)
    U2: NAND_gate port map (a => R_bar, b => Q, c => Q_bar);
end Structural;
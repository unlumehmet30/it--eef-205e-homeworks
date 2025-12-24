library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_latch is
    Port ( D : in  STD_LOGIC;
        C : in  STD_LOGIC;
        Q : inout STD_LOGIC;
        Q_bar : inout STD_LOGIC);
end D_latch;

architecture Structural of D_latch is
    component SR_latch
    Port ( S, R, C : in STD_LOGIC; Q, Q_bar : inout STD_LOGIC);
end component;

component NAND_gate
Port ( a, b : in STD_LOGIC; c : out STD_LOGIC);
end component;

signal not_D : STD_LOGIC;
begin
    -- Inverter: D NAND D = NOT D
    Inv1: NAND_gate port map (a => D, b => D, c => not_D);

    U_SR: SR_latch port map (
        S => D,
        R => not_D,
        C => C,
        Q => Q,
        Q_bar => Q_bar
    );
end Structural;
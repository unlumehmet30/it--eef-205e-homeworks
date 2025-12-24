library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JK_latch is
    Port ( J : in  STD_LOGIC;
        K : in  STD_LOGIC;
        C : in  STD_LOGIC;
        Q : inout STD_LOGIC;
        Q_bar : inout STD_LOGIC);
end JK_latch;

architecture Structural of JK_latch is
    component SR_latch_without_C
    Port ( S_bar, R_bar : in STD_LOGIC; Q, Q_bar : inout STD_LOGIC);
end component;

component NAND_3
Port ( A, B, C : in STD_LOGIC; D : out STD_LOGIC);
end component;

signal s_bar_in, r_bar_in : STD_LOGIC;
begin
    -- S_bar = (J.C.Q_bar)'
    NAND3_J: NAND_3 port map (A => J, B => C, C => Q_bar, D => s_bar_in);
    
    -- R_bar = (K.C.Q)'
    NAND3_K: NAND_3 port map (A => K, B => C, C => Q, D => r_bar_in);

    Core: SR_latch_without_C port map (
        S_bar => s_bar_in,
        R_bar => r_bar_in,
        Q => Q,
        Q_bar => Q_bar
    );
end Structural;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SR_latch is
    Port ( S : in  STD_LOGIC;
        R : in  STD_LOGIC;
        C : in  STD_LOGIC; -- Control / Enable
        Q : inout STD_LOGIC;
        Q_bar : inout STD_LOGIC);
end SR_latch;

architecture Structural of SR_latch is
    component NAND_gate
    Port ( a, b : in STD_LOGIC; c : out STD_LOGIC);
end component;

component SR_latch_without_C
Port ( S_bar, R_bar : in STD_LOGIC; Q, Q_bar : inout STD_LOGIC);
end component;

signal s_nand_out, r_nand_out : STD_LOGIC;
begin
    -- Giriş Kontrol Mantığı (NAND Gates)
    NAND1: NAND_gate port map (a => S, b => C, c => s_nand_out);
    NAND2: NAND_gate port map (a => R, b => C, c => r_nand_out);

    -- Çekirdek Latch Çağrısı
    Core_Latch: SR_latch_without_C port map (
        S_bar => s_nand_out,
        R_bar => r_nand_out,
        Q => Q,
        Q_bar => Q_bar
    );
end Structural;
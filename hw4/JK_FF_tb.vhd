library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JK_FF is
    Port ( J : in  STD_LOGIC;
        K : in  STD_LOGIC;
        Clk : in  STD_LOGIC;
        Q : out STD_LOGIC;
        Q_bar : out STD_LOGIC);
end JK_FF;

architecture Structural of JK_FF is
    -- Master olarak JK Latch
    component JK_latch
    Port ( J, K, C : in STD_LOGIC; Q, Q_bar : inout STD_LOGIC);
end component;

    -- Slave olarak SR Latch (Daha stabil bir yapı için)
component SR_latch
Port ( S, R, C : in STD_LOGIC; Q, Q_bar : inout STD_LOGIC);
end component;

component NAND_gate
Port ( a, b : in STD_LOGIC; c : out STD_LOGIC);
end component;

signal Q_m, Q_bar_m : STD_LOGIC;
signal Clk_inv : STD_LOGIC;
begin
    -- Clock Inverter
    Inv_C: NAND_gate port map (a => Clk, b => Clk, c => Clk_inv);

    -- Master: JK Latch (Clk '1' iken J ve K'yı işler)
    Master: JK_latch port map (
        J => J, K => K, C => Clk,
        Q => Q_m, Q_bar => Q_bar_m
    );

    -- Slave: SR Latch (Clk '0' (Clk_inv '1') iken Master verisini dışarı aktarır)
    -- Master'ın Q çıkışı Slave'in S girişine, Q_bar çıkışı R girişine gider.
    Slave: SR_latch port map (
        S => Q_m, R => Q_bar_m, C => Clk_inv,
        Q => Q, Q_bar => Q_bar
    );
end Structural;
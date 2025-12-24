library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_FF is
    Port ( D : in  STD_LOGIC;
        Clk : in  STD_LOGIC;
        Q : out STD_LOGIC;      -- Burası OUT
        Q_bar : out STD_LOGIC); -- Burası OUT
end D_FF;

architecture Structural of D_FF is
    component D_latch
    Port ( D, C : in STD_LOGIC; Q, Q_bar : inout STD_LOGIC);
end component;

component NAND_gate
Port ( a, b : in STD_LOGIC; c : out STD_LOGIC);
end component;

signal Q_m, Q_bar_m : STD_LOGIC; -- Master outputs
signal Clk_not : STD_LOGIC;

    -- Düzeltme: inout portları out porta bağlamak için ara sinyaller
signal Q_internal, Q_bar_internal : STD_LOGIC;
begin
    -- Clock Inverter
    Inv_Clk: NAND_gate port map (a => Clk, b => Clk, c => Clk_not);

    -- Master Latch (Clk = '1')
    Master: D_latch port map (D => D, C => Clk, Q => Q_m, Q_bar => Q_bar_m);
    
    -- Slave Latch (Clk = '0' yani Clk_not = '1')
    Slave: D_latch port map (D => Q_m, C => Clk_not, Q => Q_internal, Q_bar => Q_bar_internal);

    -- Sinyalleri çıkışa aktar
    Q <= Q_internal;
    Q_bar <= Q_bar_internal;
end Structural;
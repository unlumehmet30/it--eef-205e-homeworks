library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Top-level Entity
entity ChemicalSafety_Structural is
    Port (
        L : in  std_logic; -- Liquid Level (High)
        T : in  std_logic; -- Temperature (High)
        P : in  std_logic; -- Pressure (High)
        M : in  std_logic; -- Manual Override (Active)
        A : out std_logic; -- Alarm (Active)
        V : out std_logic  -- Relief Valve (Open)
    );
end ChemicalSafety_Structural;

-- Architecture using Structural Modeling
architecture Structural_Logic of ChemicalSafety_Structural is

    -- 1. Component Declarations (Gate Modules)
    component inv_gate
    Port (I : in STD_LOGIC; O : out STD_LOGIC);
end component;

component and2_gate
Port (I1 : in STD_LOGIC; I2 : in STD_LOGIC; O : out STD_LOGIC);
end component;

component or2_gate
Port (I1 : in STD_LOGIC; I2 : in STD_LOGIC; O : out STD_LOGIC);
end component;

    -- 2. Internal Signals (Wires) for interconnecting the components
signal s_not_M      : std_logic; -- M' for Alarm
signal s_TP         : std_logic; -- T AND P
signal s_L_or_TP    : std_logic; -- L OR (T AND P)
signal s_TL         : std_logic; -- T AND L
signal s_M_or_P     : std_logic; -- M OR P (Intermediate for V)

begin

    -------------------------------------------------------
    -- A: ALARM LOGIC (A = M' AND (L OR (T AND P)))
    -------------------------------------------------------

    -- U1: NOT M (M')
    U1_NOT_M : inv_gate
    port map (I => M, O => s_not_M);

    -- U2: T AND P (s_TP)
    U2_AND_TP : and2_gate
    port map (I1 => T, I2 => P, O => s_TP);

    -- U3: L OR s_TP (s_L_or_TP)
    U3_OR_L_TP : or2_gate
    port map (I1 => L, I2 => s_TP, O => s_L_or_TP);

    -- U4: M' AND s_L_or_TP (Final A output)
    U4_AND_A : and2_gate
    port map (I1 => s_not_M, I2 => s_L_or_TP, O => A);


    -------------------------------------------------------
    -- V: RELIEF VALVE LOGIC (V = M OR P OR (T AND L))
    -------------------------------------------------------

    -- U5: T AND L (s_TL)
    U5_AND_TL : and2_gate
    port map (I1 => T, I2 => L, O => s_TL);

    -- U6: M OR P (s_M_or_P)
    U6_OR_MP : or2_gate
    port map (I1 => M, I2 => P, O => s_M_or_P);

    -- U7: s_M_or_P OR s_TL (Final V output)
    U7_OR_V : or2_gate
    port map (I1 => s_M_or_P, I2 => s_TL, O => V);

end Structural_Logic;

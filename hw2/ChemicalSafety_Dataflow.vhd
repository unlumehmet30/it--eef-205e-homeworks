library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity declaration for the Chemical Safety System
entity ChemicalSafety_Dataflow is
    Port (
        L : in  std_logic; -- Liquid Level (High)
        T : in  std_logic; -- Temperature (High)
        P : in  std_logic; -- Pressure (High)
        M : in  std_logic; -- Manual Override (Active)
        A : out std_logic; -- Alarm (Active)
        V : out std_logic  -- Relief Valve (Open)
    );
end ChemicalSafety_Dataflow;

-- Architecture using Dataflow Modeling (Concurrent Assignments)
architecture Dataflow_Logic of ChemicalSafety_Dataflow is
begin
    -- 1. ALARM (A) LOGIC: A = M' AND (L OR (T AND P))
    -- Rule: Alarm is active if Override is inactive (NOT M) AND (Liquid is High OR (Temp AND Pressure are both High)).
    A <= (NOT M) AND (L OR (T AND P));

    -- 2. RELIEF VALVE (V) LOGIC: V = M OR P OR (T AND L)
    -- Rule: Valve is open if Override is active (M) OR Pressure is High (P) OR (Temperature AND Liquid are both High).
    V <= M OR P OR (T AND L);

end Dataflow_Logic;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RCA_4BIT_STRUCTURAL is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0); -- 4-bit Giriş A
        B : in  STD_LOGIC_VECTOR (3 downto 0); -- 4-bit Giriş B
        C_out : out STD_LOGIC_VECTOR (4 downto 0)); -- 5-bit Sonuç (C4 S3 S2 S1 S0)
end RCA_4BIT_STRUCTURAL;

architecture Structural of RCA_4BIT_STRUCTURAL is
    
    -- BİLEŞEN BEYANLARI (HA ve FA'yı kullanacağımızı belirtiyoruz)
    component HALF_ADDER
    Port ( A : in STD_LOGIC; B : in STD_LOGIC; S : out STD_LOGIC; Cout : out STD_LOGIC);
end component;

component FULL_ADDER
Port ( A : in STD_LOGIC; B : in STD_LOGIC; Cin : in STD_LOGIC; S : out STD_LOGIC; Cout : out STD_LOGIC);
end component;

    -- Elde (Carry) sinyallerini HA/FA'lar arasında taşımak için iç sinyal tanımlamaları
signal C_internal : STD_LOGIC_VECTOR (2 downto 0); -- C0, C1, C2

begin
    -- 1. Aşama (Bit 0): Half Adder (HA)
    -- C_out0 --> C_internal(0)
    HA_0: HALF_ADDER
    port map (
        A => A(0),
        B => B(0),
        S => C_out(0),          -- Toplamın 0. biti
        Cout => C_internal(0)   -- C0 (FA1'in Cin'i)
    );

    -- 2. Aşama (Bit 1): Full Adder 1 (FA1)
    -- Cin1 --> C_internal(0), Cout1 --> C_internal(1)
    FA_1: FULL_ADDER
    port map (
        A => A(1),
        B => B(1),
        Cin => C_internal(0),   -- C0
        S => C_out(1),          -- Toplamın 1. biti
        Cout => C_internal(1)   -- C1 (FA2'nin Cin'i)
    );

    -- 3. Aşama (Bit 2): Full Adder 2 (FA2)
    -- Cin2 --> C_internal(1), Cout2 --> C_internal(2)
    FA_2: FULL_ADDER
    port map (
        A => A(2),
        B => B(2),
        Cin => C_internal(1),   -- C1
        S => C_out(2),          -- Toplamın 2. biti
        Cout => C_internal(2)   -- C2 (FA3'ün Cin'i)
    );

    -- 4. Aşama (Bit 3): Full Adder 3 (FA3)
    -- Cin3 --> C_internal(2), Cout3 --> C_out(4)
    FA_3: FULL_ADDER
    port map (
        A => A(3),
        B => B(3),
        Cin => C_internal(2),   -- C2
        S => C_out(3),          -- Toplamın 3. biti
        Cout => C_out(4)        -- C3 (En son elde, 5. bit C4'e atanır)
    );
    
end Structural;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Testbench Varlığı
entity FULL_ADDER_TB is
end FULL_ADDER_TB;

architecture Behavioral of FULL_ADDER_TB is
    -- Test edilecek bileşenin (FA) tanımlanması
    component FULL_ADDER
    Port ( A : in  STD_LOGIC;
        B : in  STD_LOGIC;
        Cin : in  STD_LOGIC;
        S : out STD_LOGIC;
        Cout : out STD_LOGIC);
end component;

    -- Sinyal tanımlamaları
signal A_TB, B_TB, Cin_TB : STD_LOGIC := '0';
signal S_TB, Cout_TB : STD_LOGIC;

    -- Zaman sabiti
constant Clock_Period : time := 10 ns;

begin
    -- Test edilecek bileşenin bağlanması (Instance)
    uut: FULL_ADDER
    port map (
        A => A_TB,
        B => B_TB,
        Cin => Cin_TB,
        S => S_TB,
        Cout => Cout_TB
    );

    -- Giriş Vektörlerini Üreten İşlem (Stimulus)
    stim_proc: process
    begin
        -- Tüm 8 kombinasyonu sırayla uygula (000'dan 111'e)
        
        -- 0. A=0, B=0, Cin=0
        wait for Clock_Period;

        -- 1. A=0, B=0, Cin=1
        Cin_TB <= '1';
        wait for Clock_Period;
        
        -- 2. A=0, B=1, Cin=0
        B_TB <= '1';
        Cin_TB <= '0';
        wait for Clock_Period;

        -- 3. A=0, B=1, Cin=1
        Cin_TB <= '1';
        wait for Clock_Period;

        -- 4. A=1, B=0, Cin=0
        A_TB <= '1';
        B_TB <= '0';
        Cin_TB <= '0';
        wait for Clock_Period;

        -- 5. A=1, B=0, Cin=1
        Cin_TB <= '1';
        wait for Clock_Period;

        -- 6. A=1, B=1, Cin=0
        B_TB <= '1';
        Cin_TB <= '0';
        wait for Clock_Period;
        
        -- 7. A=1, B=1, Cin=1
        Cin_TB <= '1';
        wait for Clock_Period;

        -- Simülasyonu sonlandır
        wait;
    end process;
end Behavioral;
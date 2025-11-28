library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Sadece simülasyon amacıyla kullanılır, sentezlenemez.
entity HALF_ADDER_TB is
end HALF_ADDER_TB;

architecture Behavioral of HALF_ADDER_TB is
    -- Test edilecek bileşenin (HA) tanımlanması
    component HALF_ADDER
    Port ( A : in  STD_LOGIC;
        B : in  STD_LOGIC;
        S : out STD_LOGIC; -- Sum
        Cout : out STD_LOGIC); -- Carry Out
end component;

    -- Sinyal tanımlamaları (HA'nın giriş/çıkışlarını bağlamak için)
signal A_TB, B_TB : STD_LOGIC := '0'; -- Başlangıçta 0 atanır
signal S_TB, Cout_TB : STD_LOGIC;

    -- Simülasyon için zaman sabiti
constant Clock_Period : time := 10 ns;

begin
    -- Test edilecek bileşenin bağlanması (Instance)
    uut: HALF_ADDER
    port map (
        A => A_TB,
        B => B_TB,
        S => S_TB,
        Cout => Cout_TB
    );

    -- Giriş Vektörlerini Üreten İşlem (Stimulus)
    stim_proc: process
    begin
        -- Başlangıç (A=0, B=0)
        wait for Clock_Period;

        -- Test 1: A=0, B=1
        B_TB <= '1';
        wait for Clock_Period;
        
        -- Test 2: A=1, B=0
        A_TB <= '1';
        B_TB <= '0';
        wait for Clock_Period;

        -- Test 3: A=1, B=1
        B_TB <= '1';
        wait for Clock_Period;

        -- Simülasyonu sonlandır
        wait;
    end process;
end Behavioral;
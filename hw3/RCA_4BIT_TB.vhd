library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RCA_4BIT_TB is
end RCA_4BIT_TB;

architecture Behavioral of RCA_4BIT_TB is
    
    component RCA_4BIT_STRUCTURAL
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
        B : in  STD_LOGIC_VECTOR (3 downto 0);
        C_out : out STD_LOGIC_VECTOR (4 downto 0));
end component;

signal A_TB, B_TB : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
signal C_out_TB : STD_LOGIC_VECTOR (4 downto 0);

constant Delay : time := 100 ns;

begin
    uut: RCA_4BIT_STRUCTURAL
    port map (
        A => A_TB,
        B => B_TB,
        C_out => C_out_TB
    );

    stim_proc: process
    begin
        -- Test 1: 5 + 3 = 8 (0101 + 0011 = 01000)
        A_TB <= "0101";
        B_TB <= "0011";
        wait for Delay;

        -- Test 2: 15 + 1 = 16 (1111 + 0001 = 10000)
        A_TB <= "1111";
        B_TB <= "0001";
        wait for Delay;
        
        -- Test 3: 15 + 15 = 30 (1111 + 1111 = 11110)
        A_TB <= "1111";
        B_TB <= "1111";
        wait for Delay;

        wait;
    end process;
end Behavioral;
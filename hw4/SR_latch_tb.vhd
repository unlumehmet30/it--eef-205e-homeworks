library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SR_latch_tb is
end SR_latch_tb;

architecture Behavioral of SR_latch_tb is
    component SR_latch
    Port ( S, R, C : in STD_LOGIC; Q, Q_bar : inout STD_LOGIC);
end component;
signal S, R, C : STD_LOGIC := '0';
signal Q, Q_bar : STD_LOGIC;
begin
    uut: SR_latch port map (S, R, C, Q, Q_bar);
    process begin
        C <= '1'; S <= '1'; R <= '0'; wait for 20 ns; -- Set
        C <= '0'; S <= '0'; R <= '0'; wait for 20 ns; -- Hold (C=0)
        C <= '1'; S <= '0'; R <= '1'; wait for 20 ns; -- Reset
        wait;
    end process;
end Behavioral;
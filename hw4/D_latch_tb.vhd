library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_latch_tb is
end D_latch_tb;

architecture Behavioral of D_latch_tb is
    component D_latch
    Port ( D, C : in STD_LOGIC; Q, Q_bar : inout STD_LOGIC);
end component;
signal D, C : STD_LOGIC := '0';
signal Q, Q_bar : STD_LOGIC;
begin
    uut: D_latch port map (D, C, Q, Q_bar);
    process begin
        C <= '1'; D <= '1'; wait for 20 ns; -- Transparent High
        C <= '1'; D <= '0'; wait for 20 ns; -- Transparent Low
        C <= '0'; D <= '1'; wait for 20 ns; -- Latch (Hold previous 0)
        wait;
    end process;
end Behavioral;
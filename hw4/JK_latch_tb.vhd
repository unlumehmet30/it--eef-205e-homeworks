library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JK_latch_tb is
end JK_latch_tb;

architecture Behavioral of JK_latch_tb is
    component JK_latch
    Port ( J, K, C : in STD_LOGIC; Q, Q_bar : inout STD_LOGIC);
end component;
signal J, K, C : STD_LOGIC := '0';
signal Q, Q_bar : STD_LOGIC;
begin
    uut: JK_latch port map (J, K, C, Q, Q_bar);
    process begin
        -- Initial Reset
        J <= '0'; K <= '1'; C <= '1'; wait for 20 ns;
        -- Toggle state
        J <= '1'; K <= '1'; C <= '1'; wait for 20 ns;
        -- Hold
        C <= '0'; wait for 20 ns;
        wait;
    end process;
end Behavioral;
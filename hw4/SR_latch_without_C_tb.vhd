library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SR_latch_without_C_tb is
end SR_latch_without_C_tb;

architecture Behavioral of SR_latch_without_C_tb is
    component SR_latch_without_C
    Port ( S_bar, R_bar : in STD_LOGIC;
        Q, Q_bar : inout STD_LOGIC);
end component;

signal S_bar, R_bar : STD_LOGIC := '1';
signal Q, Q_bar : STD_LOGIC;
begin
    uut: SR_latch_without_C port map (S_bar => S_bar, R_bar => R_bar, Q => Q, Q_bar => Q_bar);

    stim_proc: process
    begin
        wait for 20 ns;
        S_bar <= '0'; R_bar <= '1'; -- Set
        wait for 20 ns;
        S_bar <= '1'; R_bar <= '1'; -- Hold
        wait for 20 ns;
        S_bar <= '1'; R_bar <= '0'; -- Reset
        wait for 20 ns;
        S_bar <= '1'; R_bar <= '1'; -- Hold
        wait;
    end process;
end Behavioral;
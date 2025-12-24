library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_FF_tb is
end D_FF_tb;

architecture Behavioral of D_FF_tb is
    component D_FF
    Port ( D, Clk : in STD_LOGIC; Q, Q_bar : out STD_LOGIC);
end component;
signal D : STD_LOGIC := '0';
signal Clk : STD_LOGIC := '0';
signal Q, Q_bar : STD_LOGIC;
begin
    uut: D_FF port map (D, Clk, Q, Q_bar);
    
    -- Clock generation
    Clk <= not Clk after 10 ns;

    process begin
        wait for 15 ns;
        D <= '1'; wait for 20 ns;
        D <= '0'; wait for 20 ns;
        wait;
    end process;
end Behavioral;
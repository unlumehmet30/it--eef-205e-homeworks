library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ChemicalSafety_Dataflow_tb is
    -- Testbench does not have any ports
end ChemicalSafety_Dataflow_tb;

architecture Behavioral of ChemicalSafety_Dataflow_tb is

    -- Component Declaration for the Design Under Test (DUT)
    component ChemicalSafety_Dataflow
    Port (
        L : in  std_logic;
        T : in  std_logic;
        P : in  std_logic;
        M : in  std_logic;
        A : out std_logic;
        V : out std_logic
    );
end component;

    -- Internal Signals for input and output ports
signal L_tb, T_tb, P_tb, M_tb : std_logic := '0';
signal A_tb, V_tb             : std_logic;

    -- Clock period definition (Time constant for simulation)
constant C_CLK_PERIOD : time := 10 ns;

begin

    -- Instantiate the Design Under Test (DUT)
    DUT : ChemicalSafety_Dataflow
    port map (
        L => L_tb,
        T => T_tb,
        P => P_tb,
        M => M_tb,
        A => A_tb,
        V => V_tb
    );

    -- Process to generate the test vectors
    P_TEST_VECTORS: process
    begin
        -- Input order for vectors: M, L, T, P (standard binary sequence)

        -- M L T P (Decimal) | A_exp | V_exp | Description
        
        -- State 0: 0000 | 0 | 0
        M_tb <= '0'; L_tb <= '0'; T_tb <= '0'; P_tb <= '0'; wait for C_CLK_PERIOD;
        
        -- State 1: 0001 | 0 | 1
        M_tb <= '0'; L_tb <= '0'; T_tb <= '0'; P_tb <= '1'; wait for C_CLK_PERIOD;
        
        -- State 2: 0010 | 0 | 0
        M_tb <= '0'; L_tb <= '0'; T_tb <= '1'; P_tb <= '0'; wait for C_CLK_PERIOD;
        
        -- State 3: 0011 | 1 | 1 (A is active: T.P=1)
        M_tb <= '0'; L_tb <= '0'; T_tb <= '1'; P_tb <= '1'; wait for C_CLK_PERIOD;
        
        -- State 4: 0100 | 1 | 0 (A is active: L=1)
        M_tb <= '0'; L_tb <= '1'; T_tb <= '0'; P_tb <= '0'; wait for C_CLK_PERIOD;
        
        -- State 5: 0101 | 1 | 1 (A:L=1; V:P=1)
        M_tb <= '0'; L_tb <= '1'; T_tb <= '0'; P_tb <= '1'; wait for C_CLK_PERIOD;
        
        -- State 6: 0110 | 1 | 1 (A:L=1; V:T.L=1)
        M_tb <= '0'; L_tb <= '1'; T_tb <= '1'; P_tb <= '0'; wait for C_CLK_PERIOD;
        
        -- State 7: 0111 | 1 | 1 (All sensors high)
        M_tb <= '0'; L_tb <= '1'; T_tb <= '1'; P_tb <= '1'; wait for C_CLK_PERIOD;
        
        -- States 8-15: M=1 (Override)
        
        -- State 8: 1000 | 0 | 1 (V is active: M=1)
        M_tb <= '1'; L_tb <= '0'; T_tb <= '0'; P_tb <= '0'; wait for C_CLK_PERIOD;
        
        -- State 9: 1001 | 0 | 1
        M_tb <= '1'; L_tb <= '0'; T_tb <= '0'; P_tb <= '1'; wait for C_CLK_PERIOD;
        
        -- State 10: 1010 | 0 | 1
        M_tb <= '1'; L_tb <= '0'; T_tb <= '1'; P_tb <= '0'; wait for C_CLK_PERIOD;
        
        -- State 11: 1011 | 0 | 1
        M_tb <= '1'; L_tb <= '0'; T_tb <= '1'; P_tb <= '1'; wait for C_CLK_PERIOD;
        
        -- State 12: 1100 | 0 | 1
        M_tb <= '1'; L_tb <= '1'; T_tb <= '0'; P_tb <= '0'; wait for C_CLK_PERIOD;
        
        -- State 13: 1101 | 0 | 1
        M_tb <= '1'; L_tb <= '1'; T_tb <= '0'; P_tb <= '1'; wait for C_CLK_PERIOD;
        
        -- State 14: 1110 | 0 | 1
        M_tb <= '1'; L_tb <= '1'; T_tb <= '1'; P_tb <= '0'; wait for C_CLK_PERIOD;
        
        -- State 15: 1111 | 0 | 1
        M_tb <= '1'; L_tb <= '1'; T_tb <= '1'; P_tb <= '1'; wait for C_CLK_PERIOD;
        
        -- End of simulation
        wait;
    end process;

end Behavioral;


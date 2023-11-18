library ieee;
use ieee.std_logic_1164.ALL;
 
entity clockdivider_tb IS
end clockdivider_tb;
 
architecture behavior of clockdivider_tb IS
  
component clockdivider
PORT(
clk : IN std_logic;
rst : IN std_logic;
clk_out : OUT std_logic
);
END component;
 
signal clk_t : std_logic := '0';
signal clk_out_t : std_logic;
signal rst_t : std_logic := '0';

constant clk_period : time := 10 ns;

begin
uut: clockdivider PORT MAP (
clk => clk_t,
rst => rst_t,
clk_out => clk_out_t
);

    process 
    begin
    clk_t <= '0';
    wait for clk_period / 2;
    clk_t <= '1';
    wait for clk_period / 2;
    end process;
    
    process 
    begin
    rst_t <= '1';
    wait for 0.05sec;
    rst_t <= '0';
    wait for 10sec;
    end process;
end;

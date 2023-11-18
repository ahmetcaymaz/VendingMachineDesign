library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity buttonsynchronizer_tb is
end buttonsynchronizer_tb;

architecture Behavioral of buttonsynchronizer_tb is

component buttonsynchronizer is
 Port ( 
 clk : in std_logic;
 rst : in std_logic;
 bi : in std_logic;
 bo : out std_logic
 );
end component;

signal clk_t : std_logic;
signal rst_t : std_logic;
signal bi_t : std_logic;
signal bo_t : std_logic;

constant clk_period : time := 10ns;

begin
UUT: buttonsynchronizer PORT MAP (
clk => clk_t,
rst => rst_t,
bi => bi_t,
bo => bo_t
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
    wait for 15ns;
    rst_t <= '0';
    wait for 1000ns;
    end process;
    
    process 
    begin
    bi_t <= '0';
    wait for 35ns;
    bi_t <= '1';
    wait for 80ns;
    bi_t <= '0';
    wait for 40ns;
    bi_t <= '1';
    wait for 20ns;
    end process;
end Behavioral;

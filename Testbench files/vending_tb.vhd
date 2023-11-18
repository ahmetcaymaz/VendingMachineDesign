library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity vending_tb is
end vending_tb;

architecture Behavioral of vending_tb is
component vending is
  Port (
  clk, rst : in std_logic;
  nickle, dime : in std_logic;
  candy, coinreturn : out std_logic;
  number : out std_logic_vector (5 downto 0)
  );
end component;

signal clk_t, rst_t, nickle_t, dime_t : std_logic := '0';
signal candy_t, coinreturn_t : std_logic;
signal number_t : std_logic_vector (5 downto 0) := "000000";

constant clk_in_period : time := 20ns;

begin
UUT: vending PORT MAP (
clk => clk_t,
rst => rst_t,
nickle => nickle_t,
dime => dime_t,
candy => candy_t,
coinreturn => coinreturn_t,
number => number_t
);
    clk_process :process
    begin
    clk_t <= '0';
    wait for clk_in_period/2;
    clk_t <= '1';
    wait for clk_in_period/2;
    end process;
    
    rst_process :process
    begin
    rst_t <= '1';
    wait for 15ns;
    rst_t <= '0';
    wait for 180ns;
    rst_t <= '1';
    wait for 20ns;
    rst_t <= '0';
    wait for 120ns;
    rst_t <= '1';
    wait for 20ns;
    rst_t <= '0';
    wait;
    end process;
    
    nickle_process: process
    begin
    nickle_t <= '0';
    wait for 215ns;
    nickle_t <= '1';
    wait for 20ns;
    nickle_t <= '0';
    wait for 140ns;
    nickle_t <= '1';
    wait for 200ns;
    nickle_t <= '0';
    wait;
    end process;
    
    dime_process: process
    begin
    dime_t <= '0';
    wait for 35ns;
    dime_t <= '1';
    wait for 60ns;
    dime_t <= '0';
    wait for 40ns;
    dime_t <= '1';
    wait for 20ns;
    dime_t <= '0';
    wait for 80ns;
    dime_t <= '1';
    wait for 80ns;
    dime_t <= '0';
    wait for 180ns;
    dime_t <= '1';
    wait for 40ns;
    dime_t <= '0';
    wait;
    end process;
    
end Behavioral;

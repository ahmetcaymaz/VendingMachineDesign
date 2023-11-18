library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity topleveldesign_tb is
end topleveldesign_tb;

architecture Behavioral of topleveldesign_tb is

component topleveldesign is
Port (
 clk,reset,nickle,dime : in std_logic;
 candy,coinreturn : out std_logic;
 out7 : out std_logic_vector (6 downto 0);
 en_out : out std_logic_vector (3 downto 0)
  );
end component;

signal clk_t, reset_t, nickle_t, dime_t : std_logic := '0';
signal candy_t, coinreturn_t : std_logic := '0';
signal out7_t : std_logic_vector (6 downto 0) := "0000000";
signal en_out_t : std_logic_vector (3 downto 0) := "1110";


constant clk_in_period : time := 10ns;

begin
UUT: topleveldesign PORT MAP (
clk => clk_t,
reset => reset_t,
nickle => nickle_t,
dime => dime_t,
candy => candy_t,
coinreturn => coinreturn_t,
out7 => out7_t,
en_out => en_out_t
--clk_100hz => clk_100hz_t,
--number => number_t,
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
    reset_t <= '1';
    wait for 15ms;
    reset_t <= '0';
    wait for 180ms;
    reset_t <= '1';
    wait for 20ms;
    reset_t <= '0';
    wait for 120ms;
    reset_t <= '1';
    wait for 20ms;
    reset_t <= '0';
    wait;
    end process;
    
    nickle_process: process
    begin
    nickle_t <= '0';
    wait for 215ms;
    nickle_t <= '1';
    wait for 10ms;
    nickle_t <= '0';
    wait for 135ms;
    nickle_t <= '1';
    wait for 20ms;
    nickle_t <= '0';
    wait for 10ms;
    nickle_t <= '1';
    wait for 10ms;
    nickle_t <= '0';
    wait for 10ms;
    nickle_t <= '1';
    wait for 10ms;
    nickle_t <= '0';
    wait for 10ms;
    nickle_t <= '1';
    wait for 10ms;
    nickle_t <= '0';
    wait for 10ms;
    nickle_t <= '1';
    wait for 10ms;
    nickle_t <= '0';
    wait for 10ms;
    nickle_t <= '1';
    wait for 10ms;
    nickle_t <= '0';
    wait for 10ms;
    nickle_t <= '1';
    wait for 10ms;
    nickle_t <= '0';
    wait for 10ms;
    nickle_t <= '1';
    wait for 10ms;
    nickle_t <= '0';
    wait for 10ms;
    nickle_t <= '1';
    wait for 10ms;
    nickle_t <= '0';
    wait for 10ms;
    nickle_t <= '1';
    wait for 10ms;
    nickle_t <= '0';
    wait;
    end process;
    
    dime_process: process
    begin
    dime_t <= '0';
    wait for 20ms;
    dime_t <= '1';
    wait for 10ms;
    dime_t <= '0';
    wait for 10ms;
    dime_t <= '1';
    wait for 10ms;
    dime_t <= '0';
    wait for 10ms;
    dime_t <= '1';
    wait for 10ms;
    dime_t <= '0';
    wait for 45ms;
    dime_t <= '1';
    wait for 20ms;
    dime_t <= '0';
    wait for 95ms;
    dime_t <= '1';
    wait for 10ms;
    dime_t <= '0';
    wait for 10ms;
    dime_t <= '1';
    wait for 10ms;
    dime_t <= '0';
    wait for 10ms;
    dime_t <= '1';
    wait for 10ms;
    dime_t <= '0';
    wait for 10ms;
    dime_t <= '1';
    wait for 10ms;
    dime_t <= '0';
    wait for 130ms;
    dime_t <= '1';
    wait for 10ms;
    dime_t <= '0';
    wait for 10ms;
    dime_t <= '1';
    wait for 10ms;
    dime_t <= '0'; 
    wait;
    end process;

end Behavioral;

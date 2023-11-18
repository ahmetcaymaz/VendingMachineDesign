library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity topleveldesign is
 Port (
 clk,reset,nickle,dime : in std_logic;
 candy,coinreturn : out std_logic;
 out7 : out std_logic_vector (6 downto 0);
 en_out : out std_logic_vector (3 downto 0)
  );
end topleveldesign;

architecture Behavioral of topleveldesign is

component clockdivider is
port(
    clk : in std_logic;
    rst : in std_logic;
    clk_out: out std_logic
    );
end component;

component buttonsynchronizer is
port(
     clk : in std_logic;
     rst : in std_logic;
     bi : in std_logic;
     bo : out std_logic
     );
end component;

component vending is
Port (
  clk, rst : in std_logic;
  nickle, dime : in std_logic;
  candy, coinreturn : out std_logic;
  number : out std_logic_vector (5 downto 0)
  );
end component;

component twodigitdisplay is
Port (
        clk : in std_logic;
        number : in std_logic_vector (5 downto 0);
        out7 : out std_logic_vector (6 downto 0);
        en_out : out std_logic_vector(3 downto 0)
    );
end component;

signal clockdivider_out : std_logic := '0'; -- 100hz clock signal
signal clockdivider_rst : std_logic := '0'; -- '0' reset for clock divider
signal nickel_out_buttonsyc : std_logic := '0'; -- Button Syc. Out Of Nickle, goes to vending nickle input
signal dime_out_buttonsyc : std_logic := '0'; -- Button Syc. Out Of Dime, goes to vending dime input
signal candy_out_vending : std_logic; -- Candy out from Vending SubComponent, will be final "candy output" of system.
signal coinreturn_out_vending : std_logic; -- Coin Return out from Vending SubComponent, will be final "Coin Return" output of system.
signal number_out_vending : std_logic_vector (5 downto 0) := "000000"; -- Number out of Vending Subcomponent, goes to TwoDigitDisplay input
signal out7_out_twodigit : std_logic_vector (6 downto 0) := "0000000"; -- 7 Segment Number Output from TwoDigitDisplay, will be final "out7" output of system.
signal en_out_twodigit : std_logic_vector (3 downto 0) := "0000"; -- Anode Displaying Output from TwoDigitDisplay, will be final "en_out" output of system.


begin

--Clock Divider Integration
ClockdividerPort: clockdivider port map(clk => clk,rst => clockdivider_rst, clk_out => clockdivider_out);


-- Button Sychronizer Integration
ButtonSychronizerNickle : buttonsynchronizer port map (clk => clockdivider_out, rst => reset ,bi => nickle  , bo => nickel_out_buttonsyc);
ButtonSychronizerDime : buttonsynchronizer port map (clk => clockdivider_out, rst =>reset ,bi => dime , bo => dime_out_buttonsyc);

-- Vending Machine Integration
VendingMachinePort : vending port map (clk => clockdivider_out , rst => reset , nickle => nickel_out_buttonsyc, dime => dime_out_buttonsyc , candy =>  candy_out_vending, coinreturn => coinreturn_out_vending, number => number_out_vending);

candy <= candy_out_vending;-- Candy output taken from VendingSubcomponent
coinreturn <= coinreturn_out_vending;-- Coin Return output taken from VendingSubcomponent


-- TwoDigitDisplay Integration
TwoDigitDisplayPort : twodigitdisplay port map(clk => clk,number => number_out_vending,out7 => out7_out_twodigit,en_out => en_out_twodigit);
out7 <= out7_out_twodigit; -- out7 output taken from TwoDigitDisplay SubComponent
en_out <= en_out_twodigit; -- en_out output taken from TwoDigitDisplay SubComponent
end Behavioral;

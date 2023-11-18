library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TwoDigitDisplay is
    Port (
        clk : in std_logic;
        number : in std_logic_vector (5 downto 0);
        out7 : out std_logic_vector (6 downto 0);
        en_out : out std_logic_vector(3 downto 0)
    );
end TwoDigitDisplay;

architecture Behavioral of TwoDigitDisplay is

component caymazSevenSegment is
port( 
numin : in std_logic_vector(3 downto 0);
segout : out std_logic_vector(6 downto 0)
);
end component;

signal decimalval : integer range 0 to 99;
signal decimal_msb : integer range 0 to 9;
signal decimal_lsb : integer range 0 to 9;
signal segment_msb : std_logic_vector (3 downto 0):= "0000";
signal segment_lsb : std_logic_vector (3 downto 0):= "0000";
signal msb_decoder_out : std_logic_vector(6 downto 0) := "0000000";
signal lsb_decoder_out : std_logic_vector(6 downto 0) := "0000000";

begin
process(number)
begin
    decimalval <= to_integer(unsigned(number));
end process;

decimal_msb <= decimalval / 10;
decimal_lsb <= decimalval rem 10;

segment_msb <= std_logic_vector(to_unsigned(decimal_msb, 4));
segment_lsb <= std_logic_vector(to_unsigned(decimal_lsb, 4));

segment_msb_display : caymazSevenSegment port map(numin => segment_msb, segout => msb_decoder_out);
segment_lsb_display : caymazSevenSegment port map(numin => segment_lsb, segout => lsb_decoder_out);


process(clk)
begin
    if (clk = '1') then
    en_out <= "1110";
    out7 <= lsb_decoder_out;
    else
    en_out <= "1101";
    out7 <= msb_decoder_out;
    end if;
end process;
end Behavioral;

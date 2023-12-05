library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TwoDigitDisplay is
    Port ( 
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           number: in STD_LOGIC_VECTOR (5 downto 0);
           AnodeSelection: out STD_LOGIC_VECTOR (3 downto 0);
           segout : out STD_LOGIC_VECTOR (6 downto 0));
end TwoDigitDisplay;

architecture Behavioral of TwoDigitDisplay is

component caymazSevenSegment is
port(
  numin : in std_logic_vector(3 downto 0);
  segout : out std_logic_vector (6 downto 0)
);
end component;


signal refresh_rate: STD_LOGIC_VECTOR (1 downto 0);
signal binary_coded_decimal: STD_LOGIC_VECTOR (3 downto 0);
signal clk_divider: STD_LOGIC_VECTOR(22 downto 0):= (others=>'0');

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


Clock_Divider:process(rst,clk)
begin
    if(rst='1') then
        clk_divider   <= (others=>'0');
    elsif(CLK'event and CLK='1') then
        clk_divider   <= clk_divider + 1;
  end if;    
end process;
refresh_rate<= clk_divider(11 downto 10);

Anode_Selection:process(refresh_rate)
begin
    case refresh_rate is

        when "00" => AnodeSelection <= "1110";
                     binary_coded_decimal <= segment_lsb(3 downto 0);                            
        when "01" => AnodeSelection <= "1101";
                     binary_coded_decimal <= segment_msb(3 downto 0);                       
        when others => AnodeSelection <= "1111";
    end case;
end process;

SevenSegmentDecoder : caymazSevenSegment port map(numin => binary_coded_decimal, segout => segout);

end Behavioral;

--Segment_Display_Decoder:process(binary_coded_decimal)
--begin
--    case binary_coded_decimal is
--        when "0000" => displaySevenSegment <= "0000001";      
--        when "0001" => displaySevenSegment <= "1001111";  
--        when "0010" => displaySevenSegment <= "0010010";  
--        when "0011" => displaySevenSegment <= "0000110";  
--        when "0100" => displaySevenSegment <= "1001100";  
--        when "0101" => displaySevenSegment <= "0100100";  
--        when "0110" => displaySevenSegment <= "0100000";  
--        when "0111" => displaySevenSegment <= "0001111";  
--        when "1000" => displaySevenSegment <= "0000000";      
--        when "1001" => displaySevenSegment <= "0000100";
--        when others => displaySevenSegment <= "1111111";
--    end case;       
  




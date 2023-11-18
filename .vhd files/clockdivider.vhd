library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
  
entity clockdivider is
    port ( 
    clk : in std_logic;
    rst : in std_logic;
    clk_out: out std_logic
    );
end clockdivider;
  
architecture bhv of clockdivider is
  
signal count: integer:=1;
signal logicvalue : std_logic := '0';
  
begin
  
process(rst,clk)
begin
    if (rst = '1') then
    count<=1;
    logicvalue<='0';
    elsif(clk'event and clk='1') then
    count <=count+1;
    
    if (count = 500000) then
    logicvalue <= NOT logicvalue;
    count <= 1;
    end if;
    end if;
clk_out <= logicvalue;
end process;
end bhv;
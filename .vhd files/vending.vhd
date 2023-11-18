library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity vending is
  Port (
  clk, rst : in std_logic;
  nickle, dime : in std_logic;
  candy, coinreturn : out std_logic;
  number : out std_logic_vector (5 downto 0)
  );
end vending;

architecture Behavioral of vending is

type state_type is (S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10);
signal present_state, next_state: state_type;
begin
    process(rst,clk)
    begin
    if (clk'event and clk = '1') then
        if (rst = '1') then
        present_state <= S0;
        else 
        present_state <= next_state;
        end if;
    end if;
    end process;
    
    -- State Outputs
    process(present_state)
    begin
        case present_state is
        when S0 =>
        candy <= '0';
        coinreturn <= '0';
        number <= "000000";
        when S1 =>
        candy <= '0';
        coinreturn <= '0';
        number <= "000101";
        when S2 =>
        candy <= '0';
        coinreturn <= '0';
        number <= "001010";
        when S3 =>
        candy <= '0';
        coinreturn <= '0'; 
        number <= "001010";    
        when S4 =>
        candy <= '0';
        coinreturn <= '0';
        number <= "001111";
        when S5 =>
        candy <= '0';
        coinreturn <= '0';
        number <= "010100";
        when S6 =>
        candy <= '0';
        coinreturn <= '0'; 
        number <= "011001";  
        when S7 =>
        candy <= '0';
        coinreturn <= '0';
        number <= "011110";
        when S8 =>
        candy <= '0';
        coinreturn <= '0';
        number <= "100011";
        when S9 =>
        candy <= '1';
        coinreturn <= '0';
        number <= "101000";
        when S10 =>
        candy <= '1';
        coinreturn <= '1';
        number <= "101101";
        end case;
    end process;
    
    process(clk,nickle,dime)
    begin
        case present_state is
        when S0 =>
        if nickle = '1' and dime = '1' then next_state <= S0;
        elsif nickle = '1' then next_state <= S1;
        elsif dime = '1' then next_state <= S2;
        else next_state <= S0;
        end if;
        when S1 =>
        if nickle = '1' and dime = '1' then next_state <= S1;
        elsif nickle = '1' then next_state <= S3;
        elsif dime = '1' then next_state <= S4;
        else next_state <= S1;
        end if;
        when S2 =>
        if nickle = '1' and dime = '1' then next_state <= S2;
        elsif nickle = '1' then next_state <= S4;
        elsif dime = '1' then next_state <= S5;
        else next_state <= S2;
        end if;
        when S3 =>
        if nickle = '1' and dime = '1' then next_state <= S3;
        elsif nickle = '1' then next_state <= S4;
        elsif dime = '1' then next_state <= S5;
        else next_state <= S3;
        end if;      
        when S4 =>
        if nickle = '1' and dime = '1' then next_state <= S4;
        elsif nickle = '1' then next_state <= S5;
        elsif dime = '1' then next_state <= S6;
        else next_state <= S4;
        end if;
        when S5 =>
        if nickle = '1' and dime = '1' then next_state <= S5;
        elsif nickle = '1' then next_state <= S6;
        elsif dime = '1' then next_state <= S7;
        else next_state <= S5;
        end if;
        when S6 =>
        if nickle = '1' and dime = '1' then next_state <= S6;
        elsif nickle = '1' then next_state <= S7;
        elsif dime = '1' then next_state <= S8;
        else next_state <= S6;  
        end if;
        when S7 =>
        if nickle = '1' and dime = '1' then next_state <= S7;
        elsif nickle = '1' then next_state <= S8;
        elsif dime = '1' then next_state <= S9;
        else next_state <= S7;  
        end if;
        when S8 =>
        if nickle = '1' and dime = '1' then next_state <= S8;
        elsif nickle = '1' then next_state <= S9;
        elsif dime = '1' then next_state <= S10;
        else next_state <= S8;  
        end if;
        when S9 => next_state <= S9;
        if nickle = '1' and dime = '1' then next_state <= S9; 
        elsif nickle = '1' then next_state <= S10;
        elsif dime = '1' then next_state <= S10;
        else next_state <= S9; 
        end if; 
        when S10 => next_state <= S10; 
        end case;
    end process;
end Behavioral;

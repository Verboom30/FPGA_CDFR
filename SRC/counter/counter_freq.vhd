library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- 1us puls generator 
entity counter_freq is
 
  Port (  
          CLK 	    : in  std_logic ; 
          RST       : in  std_logic ;
          CNT       : out std_logic_vector(15 downto 0)
        );
end counter_freq;

architecture rtl of counter_freq is
    signal counter              : unsigned (15 downto 0);
begin

    counter_freq: process(RST, CLK)
    begin 
      if(RST ='1') then
        counter <= (others => '0');
      elsif(rising_edge(CLK))then
        if(counter = x"FFFE")then
          counter <= (others => '0');
        else
          counter <= counter + 1;
        end if;
        CNT <=std_logic_vector(counter);
      end if;
    end process counter_freq;
end rtl;
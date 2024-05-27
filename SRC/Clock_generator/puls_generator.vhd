library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity puls_generator is
  Port (  
          CLK 	    : in  std_logic ; --100M
          RST       : in  std_logic ;
          FREQ      : in  std_logic_vector(15 downto 0); -- 1 to 65 535 Hz
          PULS      : out std_logic 
        );
end puls_generator;

architecture rtl of puls_generator is
	signal counter : unsigned (15 downto 0);
begin

  puls_generator: process(RST, CLK)
    begin 
      if(RST ='1') then
        PULS    <= '0';
        counter <= (others => '0');
      elsif(rising_edge(CLK))then
        if(counter = (1/(unsigned(FREQ)+1))*100_000_000)then
          PULS    <= '1';
          counter <= (others => '0');
        else
          PULS    <= '0';
          counter <= counter + 1;
        end if;
      end if;
    end process puls_generator;
end rtl;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use work.holonome_pkg.all;

-- 1us puls generator 
entity puls_generator is
  generic(
    PLUS_LENGTH   : natural    := 1 -- length in us
  );
  Port (  
          CLK 	    : in  std_logic ; --100M
          RST       : in  std_logic ;
          FREQ      : in  std_logic_vector(15 downto 0); -- 1 to 65 535 Hz
          PULS      : out std_logic -- 1us puls
        );
end puls_generator;

architecture rtl of puls_generator is
  -- Max Number of clk periods for 1 period :
    constant PULSE_MAXCNT     : natural := CLK_FREQ      ;
    constant PULSE_MAXCNT_L2  : natural := natural(log2(real(PULSE_MAXCNT)))  ;

    signal counter            : unsigned (PULSE_MAXCNT_L2+1 downto 0)         ;
begin
  puls_generator: process(RST, CLK)
    begin 
      if(RST ='1') then
        PULS    <= '0';
        counter <= (others => '0');
      elsif(rising_edge(CLK))then

        if(counter >= to_unsigned(CLK_FREQ/(to_integer(unsigned(FREQ))+1),counter'length))then
          counter <= (others => '0');
        else
          counter <= counter + 1;
        end if;

        if(counter < to_unsigned((CLK_FREQ/(to_integer(unsigned(FREQ))+1)) - PLUS_LENGTH*ONE_US ,counter'length))then
          PULS    <= '0';
        else
          PULS    <= '1';
        end if;
      end if;
    end process puls_generator;
end rtl;
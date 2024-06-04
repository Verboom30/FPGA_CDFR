library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Clock_manager is
  Port (  
          CLK 	    : in  STD_LOGIC ;
          RESET     : in  STD_LOGIC ;
          CLK_3K    : out STD_LOGIC 
        
        );
end Clock_manager;

architecture rtl of Clock_manager is
	signal counter_3K : unsigned (31 downto 0);
  signal clk_3k_i : std_logic;

begin

  proc_3K:process(RESET, CLK)
  begin
    if(RESET ='1') then
      clk_3k_i <= '0';
      counter_3K <= (others => '0');
    elsif (rising_edge(CLK)) then
      if(counter_3K <= 5000-1) then
        counter_3K  <= counter_3K + 1;
      else
        clk_3k_i      <= not clk_3k_i;
        counter_3K <= (others => '0');
      end if;
    end if;
  end process proc_3K;

  CLK_3K <= clk_3k_i;
  
end rtl;
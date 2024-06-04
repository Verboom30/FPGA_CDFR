----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.03.2021 14:06:28
-- Design Name: 
-- Module Name: top_vga - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;



entity top_fpga is
  port( 
        CLK100M : in std_logic;
        RST     : in std_logic; 
        JB      : out std_logic_vector(7 downto 0)
      );
end top_fpga;

architecture Behavioral of top_fpga is
 signal cnt_freq : std_logic_vector(15 downto 0);
 signal clk_3k : std_logic;
  
begin  

  puls_generator : entity  work.puls_generator
    generic map(
      PLUS_LENGTH   => 10
    )
    port map(
              CLK => CLK100M,
              RST => RST,
              FREQ => x"03E8",
              PULS => JB(0)
            ); 


  counter_freq : entity  work.counter_freq
    port map(
              CLK => clk_3k,
              RST => RST,
              CNT => cnt_freq 
            ); 

  clk_mngt : entity  work.Clock_manager
    port map(
      CLK => CLK100M,
      RESET => RST,
      CLK_3K => clk_3k
    ); 
    JB(7 downto 1) <= (others => '0');
end Behavioral;


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
        led     : out std_logic
      );
end top_fpga;

architecture Behavioral of top_fpga is
  
begin  

  puls_generator : entity  work.puls_generator
    port map(
              CLK => CLK100M,
              RST => RST,
              FREQ => x"03E8",
              PULS => led
            ); 
 
end Behavioral;


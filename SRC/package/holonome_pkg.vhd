library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
package holonome_pkg is

 constant CLK_FREQ  : natural := 100_000_000                ;
 constant ONE_MS    : natural := CLK_FREQ/1000              ;
 constant ONE_US    : natural := CLK_FREQ/1000_000          ;
 constant ONE_US_L2 : natural := natural(log2(real(ONE_US)));
    
end package holonome_pkg;
package body holonome_pkg is
end package body holonome_pkg;
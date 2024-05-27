-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 27.5.2024 19:39:07 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_top_fpga is
end tb_top_fpga;

architecture tb of tb_top_fpga is

    component top_fpga
        port (CLK100M : in std_logic;
              RST     : in std_logic);
    end component;

    signal CLK100M : std_logic;
    signal RST     : std_logic;

    constant TbPeriod : time := 10 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : top_fpga
    port map (CLK100M => CLK100M,
              RST     => RST);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that CLK100M is really your main clock signal
    CLK100M <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed

        -- Reset generation
        -- EDIT: Check that RST is really your reset signal
        RST <= '1';
        wait for 100 ns;
        RST <= '0';
        wait for 100 ns;

        -- EDIT Add stimuli here
        wait for 1000000000 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_top_fpga of tb_top_fpga is
    for tb
    end for;
end cfg_tb_top_fpga;
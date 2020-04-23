----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
----------------------------------------------------------------------------------
entity TB_TOP is
end TB_TOP;
----------------------------------------------------------------------------------
architecture Behavioral of TB_TOP is
----------------------------------------------------------------------------------

COMPONENT TOP
  PORT (
    clk             : IN  STD_LOGIC;
    btn_i           : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
    sw_i            : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
    led_o           : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    disp_seg_o      : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    disp_dig_o      : OUT STD_LOGIC_VECTOR (4 DOWNTO 0)
  );
  END COMPONENT;

  ----------------------------------------------------------------------------------

  CONSTANT clk_period       : TIME := 20 ns;

  -- UUT inputs
  SIGNAL clk                : STD_LOGIC := '0';
  SIGNAL btn_i              : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
  SIGNAL sw_i               : STD_LOGIC_VECTOR (3 DOWNTO 0) := (others => '0');

  -- UUT outputs
  SIGNAL led_o              : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL disp_seg_o         : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL disp_dig_o         : STD_LOGIC_VECTOR (4 DOWNTO 0);

----------------------------------------------------------------------------------
begin
--------------------------------------------------------------------------------

  clk_gen: PROCESS
  BEGIN
    clk <= '0';
    WAIT FOR clk_period/2;
    clk <= '1';
    WAIT FOR clk_period/2;
  END PROCESS;

  --------------------------------------------------------------------------------

  UUT : TOP
  PORT MAP(
    clk         => clk,
    btn_i       => btn_i,
    sw_i        => sw_i,
    led_o       => led_o,
    disp_seg_o  => disp_seg_o,
    disp_dig_o  => disp_dig_o
  );

  TOP_module_input_emulator: PROCESS
  BEGIN

    btn_i(0) <= '0';
    btn_i(1) <= '0';
    WAIT FOR 30ms;

    btn_i(0) <= '0';
    btn_i(1) <= '1';
    WAIT FOR 30ms; -- LAP - nemelo by to nikam jit, stale stav IDLE

    btn_i(0) <= '0';
    btn_i(1) <= '0';
    WAIT FOR 100ms;

    btn_i(0) <= '1';
    btn_i(1) <= '0';
    WAIT FOR 30ms;   -- RUN - pocita to 

    btn_i(0) <= '0';
    btn_i(1) <= '0';
    WAIT FOR 100ms;

    btn_i(0) <= '0';
    btn_i(1) <= '1';
    WAIT FOR 30ms;   -- LAP 

    btn_i(0) <= '0';
    btn_i(1) <= '0';
    WAIT FOR 100ms;

    btn_i(0) <= '0';
    btn_i(1) <= '1';
    WAIT FOR 30ms;   -- LAP refresh

    btn_i(0) <= '0';
    btn_i(1) <= '0';
    WAIT FOR 100ms;

    btn_i(0) <= '1';
    btn_i(1) <= '0';
    WAIT FOR 30ms;   -- z LAP na RUN

    btn_i(0) <= '0';
    btn_i(1) <= '0';
    WAIT FOR 100ms;

    btn_i(0) <= '1';
    btn_i(1) <= '0';
    WAIT FOR 30ms;   -- STOP 

    btn_i(0) <= '0';
    btn_i(1) <= '0';
    WAIT FOR 100ms;

    btn_i(0) <= '1';
    btn_i(1) <= '0';
    WAIT FOR 30ms;   -- zpet na RUN

    btn_i(0) <= '0';
    btn_i(1) <= '0';
    WAIT FOR 100ms;

    btn_i(0) <= '1';
    btn_i(1) <= '0';
    WAIT FOR 30ms;   -- Stop 

    btn_i(0) <= '0';
    btn_i(1) <= '0';
    WAIT FOR 100ms;

    btn_i(0) <= '0';
    btn_i(1) <= '1';
    WAIT FOR 30ms;   -- IDLE



    REPORT "================================================================" SEVERITY NOTE;
    REPORT "Simulation finished!" SEVERITY NOTE;
    REPORT "================================================================" SEVERITY FAILURE;
  END PROCESS TOP_module_input_emulator;



end Behavioral;

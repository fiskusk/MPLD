----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
----------------------------------------------------------------------------------
entity TB_stopwatch_FSM is
end TB_stopwatch_FSM;
----------------------------------------------------------------------------------
architecture Behavioral of TB_stopwatch_FSM is
----------------------------------------------------------------------------------

  COMPONENT stopwatch_FSM
  PORT (
    clk             : IN  STD_LOGIC;
    Btn_S_i         : IN  STD_LOGIC;
    Btn_L_i         : IN  STD_LOGIC;
    cnt_reset       : OUT STD_LOGIC;
    cnt_enable      : OUT STD_LOGIC;
    disp_enable     : OUT STD_LOGIC
  );
  END COMPONENT;

  --------------------------------------------------------------------------------

  CONSTANT clk_period       : TIME := 10 ns;

  -- UUT inputs
  SIGNAL clk                : STD_LOGIC := '0';
  SIGNAL Btn_S_i            : STD_LOGIC := '0';
  SIGNAL Btn_L_i            : STD_LOGIC := '0';

  -- UUT outputs
  SIGNAL cnt_reset          : STD_LOGIC;
  SIGNAL cnt_enable         : STD_LOGIC;
  SIGNAL disp_enable        : STD_LOGIC;

----------------------------------------------------------------------------------
begin
----------------------------------------------------------------------------------

  UUT : stopwatch_FSM
  PORT MAP(
    clk             => clk,
    Btn_S_i         => Btn_S_i,
    Btn_L_i         => Btn_L_i,
    cnt_reset       => cnt_reset,
    cnt_enable      => cnt_enable,
    disp_enable     => disp_enable
  );

  --------------------------------------------------------------------------------

  clk_gen: PROCESS
  BEGIN
    clk <= '0';
    WAIT FOR clk_period/2;
    clk <= '1';
    WAIT FOR clk_period/2;
  END PROCESS;

  --------------------------------------------------------------------------------

  FSM_input_emulator: PROCESS
  BEGIN

    Btn_S_i <= '0';
    Btn_L_i <= '0';
    WAIT FOR clk_period * 10;

    REPORT "================================================================" SEVERITY NOTE;
    REPORT "Simulation finished!" SEVERITY NOTE;
    REPORT "================================================================" SEVERITY FAILURE;
  END PROCESS FSM_input_emulator;

----------------------------------------------------------------------------------
end Behavioral;
----------------------------------------------------------------------------------

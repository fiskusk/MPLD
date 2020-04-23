----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
----------------------------------------------------------------------------------
ENTITY TB_btn_in IS
END TB_btn_in;
----------------------------------------------------------------------------------
ARCHITECTURE Behavioral OF TB_btn_in IS
----------------------------------------------------------------------------------

  COMPONENT btn_in
  GENERIC(
    DEB_PERIOD          : INTEGER := 10);
  PORT(
    clk                 : IN  STD_LOGIC;
    ce                  : IN  STD_LOGIC;
    btn_i               : IN  STD_LOGIC;
    btn_deb_o           : OUT STD_LOGIC;
    btn_posedge_o       : OUT STD_LOGIC;
    btn_negedge_o       : OUT STD_LOGIC;
    btn_edge_o          : OUT STD_LOGIC);
  END COMPONENT;

  --------------------------------------------------------------------------------

  COMPONENT ce_gen
  GENERIC(
    DIV_FACT        : POSITIVE := 2);
  PORT (
    clk             : IN  STD_LOGIC;
    srst            : IN  STD_LOGIC;
    ce              : IN  STD_LOGIC;
    ce_o            : OUT STD_LOGIC);
  END COMPONENT;

  --------------------------------------------------------------------------------

  CONSTANT clk_period       : TIME := 10 ns;

  -- Inputs
  SIGNAL clk                : STD_LOGIC := '0';
  SIGNAL ce                 : STD_LOGIC := '0';
  SIGNAL btn_i              : STD_LOGIC := '0';

  -- Outputs
  SIGNAL btn_deb_o          : STD_LOGIC;
  SIGNAL btn_posedge_o      : STD_LOGIC;
  SIGNAL btn_negedge_o      : STD_LOGIC;
  SIGNAL btn_edge_o         : STD_LOGIC;

----------------------------------------------------------------------------------
BEGIN
----------------------------------------------------------------------------------

  ce_gen_i : ce_gen
  GENERIC MAP(
    DIV_FACT            => 10
  )
  PORT MAP(
    clk                 => clk,
    srst                => '0',
    ce                  => '1',
    ce_o                => ce
  );

  --------------------------------------------------------------------------------

  UUT : btn_in
  GENERIC MAP(
    DEB_PERIOD          => 5
  )
  PORT MAP(
    clk                 => clk,
    ce                  => ce,
    btn_i               => btn_i,
    btn_deb_o           => btn_deb_o,
    btn_posedge_o       => btn_posedge_o,
    btn_negedge_o       => btn_negedge_o,
    btn_edge_o          => btn_edge_o
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

    btn_i <= '0'; WAIT FOR clk_period * 100;
    btn_i <= '1'; WAIT FOR clk_period * 1;
    btn_i <= '0'; WAIT FOR clk_period * 10;
    btn_i <= '1'; WAIT FOR clk_period * 20;
    btn_i <= '0'; WAIT FOR clk_period * 10;
    btn_i <= '1'; WAIT FOR clk_period * 30;
    btn_i <= '0'; WAIT FOR clk_period * 20;
    btn_i <= '1'; WAIT FOR clk_period * 5;
    btn_i <= '0'; WAIT FOR clk_period * 10;
    btn_i <= '1'; WAIT FOR clk_period * 5000;


    btn_i <= '0'; WAIT FOR clk_period * 1;
    btn_i <= '1'; WAIT FOR clk_period * 10;
    btn_i <= '0'; WAIT FOR clk_period * 20;
    btn_i <= '1'; WAIT FOR clk_period * 10;
    btn_i <= '0'; WAIT FOR clk_period * 30;
    btn_i <= '1'; WAIT FOR clk_period * 20;
    btn_i <= '0'; WAIT FOR clk_period * 5;
    btn_i <= '1'; WAIT FOR clk_period * 10;
    btn_i <= '0'; WAIT FOR clk_period * 5000;

    REPORT "================================================================" SEVERITY NOTE;
    REPORT "Simulation finished!" SEVERITY NOTE;
    REPORT "================================================================" SEVERITY FAILURE;
  END PROCESS FSM_input_emulator;

----------------------------------------------------------------------------------
END Behavioral;
----------------------------------------------------------------------------------

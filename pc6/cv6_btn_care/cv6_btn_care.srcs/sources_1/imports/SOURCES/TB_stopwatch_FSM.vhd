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

  -- UUT inputs
  SIGNAL clk                : STD_LOGIC := '0';

  -- UUT outputs
  SIGNAL cnt_reset          : STD_LOGIC;
  SIGNAL cnt_enable         : STD_LOGIC;
  SIGNAL disp_enable        : STD_LOGIC;

  signal btn                : STD_LOGIC_VECTOR (1 downto 0);
  signal s_btn_deb          : STD_LOGIC_VECTOR (1 downto 0);
  signal s_btn_posedge      : STD_LOGIC_VECTOR (1 downto 0);
  signal s_btn_negedge      : STD_LOGIC_VECTOR (1 downto 0);
  signal s_btn_edge         : STD_LOGIC_VECTOR (1 downto 0);
  signal s_ce               : STD_LOGIC;

----------------------------------------------------------------------------------
begin
----------------------------------------------------------------------------------

  ce_gen_i : ce_gen
  GENERIC MAP(
    DIV_FACT            => 5
  )
  PORT MAP(
    clk                 => clk,
    srst                => '0',
    ce                  => '1',
    ce_o                => s_ce
  );

  --------------------------------------------------------------------------------

  gen_btn_in : FOR i IN 0 TO 1 GENERATE
    btn_in_inst: btn_in 
    GENERIC MAP(
      DEB_PERIOD      => 5
    )
    PORT MAP(
      clk           => clk,
      ce            => s_ce,
      btn_i         => btn(i),
      btn_deb_o     => s_btn_deb(i),
      btn_posedge_o => s_btn_posedge(i),
      btn_negedge_o => s_btn_negedge(i),
      btn_edge_o    => s_btn_edge(i)
    );
    END GENERATE gen_btn_in;

  UUT : stopwatch_FSM
  PORT MAP(
    clk             => clk,
    Btn_S_i         => s_btn_posedge(0),
    Btn_L_i         => s_btn_posedge(1),
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

    btn(0) <= '0';
    btn(1) <= '0';
    WAIT FOR clk_period * 100;

    btn(0) <= '0';
    btn(1) <= '1';
    WAIT FOR clk_period * 100; -- LAP - nemelo by to nikam jit, stale stav IDLE

    btn(0) <= '0';
    btn(1) <= '0';
    WAIT FOR clk_period * 100;

    btn(0) <= '1';
    btn(1) <= '0';
    WAIT FOR clk_period * 100;   -- RUN - počita to 

    btn(0) <= '0';
    btn(1) <= '0';
    WAIT FOR clk_period * 100;

    btn(0) <= '0';
    btn(1) <= '1';
    WAIT FOR clk_period * 100;   -- LAP 

    btn(0) <= '0';
    btn(1) <= '0';
    WAIT FOR clk_period * 100;

    btn(0) <= '0';
    btn(1) <= '1';
    WAIT FOR clk_period * 100;   -- LAP refresh

    btn(0) <= '0';
    btn(1) <= '0';
    WAIT FOR clk_period * 100;

    btn(0) <= '1';
    btn(1) <= '0';
    WAIT FOR clk_period * 100;   -- z LAP na RUN

    btn(0) <= '0';
    btn(1) <= '0';
    WAIT FOR clk_period * 100;

    btn(0) <= '1';
    btn(1) <= '0';
    WAIT FOR clk_period * 100;   -- STOP 

    btn(0) <= '0';
    btn(1) <= '0';
    WAIT FOR clk_period * 100;

    btn(0) <= '1';
    btn(1) <= '0';
    WAIT FOR clk_period * 100;   -- zpět na RUN

    btn(0) <= '0';
    btn(1) <= '0';
    WAIT FOR clk_period * 100;

    btn(0) <= '1';
    btn(1) <= '0';
    WAIT FOR clk_period * 100;   -- Stop 

    btn(0) <= '0';
    btn(1) <= '0';
    WAIT FOR clk_period * 100;

    btn(0) <= '0';
    btn(1) <= '1';
    WAIT FOR clk_period * 100;   -- IDLE



    REPORT "================================================================" SEVERITY NOTE;
    REPORT "Simulation finished!" SEVERITY NOTE;
    REPORT "================================================================" SEVERITY FAILURE;
  END PROCESS FSM_input_emulator;

----------------------------------------------------------------------------------
end Behavioral;
----------------------------------------------------------------------------------

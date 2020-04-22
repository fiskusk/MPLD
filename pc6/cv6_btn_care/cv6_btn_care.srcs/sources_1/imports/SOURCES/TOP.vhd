----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
----------------------------------------------------------------------------------
ENTITY TOP IS
  PORT(
    clk             : IN  STD_LOGIC;
    btn_i           : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
    sw_i            : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
    led_o           : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    disp_seg_o      : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    disp_dig_o      : OUT STD_LOGIC_VECTOR (4 DOWNTO 0)
  );
END TOP;
----------------------------------------------------------------------------------
ARCHITECTURE Structural OF TOP IS
----------------------------------------------------------------------------------

  COMPONENT seg_disp_driver
  PORT(
    clk             : IN  STD_LOGIC;
    dig_1_i         : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
    dig_2_i         : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
    dig_3_i         : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
    dig_4_i         : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
    dp_i            : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);        -- [DP4 DP3 DP2 DP1]
    dots_i          : IN  STD_LOGIC_VECTOR (2 DOWNTO 0);        -- [L3 L2 L1]
    disp_seg_o      : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    disp_dig_o      : OUT STD_LOGIC_VECTOR (4 DOWNTO 0)
  );
  END COMPONENT;

  ------------------------------------------------------------------------------

  COMPONENT btn_in
  GENERIC(
    DEB_PERIOD          : INTEGER := 10
  );
  PORT(
    clk                 : IN  STD_LOGIC;
    ce                  : IN  STD_LOGIC;
    btn_i               : IN  STD_LOGIC;
    btn_deb_o           : OUT STD_LOGIC;
    btn_posedge_o       : OUT STD_LOGIC;
    btn_negedge_o       : OUT STD_LOGIC;
    btn_edge_o          : OUT STD_LOGIC
  );
  END COMPONENT;

  --------------------------------------------------------------------------------

  COMPONENT ce_gen
  GENERIC(
    DIV_FACT        : POSITIVE := 2
  );
  PORT (
    clk             : IN  STD_LOGIC;
    srst            : IN  STD_LOGIC;
    ce              : IN  STD_LOGIC;
    ce_o            : OUT STD_LOGIC
  );
  END COMPONENT;

  ------------------------------------------------------------------------------

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

  COMPONENT counter_BCD
  PORT(
    clk             : IN  STD_LOGIC;
    clk_EN_100Hz    : IN  STD_LOGIC;
    srst            : IN  STD_LOGIC;
    count_en        : IN  STD_LOGIC;
    second_BCD_H    : OUT STD_LOGIC_VECTOR( 3 DOWNTO 0);        -- seconds
    second_BCD_L    : OUT STD_LOGIC_VECTOR( 3 DOWNTO 0);
    hthsec_BCD_H    : OUT STD_LOGIC_VECTOR( 3 DOWNTO 0);        -- hundredth of a second
    hthsec_BCD_L    : OUT STD_LOGIC_VECTOR( 3 DOWNTO 0);
    led_o           : OUT STD_LOGIC_VECTOR( 7 DOWNTO 0)
  );
  END COMPONENT;

  --------------------------------------------------------------------------------

  COMPONENT display_reg
  PORT(
    clk             : IN  STD_LOGIC;
    disp_enable     : IN  STD_LOGIC;
    second_BCD_H_i  : IN  STD_LOGIC_VECTOR( 3 DOWNTO 0);
    second_BCD_L_i  : IN  STD_LOGIC_VECTOR( 3 DOWNTO 0);
    hthsec_BCD_H_i  : IN  STD_LOGIC_VECTOR( 3 DOWNTO 0);
    hthsec_BCD_L_i  : IN  STD_LOGIC_VECTOR( 3 DOWNTO 0);
    second_BCD_H_o  : OUT STD_LOGIC_VECTOR( 3 DOWNTO 0);
    second_BCD_L_o  : OUT STD_LOGIC_VECTOR( 3 DOWNTO 0);
    hthsec_BCD_H_o  : OUT STD_LOGIC_VECTOR( 3 DOWNTO 0);
    hthsec_BCD_L_o  : OUT STD_LOGIC_VECTOR( 3 DOWNTO 0)
  );
  END COMPONENT;

  --------------------------------------------------------------------------------

  SIGNAL clk_en_100Hz       : STD_LOGIC;

  SIGNAL second_BCD_H       : STD_LOGIC_VECTOR( 3 DOWNTO 0);        -- seconds
  SIGNAL second_BCD_L       : STD_LOGIC_VECTOR( 3 DOWNTO 0);
  SIGNAL hthsec_BCD_H       : STD_LOGIC_VECTOR( 3 DOWNTO 0);        -- hundredth of a second
  SIGNAL hthsec_BCD_L       : STD_LOGIC_VECTOR( 3 DOWNTO 0);

  SIGNAL dig_1_i            : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL dig_2_i            : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL dig_3_i            : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL dig_4_i            : STD_LOGIC_VECTOR (3 DOWNTO 0);

  SIGNAL cnt_reset          : STD_LOGIC;
  SIGNAL cnt_enable         : STD_LOGIC;
  SIGNAL disp_enable        : STD_LOGIC;

----------------------------------------------------------------------------------
BEGIN
----------------------------------------------------------------------------------

  ce_gen_i : ce_gen
  GENERIC MAP(
    DIV_FACT            => 500000
  )
  PORT MAP(
    clk                 => clk,
    srst                => '0',
    ce                  => '1',
    ce_o                => clk_en_100Hz
  );

  --------------------------------------------------------------------------------

--btn_in_i : btn_in
--GENERIC MAP(
--  DEB_PERIOD          => 
--)
--PORT MAP(
--  clk                 => ,
--  ce                  => ,
--  btn_i               => ,
--  btn_deb_o           => ,
--  btn_posedge_o       => ,
--  btn_negedge_o       => ,
--  btn_edge_o          => 
--);

  --------------------------------------------------------------------------------

--StopWatch_control_FSM_i : stopwatch_FSM
--PORT MAP(
--  clk                 => ,
--  Btn_S_i             => ,
--  Btn_L_i             => ,
--  cnt_reset           => ,
--  cnt_enable          => ,
--  disp_enable         => 
--);

  --------------------------------------------------------------------------------

  citac_BCD_i : counter_BCD
  PORT MAP(
    clk                 => clk,
    clk_en_100Hz        => clk_en_100Hz,
    srst                => cnt_reset,
    count_en            => cnt_enable,
    second_BCD_H        => second_BCD_H,
    second_BCD_L        => second_BCD_L,
    hthsec_BCD_H        => hthsec_BCD_H,
    hthsec_BCD_L        => hthsec_BCD_L,
    led_o               => led_o
  );

  --------------------------------------------------------------------------------

  disp_out_REG_i : display_reg
  PORT MAP(
    clk                 => clk,
    disp_enable         => disp_enable,
    second_BCD_H_i      => second_BCD_H,
    second_BCD_L_i      => second_BCD_L,
    hthsec_BCD_H_i      => hthsec_BCD_H,
    hthsec_BCD_L_i      => hthsec_BCD_L,
    second_BCD_H_o      => dig_1_i,
    second_BCD_L_o      => dig_2_i,
    hthsec_BCD_H_o      => dig_3_i,
    hthsec_BCD_L_o      => dig_4_i
  );

  --------------------------------------------------------------------------------
  --
  --       DIG 1       DIG 2       DIG 3       DIG 4
  --                                       L3
  --       -----       -----       -----   o   -----
  --      |     |     |     |  L1 |     |     |     |
  --      |     |     |     |  o  |     |     |     |
  --       -----       -----       -----       -----
  --      |     |     |     |  o  |     |     |     |
  --      |     |     |     |  L2 |     |     |     |
  --       -----  o    -----  o    -----  o    -----  o
  --             DP1         DP2         DP3         DP4
  --
  --------------------------------------------------------------------------------

  seg_disp_driver_i : seg_disp_driver
  PORT MAP(
    clk                 => clk,
    dig_1_i             => dig_1_i,
    dig_2_i             => dig_2_i,
    dig_3_i             => dig_3_i,
    dig_4_i             => dig_4_i,
    dp_i                => "0000",
    dots_i              => "011",
    disp_seg_o          => disp_seg_o,
    disp_dig_o          => disp_dig_o
  );

----------------------------------------------------------------------------------
END Structural;
----------------------------------------------------------------------------------

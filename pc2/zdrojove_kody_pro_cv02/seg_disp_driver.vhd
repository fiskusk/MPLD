----------------------------------------------------------------------------------
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

  COMPONENT btn_control
  PORT(
    clk             : IN  STD_LOGIC;
    btn_i           : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
    operand_1       : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    operand_2       : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
  );
  END COMPONENT;

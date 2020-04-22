--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
--------------------------------------------------------------------------------
entity display_reg is
  Port(
    clk             : IN    STD_LOGIC;
    disp_enable     : IN    STD_LOGIC;

    second_BCD_H_i  : IN    STD_LOGIC_VECTOR( 3 DOWNTO 0);
    second_BCD_L_i  : IN    STD_LOGIC_VECTOR( 3 DOWNTO 0);
    hthsec_BCD_H_i  : IN    STD_LOGIC_VECTOR( 3 DOWNTO 0);
    hthsec_BCD_L_i  : IN    STD_LOGIC_VECTOR( 3 DOWNTO 0);

    second_BCD_H_o  : OUT   STD_LOGIC_VECTOR( 3 DOWNTO 0);
    second_BCD_L_o  : OUT   STD_LOGIC_VECTOR( 3 DOWNTO 0);
    hthsec_BCD_H_o  : OUT   STD_LOGIC_VECTOR( 3 DOWNTO 0);
    hthsec_BCD_L_o  : OUT   STD_LOGIC_VECTOR( 3 DOWNTO 0)
  );
end display_reg;
--------------------------------------------------------------------------------
architecture Behavioral of display_reg is
--------------------------------------------------------------------------------

  SIGNAL second_BCD_H_reg       : STD_LOGIC_VECTOR( 3 DOWNTO 0) := (OTHERS => '0');
  SIGNAL second_BCD_L_reg       : STD_LOGIC_VECTOR( 3 DOWNTO 0) := (OTHERS => '0');
  SIGNAL hthsec_BCD_H_reg       : STD_LOGIC_VECTOR( 3 DOWNTO 0) := (OTHERS => '0');
  SIGNAL hthsec_BCD_L_reg       : STD_LOGIC_VECTOR( 3 DOWNTO 0) := (OTHERS => '0');

--------------------------------------------------------------------------------
begin
--------------------------------------------------------------------------------

  PROCESS (clk) BEGIN
    IF rising_edge(clk) THEN
      IF disp_enable = '1' THEN
        second_BCD_H_reg <= second_BCD_H_i;
        second_BCD_L_reg <= second_BCD_L_i;
        hthsec_BCD_H_reg <= hthsec_BCD_H_i;
        hthsec_BCD_L_reg <= hthsec_BCD_L_i;
      END IF;
    END IF;
  END PROCESS;

  ------------------------------------------------------------------------------

  second_BCD_H_o <= second_BCD_H_reg;
  second_BCD_L_o <= second_BCD_L_reg;
  hthsec_BCD_H_o <= hthsec_BCD_H_reg;
  hthsec_BCD_L_o <= hthsec_BCD_L_reg;

--------------------------------------------------------------------------------
end Behavioral;
--------------------------------------------------------------------------------

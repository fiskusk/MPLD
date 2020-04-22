----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
----------------------------------------------------------------------------------
ENTITY debouncer IS
  GENERIC(
    DEB_PERIOD  : INTEGER := 10
  );
  PORT(
    clk         : IN  STD_LOGIC;
    ce          : IN  STD_LOGIC;
    btn_i       : IN  STD_LOGIC;
    btn_o       : OUT STD_LOGIC
  );
END debouncer;
----------------------------------------------------------------------------------
ARCHITECTURE Behavioral OF debouncer IS
----------------------------------------------------------------------------------

signal s_sample_count   : integer   := 0;
signal s_btn_o          : std_logic := '0';

----------------------------------------------------------------------------------
BEGIN
----------------------------------------------------------------------------------

  debounce: PROCESS (clk) BEGIN
    if rising_edge (clk) then
      if ce = '1' then
        if s_sample_count < (DEB_PERIOD - 1) then
          if btn_i = '1' then
            s_sample_count <= s_sample_count + 1;
          else
            s_sample_count <= 0;
          end if;
        elsif s_sample_count = (DEB_PERIOD - 1) then
          s_sample_count <= 0;
          s_btn_o <= '1';
        else
          s_btn_o <= '0';
        end if;
      end if;
    end if;
  end process debounce;

  btn_o <= s_btn_o;

----------------------------------------------------------------------------------
END Behavioral;
----------------------------------------------------------------------------------

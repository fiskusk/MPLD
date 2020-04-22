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

signal sample_count : integer := 0;

----------------------------------------------------------------------------------
BEGIN
----------------------------------------------------------------------------------

  debounce: PROCESS (clk) BEGIN
    if rising_edge (clk) then
      if ce = '1' then
        if sample_count < (DEB_PERIOD - 1) then
          if btn_i = '1' then
            sample_count <= sample_count + 1;
          else
            sample_count <= 0;
          end if;
        elsif sample_count = (DEB_PERIOD - 1) then
          sample_count <= 0;
          btn_o <= '1';
        else
          btn_o <= '0';
        end if;
      end if;
    end if;
  end process debounce;

----------------------------------------------------------------------------------
END Behavioral;
----------------------------------------------------------------------------------

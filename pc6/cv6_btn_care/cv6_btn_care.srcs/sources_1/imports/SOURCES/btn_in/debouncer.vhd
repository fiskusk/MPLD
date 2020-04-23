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

signal s_btn_debounced  : std_logic := '0';
signal s_btn_buff       : std_logic_vector(DEB_PERIOD-1 downto 0) := (others => '0');

----------------------------------------------------------------------------------
BEGIN
----------------------------------------------------------------------------------

  debounce: PROCESS (clk) 
    constant c_btn_pressed_mask   : std_logic_vector(DEB_PERIOD-1 downto 0) := (others => '1');
    constant c_btn_released_mask  : std_logic_vector(DEB_PERIOD-1 downto 0) := (others => '0');
  BEGIN
    if rising_edge (clk) then
      if ce = '1' then
        s_btn_buff <= s_btn_buff(s_btn_buff'HIGH - 1 downto 0) & btn_i;
        if s_btn_buff = c_btn_pressed_mask then
          s_btn_debounced <= '1';
        elsif s_btn_buff = c_btn_released_mask then
          s_btn_debounced <= '0';
        else
          s_btn_debounced <= s_btn_debounced;
        end if;
      end if;
    end if;
  end process debounce;

  btn_o <= s_btn_debounced;

----------------------------------------------------------------------------------
END Behavioral;
----------------------------------------------------------------------------------

--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
--------------------------------------------------------------------------------
entity counter_BCD is
  Port(
    clk             : IN    STD_LOGIC;
    clk_en_100Hz    : IN    STD_LOGIC;
    srst            : IN    STD_LOGIC;
    count_en        : IN    STD_LOGIC;
    second_BCD_H    : OUT   STD_LOGIC_VECTOR( 3 DOWNTO 0);        -- seconds
    second_BCD_L    : OUT   STD_LOGIC_VECTOR( 3 DOWNTO 0);
    hthsec_BCD_H    : OUT   STD_LOGIC_VECTOR( 3 DOWNTO 0);        -- hundredth of a second
    hthsec_BCD_L    : OUT   STD_LOGIC_VECTOR( 3 DOWNTO 0);
    led_o           : OUT   STD_LOGIC_VECTOR( 7 DOWNTO 0)
  );
end counter_BCD;
--------------------------------------------------------------------------------
architecture Behavioral of counter_BCD is
--------------------------------------------------------------------------------

  SIGNAL cnt_10m    : UNSIGNED(3 DOWNTO 0) := (OTHERS => '0');
  SIGNAL cnt_100m   : UNSIGNED(3 DOWNTO 0) := (OTHERS => '0');
  SIGNAL cnt_1s     : UNSIGNED(3 DOWNTO 0) := (OTHERS => '0');
  SIGNAL cnt_10s    : UNSIGNED(3 DOWNTO 0) := (OTHERS => '0');

--------------------------------------------------------------------------------
begin
--------------------------------------------------------------------------------

  PROCESS (clk) BEGIN
    IF rising_edge(clk) THEN

      -- synchronni reset ------------------------------------------------------
      IF srst = '1' THEN
        cnt_10m  <= X"0";
        cnt_100m <= X"0";
        cnt_1s   <= X"0";
        cnt_10s  <= X"0";
      ELSE

        -- clock enable --------------------------------------------------------
        IF clk_en_100Hz = '1' AND count_en = '1' THEN

          cnt_10m <= cnt_10m + 1;
          IF cnt_10m = X"9" THEN
            cnt_10m <= X"0";

            cnt_100m <= cnt_100m + 1;
            IF cnt_100m = X"9" THEN
              cnt_100m <= X"0";

              cnt_1s <= cnt_1s + 1;
              IF cnt_1s = X"9" THEN
                cnt_1s <= X"0";

                cnt_10s <= cnt_10s + 1;
                IF cnt_10s = X"5" THEN
                  cnt_10s <= X"0";

                END IF;
              END IF;
            END IF;
          END IF;
        END IF;
      END IF;
    END IF;
  END PROCESS;

  ------------------------------------------------------------------------------

  second_BCD_H <= STD_LOGIC_VECTOR(cnt_10s);
  second_BCD_L <= STD_LOGIC_VECTOR(cnt_1s);
  hthsec_BCD_H <= STD_LOGIC_VECTOR(cnt_100m);
  hthsec_BCD_L <= STD_LOGIC_VECTOR(cnt_10m);

  led_o        <= STD_LOGIC_VECTOR(cnt_10s & cnt_1s);

--------------------------------------------------------------------------------
end Behavioral;
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
--------------------------------------------------------------------------------
ENTITY stopwatch_FSM IS
  PORT (
    clk         : IN  STD_LOGIC;
    Btn_S_i     : IN  STD_LOGIC;
    Btn_L_i     : IN  STD_LOGIC;
    cnt_reset   : OUT STD_LOGIC;
    cnt_enable  : OUT STD_LOGIC;
    disp_enable : OUT STD_LOGIC
  );
END stopwatch_FSM;
--------------------------------------------------------------------------------
ARCHITECTURE Behavioral OF stopwatch_FSM IS
--------------------------------------------------------------------------------

TYPE t_state IS (st_Idle, st_Run, st_Lap, st_Refresh, st_Stop);
SIGNAL pres_state   : t_state := st_Idle;
SIGNAL next_state   : t_state;

SIGNAL s_cnt_reset, s_cnt_enable, s_disp_enable : STD_LOGIC;

--------------------------------------------------------------------------------
BEGIN
--------------------------------------------------------------------------------

  -- kombinacni cast 1
  comb_part_1: process (pres_state, Btn_S_i, Btn_L_i) begin

    case pres_state is
      when st_Idle => if Btn_S_i = '1' then next_state <= st_Run;
                      elsif Btn_L_i = '1'then next_state <= st_Idle;
                      else next_state <= st_Idle;
                      end if;
      
      when st_Run =>  if Btn_S_i = '1' then next_state <= st_Stop;
                      elsif Btn_L_i = '1'then next_state <= st_Lap;
                      else next_state <= st_Run;
                      end if;

      when st_Lap =>  if Btn_S_i = '1' then next_state <= st_Run;
                      elsif Btn_L_i = '1'then next_state <= st_Refresh;
                      else next_state <= st_Lap;
                      end if;
          
      when st_Refresh => next_state <= st_Lap;

      when st_Stop => if Btn_S_i = '1' then next_state <= st_Run;
                      elsif Btn_L_i = '1'then next_state <= st_Idle;
                      else next_state <= st_Stop;
                      end if;

    end case;

  end process comb_part_1;

  -- stavovy registr
  state_register: process (clk) begin

    if rising_edge(clk) then
      pres_state <= next_state;
    end if;

  end process state_register;

  -- kombinacni cast 2
  comb_part_2: process (pres_state) begin

    case pres_state is
      when st_Idle   => s_disp_enable <= '1';
                        s_cnt_enable  <= '0';
                        s_cnt_reset   <= '1';

      when st_Run    => s_disp_enable <= '1';
                        s_cnt_enable  <= '1';
                        s_cnt_reset   <= '0';

      when st_Lap    => s_disp_enable <= '0';
                        s_cnt_enable  <= '1';
                        s_cnt_reset   <= '0';

      when st_Refresh=> s_disp_enable <= '1';
                        s_cnt_enable  <= '1';
                        s_cnt_reset   <= '0';

      when st_Stop   => s_disp_enable <= '1';
                        s_cnt_enable  <= '0';
                        s_cnt_reset   <= '0';
    end case;

  end process comb_part_2;

  -- výstupní registr
  reg_output: process (clk) begin
    if rising_edge(clk) then
      disp_enable <= s_disp_enable;
      cnt_enable  <= s_cnt_enable;
      cnt_reset   <= s_cnt_reset;
    end if;
  end process reg_output;

--------------------------------------------------------------------------------
END Behavioral;
--------------------------------------------------------------------------------

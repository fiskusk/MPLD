--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
--------------------------------------------------------------------------------

entity UART_TX_block is
    Port ( UART_Tx_start  : in STD_LOGIC;
           UART_clk_en    : in STD_LOGIC;
           UART_data_in   : in STD_LOGIC_VECTOR (7 downto 0);
           clk            : in STD_LOGIC;
           UART_data_out  : out STD_LOGIC);
end UART_TX_block;

--------------------------------------------------------------------------------
architecture Behavioral of UART_TX_block is
--------------------------------------------------------------------------------

  type t_st_UART is (st_idle, st_start_b, st_bit_0, st_bit_1, st_bit_2,
                     st_bit_3, st_bit_4, st_bit_5, st_bit_6, st_bit_7, st_stop);

  signal pres_st          : t_st_UART := st_idle;
  signal next_st          : t_st_UART;

  signal Tx_data_COMB     : STD_LOGIC;
  signal Tx_data_REG      : STD_LOGIC := '1';

--------------------------------------------------------------------------------
begin
--------------------------------------------------------------------------------

  -- combination part 1 - next state logic
  next_st_logic: process (pres_st, UART_Tx_start) begin

    case pres_st is

      when st_idle      =>  if UART_Tx_start = '1' then
                              next_st <= st_start_b;
                            elsif next_st /= st_start_b then
                              next_st <= st_idle;
                            end if;

      when st_start_b   =>  next_st <= st_bit_0;
      when st_bit_0     =>  next_st <= st_bit_1;
      when st_bit_1     =>  next_st <= st_bit_2;
      when st_bit_2     =>  next_st <= st_bit_3;
      when st_bit_3     =>  next_st <= st_bit_4;
      when st_bit_4     =>  next_st <= st_bit_5;
      when st_bit_5     =>  next_st <= st_bit_6;
      when st_bit_6     =>  next_st <= st_bit_7;
      when st_bit_7     =>  next_st <= st_stop;

      when st_stop      =>  if UART_Tx_start = '1' then
                              next_st <= st_start_b;
                            else
                              next_st <= st_idle;
                            end if;

      end case;

  end process next_st_logic;

  -- state register
  state_register: process (clk) begin

    if rising_edge(clk) then
      if UART_clk_en = '1' then
        pres_st <= next_st;
      end if;
    end if;

  end process state_register;

  -- output logic
  output_logic: process (pres_st, UART_data_in) begin

    case pres_st is
      when st_idle      =>  Tx_data_COMB <= '1';
      when st_start_b   =>  Tx_data_COMB <= '0';
      when st_bit_0     =>  Tx_data_COMB <= UART_data_in(0);
      when st_bit_1     =>  Tx_data_COMB <= UART_data_in(1);
      when st_bit_2     =>  Tx_data_COMB <= UART_data_in(2);
      when st_bit_3     =>  Tx_data_COMB <= UART_data_in(3);
      when st_bit_4     =>  Tx_data_COMB <= UART_data_in(4);
      when st_bit_5     =>  Tx_data_COMB <= UART_data_in(5);
      when st_bit_6     =>  Tx_data_COMB <= UART_data_in(6);
      when st_bit_7     =>  Tx_data_COMB <= UART_data_in(7);
      when st_stop      =>  Tx_data_COMB <= '1';
    end case;

  end process output_logic;

  -- output register
  output_register: process (clk) begin

    if rising_edge(clk) then
        Tx_data_REG <= Tx_data_COMB;
    end if;

  end process output_register;

  UART_data_out <= Tx_data_REG;

end Behavioral;

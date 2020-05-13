----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
--use UNISIM.VComponents.all;
----------------------------------------------------------------------------------

entity my_uart32 is
  Port (
    tx_start    : in STD_LOGIC;
    data_in     : in STD_LOGIC_VECTOR(31 downto 0);
    clk         : in STD_LOGIC;
    tx_data     : out STD_LOGIC
  );
end my_uart32;

----------------------------------------------------------------------------------
architecture Behavioral of my_uart32 is
----------------------------------------------------------------------------------

  -- FSM type
  type t_st_UART is (st_idle, st_start_b, st_bit_0, st_bit_1, st_bit_2,
                     st_bit_3, st_bit_4, st_bit_5, st_bit_6, st_bit_7, 
                     st_bit_8, st_bit_9, st_bit_10, st_bit_11, st_bit_12, 
                     st_bit_13, st_bit_14, st_bit_15, st_bit_16, st_bit_17,
                     st_bit_18, st_bit_19, st_bit_20, st_bit_21, st_bit_22,
                     st_bit_23, st_bit_24, st_bit_25, st_bit_26, st_bit_27, 
                     st_bit_28, st_bit_29, st_bit_30, st_bit_31, st_stop);

  -- FSM states
  signal pres_st          : t_st_UART := st_idle;
  signal next_st          : t_st_UART;

  -- internal FSM signals
  signal s_Tx_data_COMB     : STD_LOGIC;
  signal s_Tx_data_REG      : STD_LOGIC := '0';
  signal UART_data_in       : STD_LOGIC_VECTOR(31 downto 0);

  -- signals for CE-generator
  signal cnt_div : unsigned (4 downto 0) := (others => '0');
  signal ce_o    : STD_LOGIC;

----------------------------------------------------------------------------------
begin
----------------------------------------------------------------------------------

  -- CE generator
  ce_gen: process (clk) 
    constant DIV_FACT  : positive := 25;
    begin
    if rising_edge (clk) then
      if cnt_div = DIV_FACT - 1 then
        cnt_div <= (others => '0');
        ce_o <= '1';
      else
        cnt_div <= cnt_div + 1;
        ce_o <= '0';
      end if;
    end if;
  end process ce_gen;

  -- combination part 1 - next state logic
  next_st_logic: process (pres_st, tx_start) begin

    case pres_st is

      when st_idle      =>  if tx_start = '1' then
                              next_st <= st_start_b;
                              UART_data_in <= data_in;
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
      when st_bit_7     =>  next_st <= st_bit_8;
      when st_bit_8     =>  next_st <= st_bit_9;
      when st_bit_9     =>  next_st <= st_bit_10;
      when st_bit_10    =>  next_st <= st_bit_11;
      when st_bit_11    =>  next_st <= st_bit_12;
      when st_bit_12    =>  next_st <= st_bit_13;
      when st_bit_13    =>  next_st <= st_bit_14;
      when st_bit_14    =>  next_st <= st_bit_15;
      when st_bit_15    =>  next_st <= st_bit_16;
      when st_bit_16    =>  next_st <= st_bit_17;
      when st_bit_17    =>  next_st <= st_bit_18;
      when st_bit_18    =>  next_st <= st_bit_19;
      when st_bit_19    =>  next_st <= st_bit_20;
      when st_bit_20    =>  next_st <= st_bit_21;
      when st_bit_21    =>  next_st <= st_bit_22;
      when st_bit_22    =>  next_st <= st_bit_23;
      when st_bit_23    =>  next_st <= st_bit_24;
      when st_bit_24    =>  next_st <= st_bit_25;
      when st_bit_25    =>  next_st <= st_bit_26;
      when st_bit_26    =>  next_st <= st_bit_27;
      when st_bit_27    =>  next_st <= st_bit_28;
      when st_bit_28    =>  next_st <= st_bit_29;
      when st_bit_29    =>  next_st <= st_bit_30;
      when st_bit_30    =>  next_st <= st_bit_31;
      when st_bit_31    =>  next_st <= st_stop;

      when st_stop      =>  if tx_start = '1' then
                              next_st <= st_start_b;
                              UART_data_in <= data_in;
                            else
                              next_st <= st_idle;
                            end if;

      end case;

  end process next_st_logic;

  -- state register
  state_register: process (clk) begin

    if rising_edge(clk) then
      if ce_o = '1' then
        pres_st <= next_st;
      end if;
    end if;

  end process state_register;

  -- output logic
  output_logic: process (pres_st) begin

    case pres_st is
      when st_idle      =>  s_Tx_data_COMB <= '0';
      when st_start_b   =>  s_Tx_data_COMB <= '1';
      when st_bit_0     =>  s_Tx_data_COMB <= UART_data_in(31);
      when st_bit_1     =>  s_Tx_data_COMB <= UART_data_in(30);
      when st_bit_2     =>  s_Tx_data_COMB <= UART_data_in(29);
      when st_bit_3     =>  s_Tx_data_COMB <= UART_data_in(28);
      when st_bit_4     =>  s_Tx_data_COMB <= UART_data_in(27);
      when st_bit_5     =>  s_Tx_data_COMB <= UART_data_in(26);
      when st_bit_6     =>  s_Tx_data_COMB <= UART_data_in(25);
      when st_bit_7     =>  s_Tx_data_COMB <= UART_data_in(24);
      when st_bit_8     =>  s_Tx_data_COMB <= UART_data_in(23);
      when st_bit_9     =>  s_Tx_data_COMB <= UART_data_in(22);
      when st_bit_10    =>  s_Tx_data_COMB <= UART_data_in(21);
      when st_bit_11    =>  s_Tx_data_COMB <= UART_data_in(20);
      when st_bit_12    =>  s_Tx_data_COMB <= UART_data_in(19);
      when st_bit_13    =>  s_Tx_data_COMB <= UART_data_in(18);
      when st_bit_14    =>  s_Tx_data_COMB <= UART_data_in(17);
      when st_bit_15    =>  s_Tx_data_COMB <= UART_data_in(16);
      when st_bit_16    =>  s_Tx_data_COMB <= UART_data_in(15);
      when st_bit_17    =>  s_Tx_data_COMB <= UART_data_in(14);
      when st_bit_18    =>  s_Tx_data_COMB <= UART_data_in(13);
      when st_bit_19    =>  s_Tx_data_COMB <= UART_data_in(12);
      when st_bit_20    =>  s_Tx_data_COMB <= UART_data_in(11);
      when st_bit_21    =>  s_Tx_data_COMB <= UART_data_in(10);
      when st_bit_22    =>  s_Tx_data_COMB <= UART_data_in(9);
      when st_bit_23    =>  s_Tx_data_COMB <= UART_data_in(8);
      when st_bit_24    =>  s_Tx_data_COMB <= UART_data_in(7);
      when st_bit_25    =>  s_Tx_data_COMB <= UART_data_in(6);
      when st_bit_26    =>  s_Tx_data_COMB <= UART_data_in(5);
      when st_bit_27    =>  s_Tx_data_COMB <= UART_data_in(4);
      when st_bit_28    =>  s_Tx_data_COMB <= UART_data_in(3);
      when st_bit_29    =>  s_Tx_data_COMB <= UART_data_in(2);
      when st_bit_30    =>  s_Tx_data_COMB <= UART_data_in(1);
      when st_bit_31    =>  s_Tx_data_COMB <= UART_data_in(0);
      when st_stop      =>  s_Tx_data_COMB <= '0';
    end case;

  end process output_logic;

  -- output register
  output_register: process (clk) begin

    if rising_edge(clk) then
        s_Tx_data_REG <= s_Tx_data_COMB;
    end if;

  end process output_register;

  tx_data <= s_Tx_data_REG;

----------------------------------------------------------------------------------
end Behavioral;

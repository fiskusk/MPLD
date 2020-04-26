--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
--------------------------------------------------------------------------------

entity TB_UART_TX_block is
end TB_UART_TX_block;

--------------------------------------------------------------------------------
architecture Behavioral of TB_UART_TX_block is
--------------------------------------------------------------------------------

  component UART_TX_block
    Port ( UART_Tx_start  : in STD_LOGIC;
           UART_clk_en    : in STD_LOGIC;
           UART_data_in   : in STD_LOGIC_VECTOR (7 downto 0);
           clk            : in STD_LOGIC;
           UART_data_out  : out STD_LOGIC;
           UART_Tx_busy   : out STD_LOGIC);
  end component;

  component ce_gen
  GENERIC(
    DIV_FACT        : POSITIVE := 2);
  PORT (
    clk             : IN  STD_LOGIC;
    srst            : IN  STD_LOGIC;
    ce_o            : OUT STD_LOGIC);
  end component;

--------------------------------------------------------------------------------

  constant clk_period       : TIME := 20 ns;

  -- UUT inputs
  signal clk                : STD_LOGIC := '0';
  signal UART_clk_en        : STD_LOGIc := '0';
  signal UART_Tx_start      : STD_LOGIC := '0';
  signal UART_data_in       : STD_LOGIC_VECTOR (7 downto 0);

  -- UUT outputs
  signal UART_data_out      : STD_LOGIC;
  signal UART_Tx_busy       : STD_LOGIC;
  
  signal simulation_finished : BOOLEAN := false;

--------------------------------------------------------------------------------
begin
--------------------------------------------------------------------------------

  ce_gen_i : ce_gen
  GENERIC MAP(
    DIV_FACT            => 434
  )
  PORT MAP(
    clk                 => clk,
    srst                => '0',
    ce_o                => UART_clk_en
  );

  UUT : UART_TX_block
  PORT MAP(
    UART_Tx_start       => UART_Tx_start,
    UART_clk_en         => UART_clk_en,
    UART_data_in        => UART_data_in,
    clk                 => clk,
    UART_data_out       => UART_data_out,
    UART_Tx_busy        => UART_Tx_busy
  );

  --------------------------------------------------------------------------------

  clk_gen: PROCESS
  BEGIN
    if simulation_finished then
     REPORT "================================================================" SEVERITY NOTE;
     REPORT "Simulation finished!" SEVERITY NOTE;
     wait;
    end if;
    
    clk <= '0';
    WAIT FOR clk_period/2;
    clk <= '1';
    WAIT FOR clk_period/2;

    
  END PROCESS clk_gen;

  --------------------------------------------------------------------------------

  FSM_input_emulator: process 
  begin
  
    UART_Tx_start <= '0';
    WAIT FOR 10us;

    UART_Tx_start <= '1'; 
    UART_data_in <= "10011101";
    WAIT FOR 20ns;

    UART_Tx_start <= '0';
    WAIT UNTIL UART_Tx_busy = '0';
    
    UART_Tx_start <= '1';
    UART_data_in <= "11001010";
    WAIT FOR 20ns;

    UART_Tx_start <= '0';
    WAIT FOR 200us;
    
    simulation_finished <= true;
 
  END PROCESS FSM_input_emulator;

end Behavioral;

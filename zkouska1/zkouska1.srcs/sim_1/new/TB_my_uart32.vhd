----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
----------------------------------------------------------------------------------

entity TB_my_uart32 is
end TB_my_uart32;

----------------------------------------------------------------------------------
architecture Behavioral of TB_my_uart32 is
----------------------------------------------------------------------------------

  component my_uart32 is
    Port (
      tx_start    : in STD_LOGIC;
      data_in     : in STD_LOGIC_VECTOR(31 downto 0);
      clk         : in STD_LOGIC;
      tx_data     : out STD_LOGIC
    );
  end component my_uart32;

----------------------------------------------------------------------------------

  constant clk_period       : TIME := 8 ns;

  -- UUT inputs
  signal clk                : STD_LOGIC := '0';
  signal s_tx_start         : STD_LOGIC := '0';
  signal s_data_in          : STD_LOGIC_VECTOR (31 downto 0);

  -- UUT ouputs
  signal s_tx_data          : STD_LOGIC;

  signal sim_finished       : BOOLEAN := false;

  --signal sended_data        : integer := 0;
  --signal captured_data      : STD_LOGIC_VECTOR(31 downto 0);

----------------------------------------------------------------------------------
begin
----------------------------------------------------------------------------------

  UUT : my_uart32
  PORT MAP(
    tx_start       => s_tx_start,
    data_in        => s_data_in,
    clk            => clk,
    tx_data        => s_tx_data
  );
  
--------------------------------------------------------------------------------

  clk_gen: PROCESS
  BEGIN
    clk <= '0';
    WAIT FOR clk_period/2;
    clk <= '1';
    WAIT FOR clk_period/2;

    if (sim_finished = true) then
      report "End of simulation" severity FAILURE;
      wait;
    end if;
  END PROCESS;

--------------------------------------------------------------------------------

  FSM_input_emulator: process 
  variable test_input_data    : integer := 123456789;
  begin

    wait for 10 ns;

    test_loop: for k in 0 TO 499 LOOP
      s_tx_start <= '1';
      s_data_in  <= std_logic_vector(to_unsigned(test_input_data, 32));
      wait for clk_period * 25 * 10;

      test_input_data := test_input_data + k;
      
      s_data_in  <= std_logic_vector(to_unsigned(test_input_data, 32));
      wait for clk_period * 25 * 10;
      
      s_tx_start <= '0';
      test_input_data := test_input_data + 1;
      wait for 10000 ns;
    end loop test_loop;
    
    sim_finished <= true;
 
  END PROCESS FSM_input_emulator;

----------------------------------------------------------------------------------
end Behavioral;

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
----------------------------------------------------------------------------------
ENTITY sync_reg IS
  PORT(
    clk         : IN  STD_LOGIC;
    d_i         : IN  STD_LOGIC;
    q_o         : OUT STD_LOGIC
  );
END sync_reg;
----------------------------------------------------------------------------------
ARCHITECTURE Behavioral OF sync_reg IS
----------------------------------------------------------------------------------

  signal Q1 : STD_LOGIC;
  signal Q2 : STD_LOGIC;

  attribute ASYNC_REG : string;
  attribute ASYNC_REG of Q1: signal is "TRUE";
  attribute ASYNC_REG of Q2: signal is "TRUE";

  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of Q1: signal is "NO";
  attribute SHREG_EXTRACT of Q2: signal is "NO";
  
----------------------------------------------------------------------------------
BEGIN
----------------------------------------------------------------------------------

  sig_sync: PROCESS (clk) begin
    if rising_edge(clk) then
      Q1 <= d_i;
      Q2 <= Q1;
      q_o <= Q2;
    end if;
  end process sig_sync;
    

----------------------------------------------------------------------------------
END Behavioral;
----------------------------------------------------------------------------------

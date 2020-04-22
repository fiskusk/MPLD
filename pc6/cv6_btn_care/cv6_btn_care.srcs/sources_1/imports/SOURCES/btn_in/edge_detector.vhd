----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
----------------------------------------------------------------------------------
ENTITY edge_detector IS
  PORT(
    clk         : IN  STD_LOGIC;
    sig_i       : IN  STD_LOGIC;
    posedge_o   : OUT STD_LOGIC;
    negedge_o   : OUT STD_LOGIC;
    edge_o      : OUT STD_LOGIC
  );
END edge_detector;
----------------------------------------------------------------------------------
ARCHITECTURE Behavioral OF edge_detector IS
----------------------------------------------------------------------------------

  signal old_state : STD_LOGIC := '0';

----------------------------------------------------------------------------------
BEGIN
----------------------------------------------------------------------------------

  edge_detector: process (clk) begin
    if rising_edge(clk) then
      if (sig_i XOR old_state) = '1' then
        edge_o <= '1';
        if sig_i = '1' AND old_state = '0' then
          posedge_o <= '1';
          negedge_o <= '0';
        else
          posedge_o <= '0';
          negedge_o <= '1';
        end if;
      else
        edge_o    <= '0';
        negedge_o <= '0';
        posedge_o <= '0';
      end if;
      old_state <= sig_i;
    end if;
  end process edge_detector;



----------------------------------------------------------------------------------
END Behavioral;
----------------------------------------------------------------------------------

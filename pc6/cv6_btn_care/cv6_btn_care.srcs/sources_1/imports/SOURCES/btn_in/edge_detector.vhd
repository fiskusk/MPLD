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

  -- tyhle signaly tam mas navíc a ja je nemel
	signal inp_sig : std_logic := '0';
  signal posedge_sig : std_logic;
	signal negedge_sig : std_logic;
	signal edge_sig : std_logic;

----------------------------------------------------------------------------------
BEGIN
----------------------------------------------------------------------------------
  -- SEKCE1 - tohle vse tam mas navic ty a ja to nemel
  inp_sig <= sig_i;

  comb_part: process(sig_i, old_state) begin
    posedge_sig <= sig_i and not old_state;
		negedge_sig <= not sig_i and old_state;
		edge_sig <= sig_i xor old_state;
  end process comb_part;
  -- KONEC SEKCE1

  edge_detector: process (clk) begin
    if rising_edge(clk) then
      old_state <= inp_sig;
      
      -- SEKCE2 -- tohle si mel ty v kodu ty. Ja to zakomentoval a funguje to taky
			--if old_state = '0' and inp_sig = '1' then
			--	posedge_o <= '1';
			--else
			--	posedge_o <= '0';
			--end if;
			--
			--if old_state = '1' and inp_sig = '0' then
			--	negedge_o <= '1';
			--else
			--	negedge_o <= '0';
			--end if;
			--
			--if (old_state xor inp_sig) = '1' then
			--	edge_o <= '1';
			--else
			--	edge_o <= '0';
      --end if;
      -- KONEC SEKCE2 
      
      -- SEKCE3 tohle byl cely muj puvodni kod, a s nim byl signal hrany generovany
      -- posunuty o jeden tick clk (zpozdeny) doprava
      --if (sig_i XOR old_state) = '1' then
      --  edge_o <= '1';
      --  if sig_i = '1' AND old_state = '0' then
      --    posedge_o <= '1';
      --    negedge_o <= '0';
      --  else
      --    posedge_o <= '0';
      --    negedge_o <= '1';
      --  end if;
      --else
      --  edge_o    <= '0';
      --  negedge_o <= '0';
      --  posedge_o <= '0';
      --end if;
      --old_state <= sig_i;
      -- KONEC SEKCE3
    end if;
  end process edge_detector;

  -- SEKCE4 - tohle si tam měl ty navíc 
  posedge_o <= posedge_sig;
	negedge_o <= negedge_sig;
  edge_o <= edge_sig;
  -- KONEC SEKCE4

----------------------------------------------------------------------------------
END Behavioral;
----------------------------------------------------------------------------------

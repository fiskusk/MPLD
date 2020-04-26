--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
--------------------------------------------------------------------------------

  entity ce_gen is
    generic (
    DIV_FACT : positive := 2);
    Port ( srst   : in STD_LOGIC;
           clk    : in STD_LOGIC;
           ce_o   : out STD_LOGIC);
    end ce_gen;

--------------------------------------------------------------------------------
architecture Behavioral of ce_gen is
--------------------------------------------------------------------------------

  signal cnt_div : unsigned (31 downto 0) := (others => '0');

--------------------------------------------------------------------------------
begin
--------------------------------------------------------------------------------

  ce_gen: process (clk) begin
    if rising_edge (clk) then
      if srst = '1' then
        cnt_div <= (others => '0');
        ce_o <= '0';
      elsif cnt_div = DIV_FACT - 1 then
        cnt_div <= (others => '0');
        ce_o <= '1';
      else
        cnt_div <= cnt_div + 1;
        ce_o <= '0';
      end if;
    end if;
  end process ce_gen;

end Behavioral;

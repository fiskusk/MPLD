----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;

----------------------------------------------------------------------------------
entity TOP is
  generic ( 
    tap1    : integer := 16;
    tap2    : integer := 13
  );
  Port (
    clk     : in STD_LOGIC;
    ce      : in STD_LOGIC;
    srst    : in STD_LOGIC;
    output  : out STD_LOGIC_VECTOR(7 downto 0);
    LSFR_o  : out STD_LOGIC_VECTOR(tap1 downto 1)
  );
end TOP;

----------------------------------------------------------------------------------
architecture Behavioral of TOP is
----------------------------------------------------------------------------------

  signal shreg      : STD_LOGIC_VECTOR(tap1 downto 1)  := (others => '1');
  signal feedback   : STD_LOGIC;

----------------------------------------------------------------------------------
begin
----------------------------------------------------------------------------------

LSFR: process (clk) begin
  if rising_edge(clk) then
    if (srst = '1') then
      shreg <= (others => '1');
    elsif (ce = '1') then
      shreg <= shreg(shreg'high-1 downto 1) & feedback;
    end if;
  end if;
end process LSFR;

feedback  <= shreg(tap1) XOR shreg(tap2);

LSFR_o    <= shreg;

output(0) <= shreg(12);
output(1) <= shreg(6);
output(2) <= shreg(2);
output(3) <= shreg(8);
output(4) <= shreg(4);
output(5) <= shreg(11);
output(6) <= shreg(15);
output(7) <= shreg(1);

----------------------------------------------------------------------------------
end Behavioral;

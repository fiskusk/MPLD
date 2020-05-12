----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;

----------------------------------------------------------------------------------
entity TB2_TOP is
end TB2_TOP;
----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
architecture Behavioral of TB2_TOP is
----------------------------------------------------------------------------------

  component TOP is
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
  end component;

  CONSTANT clk_period       : TIME := 10 ns;

  -- UUT inputs
  signal clk                : STD_LOGIC := '0';
  signal s_ce               : STD_LOGIC := '1';
  signal s_srst             : STD_LOGIC := '0';

  -- UUT outputs
  signal s_LSFR_o           : STD_LOGIC_VECTOR (16 downto 1);
  signal s_output           : STD_LOGIC_VECTOR(7 downto 0);
  
  signal s_count            : integer := 0;
  signal sim_finished       : boolean := false;

----------------------------------------------------------------------------------
begin
----------------------------------------------------------------------------------

  UUT : TOP
  generic map (
    tap1          => 16,
    tap2          => 13
  )
  PORT MAP(
    clk           => clk,
    ce            => s_ce,
    srst          => s_srst,
    output        => s_output,
    LSFR_o        => s_LSFR_o
  );

  clk_gen: PROCESS
  BEGIN
    clk <= '0';
    WAIT FOR clk_period/2;
    clk <= '1';
    WAIT FOR clk_period/2;

    if (sim_finished = true) then
      wait;
    end if;
  END PROCESS;

  stimulus_generator: process
  variable first_run : boolean := true;
  begin

    s_ce    <= '0';
    s_srst  <= '1';
    wait for clk_period * 10;

    s_ce    <= '1';
    s_srst  <= '0';

    smycka: loop
      wait for clk_period;

      if (s_LSFR_o = X"FFFF") then
        report "Pocet cyklu (perioda) " &  INTEGER'image(s_count + 1) severity note;
        s_count <= 0;
        sim_finished <= true;
      else
        s_count <= s_count + 1;
      end if;
    end loop smycka;

  end process stimulus_generator;


----------------------------------------------------------------------------------
end Behavioral;

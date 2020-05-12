----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;
----------------------------------------------------------------------------------
entity TB_TOP is
end TB_TOP;
----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
architecture Behavioral of TB_TOP is
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
  signal s_tap1             : std_logic;
  signal s_tap2             : std_logic;

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

  s_tap1 <= s_LSFR_o(15);
  s_tap2 <= s_LSFR_o(13);

  clk_gen: PROCESS
  BEGIN
    clk <= '0';
    WAIT FOR clk_period/2;
    clk <= '1';
    WAIT FOR clk_period/2;
  END PROCESS;

  stimulus_generator: process
  begin

    wait for clk_period * 50;

    s_srst <= '1';
    wait for clk_period * 5;

    s_srst <= '0';
    wait for clk_period * 50;

    s_ce <= '0';
    wait for clk_period * 25;

    s_ce <= '1';
    wait for clk_period * 50;

    REPORT "================================================================" SEVERITY NOTE;
    REPORT "Simulation finished!" SEVERITY NOTE;
    REPORT "================================================================" SEVERITY FAILURE;

  end process stimulus_generator;

----------------------------------------------------------------------------------
end Behavioral;

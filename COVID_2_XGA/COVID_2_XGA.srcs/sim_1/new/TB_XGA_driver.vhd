--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--------------------------------------------------------------------------------

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_XGA_driver is
end TB_XGA_driver;

--------------------------------------------------------------------------------
architecture Behavioral of TB_XGA_driver is
--------------------------------------------------------------------------------

  component XGA_driver
    Port ( clk_pixel : in STD_LOGIC;
           vsync : out STD_LOGIC;
           hsync : out STD_LOGIC;
           x_addr : out STD_LOGIC_VECTOR (9 downto 0);
           y_addr : out STD_LOGIC_VECTOR (9 downto 0);
           video_on : out STD_LOGIC);
  end component;

  ------------------------------------------------------------------------------

  constant clk_period   : TIME := 15 ns;

  -- UUT inputs
  signal clk_pixel        : STD_LOGIC := '0';

  -- UUT outputs
  signal vsync            : STD_LOGIC;
  signal hsync            : STD_LOGIC;
  signal x_addr           : STD_LOGIC_VECTOR (9 downto 0);
  signal y_addr           : STD_LOGIC_VECTOR (9 downto 0);
  signal video_on         : STD_LOGIC;
  
  signal simulation_finished : BOOLEAN := false;
    
--------------------------------------------------------------------------------
begin
--------------------------------------------------------------------------------

  UUT : XGA_driver
  PORT MAP(
    clk_pixel    => clk_pixel,
    vsync        => vsync,
    hsync        => hsync,
    x_addr       => x_addr,
    y_addr       => y_addr,
    video_on     => video_on
  );

  ------------------------------------------------------------------------------

  clk_gen: PROCESS
  BEGIN
    if simulation_finished then
     REPORT "================================================================" SEVERITY NOTE;
     REPORT "Simulation finished!" SEVERITY NOTE;
     wait;
    end if;
    
    clk_pixel <= '1';
    WAIT FOR clk_period/2;
    clk_pixel <= '0';
    WAIT FOR clk_period/2;

    
  END PROCESS clk_gen;

--------------------------------------------------------------------------------

end Behavioral;

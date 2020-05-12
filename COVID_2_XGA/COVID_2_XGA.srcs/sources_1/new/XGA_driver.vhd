--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
--------------------------------------------------------------------------------
entity XGA_driver is
    Port ( clk_pixel    : in STD_LOGIC;
           vsync        : out STD_LOGIC;
           hsync        : out STD_LOGIC;
           x_addr       : out STD_LOGIC_VECTOR (9 downto 0);
           y_addr       : out STD_LOGIC_VECTOR (9 downto 0);
           video_on     : out STD_LOGIC);
end XGA_driver;

--------------------------------------------------------------------------------
architecture Behavioral of XGA_driver is
--------------------------------------------------------------------------------

  constant C_HSYNC_ACT    : INTEGER := 1024;
  constant C_HSYNC_FP     : INTEGER :=   24;
  constant C_HSYNC_SP     : INTEGER :=  136;
  constant C_HSYNC_BP     : INTEGER :=  160;

  constant C_VSYNC_ACT    : INTEGER :=  768;
  constant C_VSYNC_FP     : INTEGER :=    3;
  constant C_VSYNC_SP     : INTEGER :=    6;
  constant C_VSYNC_BP     : INTEGER :=   29;

  constant c_cnt_x_max    : INTEGER := C_HSYNC_ACT + C_HSYNC_FP + C_HSYNC_SP + C_HSYNC_BP;
  constant c_cnt_y_max    : INTEGER := C_VSYNC_ACT + C_VSYNC_FP + C_VSYNC_SP + C_VSYNC_BP;

  signal s_cnt_x          : UNSIGNED(10 downto 0) := (others => '0');
  signal s_cnt_y          : UNSIGNED(9 downto 0) := (others => '0');
  signal first_run        : BOOLEAN   := true;
  
  signal s_vsync          : STD_LOGIC := '1';
  signal s_hsync          : STD_LOGIC := '1';
  signal s_video_on       : STD_LOGIC := '1';
  signal s_x_addr         : STD_LOGIC_VECTOR (9 downto 0);
  signal s_y_addr         : STD_LOGIC_VECTOR (9 downto 0);

--------------------------------------------------------------------------------
begin
--------------------------------------------------------------------------------

  counter: process (clk_pixel) begin
    if rising_edge(clk_pixel) then
      if s_cnt_x = c_cnt_x_max - 1 then
        s_cnt_x   <= (others => '0');
        if s_cnt_y = c_cnt_y_max - 1 then
          s_cnt_y <= (others => '0');
        else
          s_cnt_y <= s_cnt_y + 1;
        end if;
      else
        if first_run = true then
          first_run <= false;
        else
          s_cnt_x <= s_cnt_x + 1;
        end if;
      end if;
    end if;
  end process counter;

  XGA_driver: process (s_cnt_x, s_cnt_y) begin

    if s_cnt_x < C_HSYNC_ACT and s_cnt_y < C_VSYNC_ACT then
      s_hsync     <= '1';
      s_video_on  <= '1';
      s_x_addr    <= STD_LOGIC_VECTOR(s_cnt_x(9 DOWNTO 0));
    elsif s_cnt_x = C_HSYNC_ACT and s_cnt_y < C_VSYNC_ACT then
      s_video_on  <= '0';
    elsif s_cnt_x = C_HSYNC_ACT + C_HSYNC_FP then
      s_hsync     <= '0';
    elsif s_cnt_x = C_HSYNC_ACT + C_HSYNC_FP  + C_HSYNC_SP then
      s_hsync    <= '1';
    elsif s_cnt_x = c_cnt_x_max then
      s_hsync    <= '1';
      s_video_on  <= '1';
    end if;

    if s_cnt_y < C_VSYNC_ACT then
      s_vsync     <= '1';
      s_y_addr      <= STD_LOGIC_VECTOR(s_cnt_y(9 DOWNTO 0));
    elsif s_cnt_y = C_VSYNC_ACT +  C_VSYNC_FP then 
      s_vsync     <= '0';
    elsif s_cnt_y = C_VSYNC_ACT +  C_VSYNC_FP + C_VSYNC_SP then
      s_vsync     <= '1';
    end if;

  end process XGA_driver;
  
  hsync     <= s_hsync;
  vsync     <= s_vsync;
  video_on  <= s_video_on;
  x_addr    <= s_x_addr;
  y_addr    <= s_y_addr;

--------------------------------------------------------------------------------
end Behavioral;

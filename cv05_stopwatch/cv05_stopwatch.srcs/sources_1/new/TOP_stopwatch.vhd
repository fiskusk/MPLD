----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 03.03.2020 13:51:42
-- Design Name:
-- Module Name: TOP_stopwatch - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TOP_stopwatch is
    PORT(
        clk             : IN  STD_LOGIC;
        btn_i           : IN  STD_LOGIC_VECTOR (1 TO 4);
        sw_i            : IN  STD_LOGIC_VECTOR (1 TO 4);
        led_o           : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
        disp_seg_o      : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
        disp_dig_o      : OUT STD_LOGIC_VECTOR (4 DOWNTO 0)
        );
end TOP_stopwatch;

architecture Structural of TOP_stopwatch is

    component stopwatch
		Port (  ce_100Hz        : in STD_LOGIC;
                disp_ena_i      : in STD_LOGIC;
                cnt_ena_i       : in STD_LOGIC;
                srst            : in STD_LOGIC;
                clk             : in STD_LOGIC;
                cnt0            : out STD_LOGIC_VECTOR (3 downto 0);
                cnt1            : out STD_LOGIC_VECTOR (3 downto 0);
                cnt2            : out STD_LOGIC_VECTOR (3 downto 0);
                cnt3            : out STD_LOGIC_VECTOR (3 downto 0));
     end component;

     component ce_gen
	 	 generic (
 			DIV_FACT : positive := 50000
 		 );
	 	Port ( 	srst 	: in STD_LOGIC;
           		clk 	: in STD_LOGIC;
           		ce_o 	: out STD_LOGIC);
      end component;

      COMPONENT seg_disp_driver
      PORT(
            clk             : IN  STD_LOGIC;
            dig_1_i         : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
            dig_2_i         : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
            dig_3_i         : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
            dig_4_i         : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
            dp_i            : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);        -- [DP4 DP3 DP2 DP1]
            dots_i          : IN  STD_LOGIC_VECTOR (2 DOWNTO 0);        -- [L3 L2 L1]
            disp_seg_o      : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
            disp_dig_o      : OUT STD_LOGIC_VECTOR (4 DOWNTO 0));
      END COMPONENT;

      signal ce_100Hz_sig : STD_LOGIC;
      signal cnt0_sig 		: STD_LOGIC_VECTOR (3 downto 0);
      signal cnt1_sig 		: STD_LOGIC_VECTOR (3 downto 0);
      signal cnt2_sig 		: STD_LOGIC_VECTOR (3 downto 0);
      signal cnt3_sig 		: STD_LOGIC_VECTOR (3 downto 0);
begin

    stopwatch_ins : stopwatch
        Port map (
            ce_100Hz    => ce_100Hz_sig,
            disp_ena_i  => sw_i(3),
            cnt_ena_i   => sw_i(2),
            srst        => btn_i(1),
            clk 		=> clk,
            cnt0 		=> cnt0_sig,
            cnt1 		=> cnt1_sig,
            cnt2 		=> cnt2_sig,
            cnt3 		=> cnt3_sig
        );

    ce_gen_ins : ce_gen
        generic map (
            DIV_FACT => 500000
        )
        Port map (
            srst    => btn_i(1),
            clk     => clk,
            ce_o    => ce_100Hz_sig
        );

    seg_disp_driver_ins : seg_disp_driver
      PORT MAP(
        dig_1_i       => cnt3_sig,
        dig_2_i       => cnt2_sig,
        dig_3_i       => cnt1_sig,
        dig_4_i       => cnt0_sig,
        dp_i          => "0000",
        dots_i        => "011",
        clk           => clk,
        disp_seg_o    => disp_seg_o,
        disp_dig_o    => disp_dig_o
      );

end Structural;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_stopwatch is
--  Port ( );
end TB_stopwatch;

architecture Behavioral of TB_stopwatch is
	component stopwatch
		Port ( ce_100Hz 	: in STD_LOGIC;
           disp_ena_i 	: in STD_LOGIC;
           cnt_ena_i 	: in STD_LOGIC;
           srst 		: in STD_LOGIC;
           clk 			: in STD_LOGIC;
           cnt0 		: out STD_LOGIC_VECTOR (3 downto 0);
           cnt1 		: out STD_LOGIC_VECTOR (3 downto 0);
           cnt2 		: out STD_LOGIC_VECTOR (3 downto 0);
           cnt3 		: out STD_LOGIC_VECTOR (3 downto 0));
     end component;

     component ce_gen
	 	 generic (
 			DIV_FACT : positive := 20
 		 );
	 	Port ( 	srst 	: in STD_LOGIC;
           		clk 	: in STD_LOGIC;
           		ce_o 	: out STD_LOGIC);
      end component;

      signal ce_100Hz_sig 	: STD_LOGIC := '0';
      signal disp_ena_i_sig	: STD_LOGIC := '1';
      signal cnt_ena_i_sig 	: STD_LOGIC := '1';
      signal srst_sig 		: STD_LOGIC := '0';
      signal clk_sig 		: STD_LOGIC := '0';
      signal cnt0_sig 		: STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
      signal cnt1_sig 		: STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
      signal cnt2_sig 		: STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
      signal cnt3_sig 		: STD_LOGIC_VECTOR (3 downto 0) := (others => '0');

      constant clk_period     : time := 20 ns;

begin

    process begin
        clk_sig <= '0';
        wait for clk_period/2;
        clk_sig <= '1';
        wait for clk_period/2;
    end process;

    process begin
        wait for clk_period * 1000;

        disp_ena_i_sig <= '0';
        wait for clk_period * 1000;

        disp_ena_i_sig <= '1';
        wait for clk_period * 1000;

        cnt_ena_i_sig <= '0';
        wait for clk_period * 1000;

        cnt_ena_i_sig <= '1';
        wait for clk_period * 1000;

        srst_sig <= '1';
        wait for clk_period * 1000;

        srst_sig <= '0';
        wait for clk_period * 1000;

    end process;

    UUT_stopwatch : stopwatch
    Port map (
        ce_100Hz    => ce_100Hz_sig,
        disp_ena_i  => disp_ena_i_sig,
        cnt_ena_i   => cnt_ena_i_sig,
        srst        => srst_sig,
        clk 		=> clk_sig,
        cnt0 		=> cnt0_sig,
        cnt1 		=> cnt1_sig,
        cnt2 		=> cnt2_sig,
        cnt3 		=> cnt3_sig
    );

    UUT_ce_gen : ce_gen
    generic map (
        DIV_FACT => 20
    )
    Port map (
        srst    => srst_sig,
        clk     => clk_sig,
        ce_o    => ce_100Hz_sig
    );

end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.03.2020 11:41:52
-- Design Name: 
-- Module Name: stopwatch - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity stopwatch is
    Port ( ce_100Hz 	: in STD_LOGIC;
           disp_ena_i 	: in STD_LOGIC;
           cnt_ena_i 	: in STD_LOGIC;
           srst 		: in STD_LOGIC;
           clk 			: in STD_LOGIC;
           cnt0 		: out STD_LOGIC_VECTOR (3 downto 0);
           cnt1 		: out STD_LOGIC_VECTOR (3 downto 0);
           cnt2 		: out STD_LOGIC_VECTOR (3 downto 0);
           cnt3 		: out STD_LOGIC_VECTOR (3 downto 0));
end stopwatch;

architecture Behavioral of stopwatch is
	
	signal cnt_reg0 : unsigned (3 downto 0) := (others => '0');
	signal cnt_reg1 : unsigned (3 downto 0) := (others => '0');
	signal cnt_reg2 : unsigned (3 downto 0) := (others => '0');
	signal cnt_reg3 : unsigned (3 downto 0) := (others => '0');

begin
	
	BCD_counter0: process (clk) begin
		if rising_edge(clk) then
			if srst = '1' then
				cnt_reg0 <= (others => '0');
			elsif ce_100Hz = '1' then
				if cnt_ena_i = '1' then
					if cnt_reg0 = x"9" then
						cnt_reg0 <= (others => '0');
					else
						cnt_reg0 <= cnt_reg0 + 1;
					end if;
				end if;
			end if;
		end if;
	end process BCD_counter0;
	
	BCD_counter1: process (clk) begin
		if rising_edge(clk) then
			if srst = '1' then
				cnt_reg1 <= (others => '0');
			elsif ce_100Hz = '1' then
				if cnt_ena_i = '1' then
					if cnt_reg0 = x"9" then					
						if cnt_reg1 = x"9" then
							cnt_reg1 <= (others => '0');
						else 
							cnt_reg1 <= cnt_reg1 + 1;
						end if;
					end if;
				end if;
			end if;
		end if;
	end process BCD_counter1;
	
	BCD_counter2: process (clk) begin
		if rising_edge(clk) then
			if srst = '1' then
				cnt_reg2 <= (others => '0');
			elsif ce_100Hz = '1' then
				if cnt_ena_i = '1' then
					if (cnt_reg0 = x"9") and (cnt_reg1 = x"9") then					
						if cnt_reg2 = x"9" then
							cnt_reg2 <= (others => '0');
						else 
							cnt_reg2 <= cnt_reg2 + 1;
						end if;
					end if;
				end if;
			end if;
		end if;
	end process BCD_counter2;
	
	BCD_counter3: process (clk) begin
		if rising_edge(clk) then
			if srst = '1' then
				cnt_reg3 <= (others => '0');
			elsif ce_100Hz = '1' then
				if cnt_ena_i = '1' then
					if (cnt_reg0 = x"9") and (cnt_reg1 = x"9") and (cnt_reg2 = x"9") then					
						if cnt_reg3 = x"5" then
							cnt_reg3 <= (others => '0');
						else 
							cnt_reg3 <= cnt_reg3 + 1;
						end if;
					end if;
				end if;
			end if;
		end if;
	end process BCD_counter3;
	
	out_reg: process (clk) begin
		if rising_edge (clk) then
			if disp_ena_i = '1' then
				cnt0 <= STD_LOGIC_VECTOR(cnt_reg0);
				cnt1 <= STD_LOGIC_VECTOR(cnt_reg1);
				cnt2 <= STD_LOGIC_VECTOR(cnt_reg2);
				cnt3 <= STD_LOGIC_VECTOR(cnt_reg3);
			end if;
		end if;
	end process out_reg;
				
	
	

end Behavioral;

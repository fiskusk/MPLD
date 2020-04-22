----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.02.2020 20:42:27
-- Design Name: 
-- Module Name: counter - Behavioral
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
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter is
    Port (
        clk     : in    STD_LOGIC;
        srst    : in    STD_LOGIC;
        output  : out    STD_LOGIC_VECTOR (7 downto 0)
    );
end counter;

architecture Behavioral of counter is

    signal count : unsigned (7 downto 0) <= (others => '0');

begin

    process (clk) begin
        if rising_edge(clk) then
            if srst = '1' then
                count <= (others => '0');
            else
                count <= count + 1;
        end if;
    end process;


end Behavioral;

----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 02/11/2020 11:45:44 AM
-- Design Name:
-- Module Name: ALU - Behavioral
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


entity ALU is
    Port ( a_i : in STD_LOGIC_VECTOR (3 downto 0);
           b_i : in STD_LOGIC_VECTOR (3 downto 0);
           op_i : in STD_LOGIC_VECTOR (1 downto 0);
           y_o : out STD_LOGIC_VECTOR (7 downto 0));
end ALU;

architecture Behavioral of ALU is

begin
switch: PROCESS (op_i, a_i, b_i) BEGIN
    CASE op_i IS
        WHEN "00"   => y_o <= std_logic_vector(X"00" + unsigned(a_i) + unsigned(b_i) + "0001");
        WHEN "01"   => y_o <= std_logic_vector(X"00" + unsigned(a_i) - unsigned(b_i));
        WHEN "10"   => 
            if b_i = "0000" then
                y_o <= x"FF";
            else
                y_o <= std_logic_vector(X"00" + unsigned(a_i) / unsigned(b_i));
            end if;
        WHEN OTHERS => y_o <= std_logic_vector(unsigned(a_i) * unsigned(b_i));
    END CASE;
END PROCESS switch;

end Behavioral;

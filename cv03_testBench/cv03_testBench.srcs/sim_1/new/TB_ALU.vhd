----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 02/18/2020 11:49:45 AM
-- Design Name:
-- Module Name: TB_ALU - Behavioral
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
use std.textio.ALL;

--prazdna entita, protoze nema zadne cvysupy ani vstupy. je to svet sam o sobe
entity TB_ALU is
end TB_ALU;

architecture Behavioral of TB_ALU is
    component ALU
        Port ( a_i  : in    STD_LOGIC_VECTOR (3 downto 0);
               b_i  : in    STD_LOGIC_VECTOR (3 downto 0);
               op_i : in    STD_LOGIC_VECTOR (1 downto 0);
               y_o  : out   STD_LOGIC_VECTOR (7 downto 0));
    end component;

    signal a_sig  : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal b_sig  : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal op_sig : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal y_sig  : STD_LOGIC_VECTOR (7 downto 0);

    signal end_data_done: STD_LOGIC_VECTOR (1 downto 0) := "10";

begin

    stimulus_generator : process
    begin
        loop0: for op in 0 to 3 loop
            op_sig <= STD_LOGIC_VECTOR(TO_UNSIGNED(op,2));
            loop1: for a in 0 to 15 loop
                a_sig <= STD_LOGIC_VECTOR(TO_UNSIGNED(a,4));
                loop2: for b in 0 to 15 loop
                    b_sig <= STD_LOGIC_VECTOR(TO_UNSIGNED(b,4)); wait for 10 ns;
                end loop loop2;
            end loop loop1;
        end loop loop0;
        end_data_done <= "01";
        wait;
    end process stimulus_generator;

    UUT : ALU
    Port map (
        a_i     =>  a_sig,
        b_i     =>  b_sig,
        op_i    =>  op_sig,
        y_o     =>  y_sig
    );

    output_checker : process
        variable y_ref: STD_LOGIC_VECTOR (7 downto 0) := X"00";
        FILE File_ID : TEXT;
        VARIABLE pocet_zapsanych_chyb : INTEGER := 0;
        VARIABLE radek : LINE;
    begin
        if end_data_done = "10" then
            FILE_OPEN(File_ID, "data_out_v2.txt", WRITE_MODE);
            end_data_done <= "00";
        end if;
        wait for 10 ns;

        if op_sig = "00" then
            y_ref   := STD_LOGIC_VECTOR(X"00" + UNSIGNED(a_sig) + UNSIGNED(b_sig));
        elsif op_sig = "01" then
            y_ref   := STD_LOGIC_VECTOR(X"00" + UNSIGNED(a_sig) - UNSIGNED(b_sig));
        elsif op_sig = "10" then
            if b_sig = "0000" then
                y_ref := x"FF";
            else
                y_ref  :=STD_LOGIC_VECTOR(X"00" + UNSIGNED(a_sig) / UNSIGNED(b_sig));
            end if;
        elsif op_sig = "11" then
            y_ref   := STD_LOGIC_VECTOR(UNSIGNED(a_sig) * UNSIGNED(b_sig));
        end if;

        if end_data_done = "01" then
            write (radek, string'("pokus"));
            write (radek, string'("ahoj"));
            writeline(File_ID, radek);
            writeline(File_ID, radek);
            FILE_CLOSE(File_ID);
            wait;
        end if;

        if y_sig /= y_ref then
            report "Chyba!!! pri operaci " & INTEGER'image(TO_INTEGER(UNSIGNED(op_sig))) &
                    " kdy a = " &  INTEGER'image(TO_INTEGER(UNSIGNED(a_sig))) &
                    " b = " &  INTEGER'image(TO_INTEGER(UNSIGNED(b_sig))) &
                    " skutecne y = " & INTEGER'image(TO_INTEGER(UNSIGNED(y_sig))) &
                    " ocekavane y = " & INTEGER'image(TO_INTEGER(UNSIGNED(y_ref)))
            severity error;
            IF (pocet_zapsanych_chyb < 1000) then
                write (radek, string'("Chyba!!! pri operaci "));
                write (radek, INTEGER'image(TO_INTEGER(UNSIGNED(op_sig))));
                write (radek, string'(" kdy a = "));
                write (radek, INTEGER'image(TO_INTEGER(UNSIGNED(a_sig))));
                write (radek, string'(" b = "));
                write (radek, INTEGER'image(TO_INTEGER(UNSIGNED(b_sig))));
                write (radek, string'(". Skutecne y = "));
                write (radek, INTEGER'image(TO_INTEGER(UNSIGNED(y_sig))));
                write (radek, string'(" ocekavane y = "));
                write (radek, INTEGER'image(TO_INTEGER(UNSIGNED(y_ref))));
                WRITELINE (File_ID, radek);
                pocet_zapsanych_chyb := pocet_zapsanych_chyb + 1;
            END if;
        end if;
        wait on a_sig, b_sig, op_sig;
    end process output_checker;

end Behavioral;

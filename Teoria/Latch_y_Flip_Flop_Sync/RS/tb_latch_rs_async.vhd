library ieee;
use ieee.std_logic_1164.all;
use std.env.all;

entity tb_latch_rs_async is
end entity tb_latch_rs_async;

architecture simulation of tb_latch_rs_async is
    signal S_tb : std_logic := '0';
    signal R_tb : std_logic := '0';
    signal Q_tb : std_logic;
begin

    DUT : entity work.latch_rs_async(rtl)
        port map (
            S => S_tb,
            R => R_tb,
            Q => Q_tb
        );

    stimulus : process
    begin
        -- Estado inicial: memoria. Q inicia en 0 por declaracion.
        S_tb <= '0';
        R_tb <= '0';
        wait for 10 ns;
        assert Q_tb = '0'
            report "Error en el estado inicial"
            severity error;

        -- Set.
        S_tb <= '1';
        R_tb <= '0';
        wait for 10 ns;
        assert Q_tb = '1'
            report "Error durante Set"
            severity error;

        -- Memoria: debe conservar 1.
        S_tb <= '0';
        R_tb <= '0';
        wait for 10 ns;
        assert Q_tb = '1'
            report "Error al conservar el 1"
            severity error;

        -- Reset.
        S_tb <= '0';
        R_tb <= '1';
        wait for 10 ns;
        assert Q_tb = '0'
            report "Error durante Reset"
            severity error;

        -- Memoria: debe conservar 0.
        S_tb <= '0';
        R_tb <= '0';
        wait for 10 ns;
        assert Q_tb = '0'
            report "Error al conservar el 0"
            severity error;

        -- Combinacion no permitida.
        S_tb <= '1';
        R_tb <= '1';
        wait for 10 ns;
        assert Q_tb = 'X'
            report "No se detecto la combinacion no permitida"
            severity error;

        report "Prueba del latch RS asincrono terminada correctamente"
            severity note;
        finish;
    end process;

end architecture simulation;

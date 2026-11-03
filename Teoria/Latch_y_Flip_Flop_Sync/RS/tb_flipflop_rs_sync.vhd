library ieee;
use ieee.std_logic_1164.all;
use std.env.all;

entity tb_flipflop_rs_sync is
end entity tb_flipflop_rs_sync;

architecture simulation of tb_flipflop_rs_sync is
    constant CLK_PERIOD : time := 10 ns;

    signal clk_tb : std_logic := '0';
    signal S_tb   : std_logic := '0';
    signal R_tb   : std_logic := '0';
    signal Q_tb   : std_logic;
begin

    DUT : entity work.flipflop_rs_sync(rtl)
        port map (
            clk => clk_tb,
            S   => S_tb,
            R   => R_tb,
            Q   => Q_tb
        );

    -- Reloj de 10 ns de periodo.
    clock_process : process
    begin
        while true loop
            clk_tb <= '0';
            wait for CLK_PERIOD / 2;
            clk_tb <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
    end process;

    stimulus : process
    begin
        -- Set: Q cambia en el siguiente flanco ascendente.
        S_tb <= '1';
        R_tb <= '0';
        wait until rising_edge(clk_tb);
        wait for 1 ns;
        assert Q_tb = '1'
            report "Error durante Set"
            severity error;

        -- Memoria: debe conservar 1.
        S_tb <= '0';
        R_tb <= '0';
        wait until rising_edge(clk_tb);
        wait for 1 ns;
        assert Q_tb = '1'
            report "Error al conservar el 1"
            severity error;

        -- Reset.
        S_tb <= '0';
        R_tb <= '1';
        wait until rising_edge(clk_tb);
        wait for 1 ns;
        assert Q_tb = '0'
            report "Error durante Reset"
            severity error;

        -- Memoria: debe conservar 0.
        S_tb <= '0';
        R_tb <= '0';
        wait until rising_edge(clk_tb);
        wait for 1 ns;
        assert Q_tb = '0'
            report "Error al conservar el 0"
            severity error;

        -- Combinacion no permitida, evaluada en el flanco.
        S_tb <= '1';
        R_tb <= '1';
        wait until rising_edge(clk_tb);
        wait for 1 ns;
        assert Q_tb = 'X'
            report "No se detecto la combinacion no permitida"
            severity error;

        report "Prueba del flip-flop RS sincronico terminada correctamente"
            severity note;
        finish;
    end process;

end architecture simulation;

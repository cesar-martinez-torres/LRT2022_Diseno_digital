library ieee;
use ieee.std_logic_1164.all;
use std.env.all;

entity tb_latch_rs_pr_cl is
end entity tb_latch_rs_pr_cl;

architecture simulation of tb_latch_rs_pr_cl is
    signal CLK_tb   : std_logic := '0';
    signal S_tb     : std_logic := '0';
    signal R_tb     : std_logic := '0';
    signal Pr_tb    : std_logic := '0';
    signal Cl_tb    : std_logic := '0';
    signal Q_tb     : std_logic;
    signal Q_bar_tb : std_logic;
begin

    DUT : entity work.latch_rs_pr_cl(rtl)
        port map (
            CLK   => CLK_tb,
            S     => S_tb,
            R     => R_tb,
            Pr    => Pr_tb,
            Cl    => Cl_tb,
            Q     => Q_tb,
            Q_bar => Q_bar_tb
        );

    stimulus : process
    begin
        -- Estado inicial.
        wait for 10 ns;
        assert (Q_tb = '0') and (Q_bar_tb = '1')
            report "Error en el estado inicial"
            severity error;

        -- S no debe modificar las salidas cuando CLK=0.
        S_tb <= '1';
        wait for 10 ns;
        assert (Q_tb = '0') and (Q_bar_tb = '1')
            report "El latch cambio cuando CLK estaba en 0"
            severity error;

        -- Set sincronizado por nivel alto de CLK.
        CLK_tb <= '1';
        wait for 10 ns;
        assert (Q_tb = '1') and (Q_bar_tb = '0')
            report "Error durante Set"
            severity error;

        -- Memoria con CLK=0.
        CLK_tb <= '0';
        S_tb   <= '0';
        R_tb   <= '1';
        wait for 10 ns;
        assert (Q_tb = '1') and (Q_bar_tb = '0')
            report "Error al conservar el estado con CLK en 0"
            severity error;

        -- Reset sincronizado por nivel alto de CLK.
        CLK_tb <= '1';
        wait for 10 ns;
        assert (Q_tb = '0') and (Q_bar_tb = '1')
            report "Error durante Reset"
            severity error;

        -- Preset asincrono: funciona aunque CLK=0.
        CLK_tb <= '0';
        R_tb   <= '0';
        Pr_tb  <= '1';
        wait for 10 ns;
        assert (Q_tb = '1') and (Q_bar_tb = '0')
            report "Error durante Preset asincrono"
            severity error;

        -- Liberar Preset conserva el estado.
        Pr_tb <= '0';
        wait for 10 ns;
        assert (Q_tb = '1') and (Q_bar_tb = '0')
            report "Error al liberar Preset"
            severity error;

        -- Clear asincrono: funciona aunque CLK=0.
        Cl_tb <= '1';
        wait for 10 ns;
        assert (Q_tb = '0') and (Q_bar_tb = '1')
            report "Error durante Clear asincrono"
            severity error;

        -- Preset y Clear simultaneos: estado no permitido del diagrama.
        Pr_tb <= '1';
        wait for 10 ns;
        assert (Q_tb = '1') and (Q_bar_tb = '1')
            report "Error en la combinacion Pr=1 y Cl=1"
            severity error;

        -- Recuperacion mediante Reset habilitado por CLK.
        Pr_tb  <= '0';
        Cl_tb  <= '0';
        R_tb   <= '1';
        S_tb   <= '0';
        CLK_tb <= '1';
        wait for 10 ns;
        assert (Q_tb = '0') and (Q_bar_tb = '1')
            report "Error al recuperar el estado despues de Pr=Cl=1"
            severity error;

        -- S=R=1 con CLK=1 produce el estado no permitido del latch NOR.
        S_tb <= '1';
        R_tb <= '1';
        wait for 10 ns;
        assert (Q_tb = '0') and (Q_bar_tb = '0')
            report "Error en la combinacion S=1 y R=1"
            severity error;

        report "Prueba del latch RS con Preset y Clear terminada correctamente"
            severity note;
        finish;
    end process;

end architecture simulation;

library ieee;
use ieee.std_logic_1164.all;

entity latch_rs_pr_cl is
    port (
        CLK   : in  std_logic;
        S     : in  std_logic;
        R     : in  std_logic;
        Pr    : in  std_logic;
        Cl    : in  std_logic;
        Q     : out std_logic;
        Q_bar : out std_logic
    );
end entity latch_rs_pr_cl;

architecture rtl of latch_rs_pr_cl is
    signal q_int     : std_logic := '0';
    signal q_bar_int : std_logic := '1';
begin

    process (CLK, S, R, Pr, Cl)
    begin
        -- Preset y Clear son asincronos y activos en alto.
        if (Pr = '1') and (Cl = '0') then
            q_int     <= '1';
            q_bar_int <= '0';

        elsif (Pr = '0') and (Cl = '1') then
            q_int     <= '0';
            q_bar_int <= '1';

        elsif (Pr = '1') and (Cl = '1') then
            -- En el circuito mostrado, las dos OR fuerzan ambas salidas a 1.
            q_int     <= '1';
            q_bar_int <= '1';

        elsif CLK = '1' then
            -- El latch solo acepta S y R mientras CLK esta en nivel alto.
            if (S = '1') and (R = '0') then
                q_int     <= '1';
                q_bar_int <= '0';

            elsif (S = '0') and (R = '1') then
                q_int     <= '0';
                q_bar_int <= '1';

            elsif (S = '1') and (R = '1') then
                -- Estado no permitido del latch RS con compuertas NOR.
                q_int     <= '0';
                q_bar_int <= '0';
            end if;
            -- S=0 y R=0: conserva el estado anterior.
        end if;
        -- CLK=0, Pr=0 y Cl=0: conserva el estado anterior.
    end process;

    Q     <= q_int;
    Q_bar <= q_bar_int;

end architecture rtl;

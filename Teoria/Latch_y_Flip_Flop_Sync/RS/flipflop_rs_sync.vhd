library ieee;
use ieee.std_logic_1164.all;

entity flipflop_rs_sync is
    port (
        clk : in  std_logic;
        S   : in  std_logic;
        R   : in  std_logic;
        Q   : out std_logic
    );
end entity flipflop_rs_sync;

architecture rtl of flipflop_rs_sync is
    signal q_int : std_logic := '0';
begin

    process (clk)
    begin
        if rising_edge(clk) then
            if (S = '1') and (R = '0') then
                q_int <= '1';             -- Set
            elsif (S = '0') and (R = '1') then
                q_int <= '0';             -- Reset
            elsif (S = '1') and (R = '1') then
                q_int <= 'X';             -- Combinacion no permitida
            end if;
            -- S=0 y R=0: conserva el estado anterior.
        end if;
    end process;

    Q <= q_int;

end architecture rtl;

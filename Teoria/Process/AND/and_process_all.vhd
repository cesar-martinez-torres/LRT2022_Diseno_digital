library ieee;
use ieee.std_logic_1164.all;

entity compuerta_and_all is
  port (
    a : in  std_logic;
    b : in  std_logic;
    y : out std_logic
  );
end entity compuerta_and_all;

architecture proceso of compuerta_and_all is
begin
  combinacional : process (all)
  begin
    -- Valor predeterminado para evitar memoria no deseada.
    y <= '0';

    if (a = '1') and (b = '1') then
      y <= '1';
    end if;
  end process combinacional;
end architecture proceso;

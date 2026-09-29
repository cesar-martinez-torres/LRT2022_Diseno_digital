library ieee;
use ieee.std_logic_1164.all;

entity funcion4 is
  port (a, b, c, d : in std_logic; y : out std_logic);
end entity funcion4;

architecture proceso_if of funcion4 is
begin
  combinacional : process (a, b, c, d)
  begin
    if (a = '0') and (b = '1') then
      y <= '1';
    elsif (a = '1') and (c = '1') then
      y <= '1';
    elsif (c = '0') and (d = '1') then
      y <= '1';
    else
      y <= '0';
    end if;
  end process combinacional;
end architecture proceso_if;


library ieee;
use ieee.std_logic_1164.all;

entity funcion4 is
  port (a, b, c, d : in std_logic; y : out std_logic);
end entity funcion4;

architecture condicional of funcion4 is
begin
  y <= '1' when ((a = '0') and (b = '1')) else
       '1' when ((a = '1') and (c = '1')) else
       '1' when ((c = '0') and (d = '1')) else
       '0';
end architecture condicional;


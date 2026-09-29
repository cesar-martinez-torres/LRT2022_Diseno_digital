library ieee;
use ieee.std_logic_1164.all;

entity funcion4 is
  port (a, b, c, d : in std_logic; y : out std_logic);
end entity funcion4;

architecture funcion_simplificada of funcion4 is
begin
  y <= ((not a) and b) or
       (a and c) or
       ((not c) and d);
end architecture funcion_simplificada;


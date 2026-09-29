library ieee;
use ieee.std_logic_1164.all;

entity funcion4 is
  port (
    a, b, c, d : in  std_logic;
    y          : out std_logic
  );
end entity funcion4;

architecture funcion_estandar of funcion4 is
begin
  y <= ((not a) and b and (not c)) or
       ((not a) and b and c) or
       (a and (not b) and c) or
       (a and b and c) or
       ((not a) and (not c) and d) or
       (a and (not c) and d);
end architecture funcion_estandar;


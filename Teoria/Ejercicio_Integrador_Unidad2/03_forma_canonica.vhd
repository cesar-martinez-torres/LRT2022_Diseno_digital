library ieee;
use ieee.std_logic_1164.all;

entity funcion4 is
  port (a, b, c, d : in std_logic; y : out std_logic);
end entity funcion4;

architecture forma_canonica of funcion4 is
begin
  y <= ((not a) and (not b) and (not c) and d) or
       ((not a) and b and (not c) and (not d)) or
       ((not a) and b and (not c) and d) or
       ((not a) and b and c and (not d)) or
       ((not a) and b and c and d) or
       (a and (not b) and (not c) and d) or
       (a and (not b) and c and (not d)) or
       (a and (not b) and c and d) or
       (a and b and (not c) and d) or
       (a and b and c and (not d)) or
       (a and b and c and d);
end architecture forma_canonica;


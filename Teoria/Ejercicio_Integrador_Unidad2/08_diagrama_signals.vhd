library ieee;
use ieee.std_logic_1164.all;

entity funcion4 is
  port (a, b, c, d : in std_logic; y : out std_logic);
end entity funcion4;

architecture diagrama_signals of funcion4 is
  signal not_a, not_c : std_logic;
  signal x1, x2, x3  : std_logic;
begin
  not_a <= not a;
  not_c <= not c;
  x1 <= not_a and b;
  x2 <= a and c;
  x3 <= not_c and d;
  y  <= x1 or x2 or x3;
end architecture diagrama_signals;


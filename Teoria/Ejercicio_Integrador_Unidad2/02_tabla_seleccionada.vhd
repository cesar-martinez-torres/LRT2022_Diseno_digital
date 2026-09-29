library ieee;
use ieee.std_logic_1164.all;

entity funcion4 is
  port (a, b, c, d : in std_logic; y : out std_logic);
end entity funcion4;

architecture tabla_seleccionada of funcion4 is
  signal abcd : std_logic_vector(3 downto 0);
begin
  abcd <= a & b & c & d;

  with abcd select
    y <= '1' when "0001" | "0100" | "0101" | "0110" |
                  "0111" | "1001" | "1010" | "1011" |
                  "1101" | "1110" | "1111",
         '0' when others;
end architecture tabla_seleccionada;


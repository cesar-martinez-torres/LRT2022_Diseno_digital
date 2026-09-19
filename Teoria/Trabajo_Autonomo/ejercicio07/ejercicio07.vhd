library ieee;
use ieee.std_logic_1164.all;

-- Inicio de la entidad: define entradas y salida.
entity ejercicio07 is
  port (
    a, b, c : in  std_logic; -- Entradas.
    y       : out std_logic  -- Salida.
  );
end entity ejercicio07;

-- Inicio de la arquitectura del circuito.
architecture rtl of ejercicio07 is
  -- Senales con los mismos nombres usados en el diagrama.
  signal x1, x2, x3 : std_logic;
begin
  -- Una asignacion concurrente por cada compuerta.
  x1 <= a and b;
  x2 <= not b;
  x3 <= x2 and c;
  y  <= x1 or x3;
end architecture rtl;

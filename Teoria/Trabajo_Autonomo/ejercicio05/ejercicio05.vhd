library ieee;
use ieee.std_logic_1164.all;

-- Inicio de la entidad: define entradas y salida.
entity ejercicio05 is
  port (
    a, b, c : in  std_logic; -- Entradas.
    y       : out std_logic  -- Salida.
  );
end entity ejercicio05;

-- Inicio de la arquitectura del circuito.
architecture rtl of ejercicio05 is
begin
  -- Asignacion concurrente de K = C + A'B.
  y <= c or ((not a) and b);
end architecture rtl;

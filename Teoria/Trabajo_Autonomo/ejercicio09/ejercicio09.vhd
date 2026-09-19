library ieee;
use ieee.std_logic_1164.all;

-- Inicio de la entidad: define entradas y salida.
entity ejercicio09 is
  port (
    a, b, c, d : in  std_logic; -- Entradas.
    y          : out std_logic  -- Salida.
  );
end entity ejercicio09;

-- Inicio de la arquitectura del circuito.
architecture rtl of ejercicio09 is
begin
  -- Asignacion concurrente de Q = (A+B)(C+D).
  y <= (a or b) and (c or d);
end architecture rtl;

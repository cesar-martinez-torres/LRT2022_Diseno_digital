library ieee;
use ieee.std_logic_1164.all;

-- Inicio de la entidad: define entradas y salida.
entity ejercicio08 is
  port (
    a, b, c : in  std_logic; -- Entradas.
    y       : out std_logic  -- Salida.
  );
end entity ejercicio08;

-- Inicio de la arquitectura del circuito.
architecture rtl of ejercicio08 is
begin
  -- Asignacion concurrente de P = AB + C.
  y <= (a and b) or c;
end architecture rtl;

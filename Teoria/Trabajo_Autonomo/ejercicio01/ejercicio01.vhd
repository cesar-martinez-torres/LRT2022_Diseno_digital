library ieee;
use ieee.std_logic_1164.all;

-- Inicio de la entidad: define entradas y salida.
entity ejercicio01 is
  port (
    a, b, c : in  std_logic; -- Entradas.
    y       : out std_logic  -- Salida.
  );
end entity ejercicio01;

-- Inicio de la arquitectura del circuito.
architecture rtl of ejercicio01 is
begin
  -- Asignacion concurrente de F = A'B + AC.
  y <= ((not a) and b) or (a and c);
end architecture rtl;

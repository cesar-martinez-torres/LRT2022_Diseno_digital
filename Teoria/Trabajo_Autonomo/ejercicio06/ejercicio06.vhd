library ieee;
use ieee.std_logic_1164.all;

-- Inicio de la entidad: define entradas y salida.
entity ejercicio06 is
  port (
    a, b, c, d : in  std_logic; -- Entradas del problema.
    y          : out std_logic  -- Salida.
  );
end entity ejercicio06;

-- Inicio de la arquitectura del circuito.
architecture rtl of ejercicio06 is
begin
  -- A y C desaparecen al simplificar: L = B'D' + BD.
  y <= ((not b) and (not d)) or (b and d);
end architecture rtl;

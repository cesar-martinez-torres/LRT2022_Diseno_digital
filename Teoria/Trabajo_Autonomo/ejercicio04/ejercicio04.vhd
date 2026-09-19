library ieee;
use ieee.std_logic_1164.all;

-- Inicio de la entidad: define entradas y salida.
entity ejercicio04 is
  port (
    a, b, c : in  std_logic; -- Entradas del problema.
    y       : out std_logic  -- Salida.
  );
end entity ejercicio04;

-- Inicio de la arquitectura del circuito.
architecture rtl of ejercicio04 is
begin
  -- El mapa simplifica la funcion completa a J = C.
  y <= c;
end architecture rtl;

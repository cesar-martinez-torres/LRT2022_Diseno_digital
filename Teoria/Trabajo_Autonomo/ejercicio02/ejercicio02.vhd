library ieee;
use ieee.std_logic_1164.all;

-- Inicio de la entidad: define entradas y salida.
entity ejercicio02 is
  port (
    a, b, c : in  std_logic; -- Entradas.
    y       : out std_logic  -- Salida.
  );
end entity ejercicio02;

-- Inicio de la arquitectura del circuito.
architecture rtl of ejercicio02 is
begin
  -- G = sum m(1,2,5,7), escrita como suma canonica.
  y <= ((not a) and (not b) and c) or
       ((not a) and b and (not c)) or
       (a and (not b) and c) or
       (a and b and c);
end architecture rtl;

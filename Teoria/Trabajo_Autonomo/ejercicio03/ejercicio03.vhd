library ieee;
use ieee.std_logic_1164.all;

-- Inicio de la entidad: define entradas y salida.
entity ejercicio03 is
  port (
    a, b, c : in  std_logic; -- Entradas.
    y       : out std_logic  -- Salida.
  );
end entity ejercicio03;

-- Inicio de la arquitectura del circuito.
architecture rtl of ejercicio03 is
begin
  -- H = sum m(0,2,3,6), escrita como suma canonica.
  y <= ((not a) and (not b) and (not c)) or
       ((not a) and b and (not c)) or
       ((not a) and b and c) or
       (a and b and (not c));
end architecture rtl;

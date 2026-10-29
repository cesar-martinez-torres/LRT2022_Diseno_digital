library ieee;
use ieee.std_logic_1164.all;

entity comparador_1bit is
  port (
    a         : in  std_logic;
    b         : in  std_logic;
    mayor_in  : in  std_logic;
    igual_in  : in  std_logic;
    menor_in  : in  std_logic;
    mayor_out : out std_logic;
    igual_out : out std_logic;
    menor_out : out std_logic
  );
end entity comparador_1bit;

architecture ecuaciones of comparador_1bit is
begin
  mayor_out <= mayor_in or (igual_in and a and (not b));
  igual_out <= igual_in and (a xnor b);
  menor_out <= menor_in or (igual_in and (not a) and b);
end architecture ecuaciones;

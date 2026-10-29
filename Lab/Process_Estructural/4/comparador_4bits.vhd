library ieee;
use ieee.std_logic_1164.all;

entity comparador_4bits is
  port (
    a     : in  std_logic_vector(3 downto 0);
    b     : in  std_logic_vector(3 downto 0);
    mayor : out std_logic;
    igual : out std_logic;
    menor : out std_logic
  );
end entity comparador_4bits;

architecture estructural of comparador_4bits is
  component comparador_1bit is
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
  end component comparador_1bit;

  signal m : std_logic_vector(4 downto 0);
  signal i : std_logic_vector(4 downto 0);
  signal n : std_logic_vector(4 downto 0);
begin
  -- Antes de comparar el bit mas significativo, A y B son iguales.
  m(4) <= '0';
  i(4) <= '1';
  n(4) <= '0';

  c3 : comparador_1bit
    port map (
      a => a(3), b => b(3),
      mayor_in => m(4), igual_in => i(4), menor_in => n(4),
      mayor_out => m(3), igual_out => i(3), menor_out => n(3)
    );

  c2 : comparador_1bit
    port map (
      a => a(2), b => b(2),
      mayor_in => m(3), igual_in => i(3), menor_in => n(3),
      mayor_out => m(2), igual_out => i(2), menor_out => n(2)
    );

  c1 : comparador_1bit
    port map (
      a => a(1), b => b(1),
      mayor_in => m(2), igual_in => i(2), menor_in => n(2),
      mayor_out => m(1), igual_out => i(1), menor_out => n(1)
    );

  c0 : comparador_1bit
    port map (
      a => a(0), b => b(0),
      mayor_in => m(1), igual_in => i(1), menor_in => n(1),
      mayor_out => m(0), igual_out => i(0), menor_out => n(0)
    );

  mayor <= m(0);
  igual <= i(0);
  menor <= n(0);
end architecture estructural;

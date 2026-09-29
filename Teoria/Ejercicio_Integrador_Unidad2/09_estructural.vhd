library ieee;
use ieee.std_logic_1164.all;

entity inv1 is
  port (i : in std_logic; z : out std_logic);
end entity inv1;
architecture rtl of inv1 is begin z <= not i; end architecture rtl;

library ieee;
use ieee.std_logic_1164.all;

entity and2 is
  port (i1, i2 : in std_logic; z : out std_logic);
end entity and2;
architecture rtl of and2 is begin z <= i1 and i2; end architecture rtl;

library ieee;
use ieee.std_logic_1164.all;

entity or3 is
  port (i1, i2, i3 : in std_logic; z : out std_logic);
end entity or3;
architecture rtl of or3 is begin z <= i1 or i2 or i3; end architecture rtl;

library ieee;
use ieee.std_logic_1164.all;

entity funcion4 is
  port (a, b, c, d : in std_logic; y : out std_logic);
end entity funcion4;

architecture estructural of funcion4 is
  component inv1 is
    port (i : in std_logic; z : out std_logic);
  end component inv1;
  component and2 is
    port (i1, i2 : in std_logic; z : out std_logic);
  end component and2;
  component or3 is
    port (i1, i2, i3 : in std_logic; z : out std_logic);
  end component or3;

  signal not_a, not_c : std_logic;
  signal x1, x2, x3  : std_logic;
begin
  g1 : inv1 port map (i => a, z => not_a);
  g2 : inv1 port map (i => c, z => not_c);
  g3 : and2 port map (i1 => not_a, i2 => b, z => x1);
  g4 : and2 port map (i1 => a, i2 => c, z => x2);
  g5 : and2 port map (i1 => not_c, i2 => d, z => x3);
  g6 : or3  port map (i1 => x1, i2 => x2, i3 => x3, z => y);
end architecture estructural;


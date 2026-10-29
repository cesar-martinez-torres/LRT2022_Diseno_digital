library ieee;
use ieee.std_logic_1164.all;

entity comparador_1bit_tb is
end entity comparador_1bit_tb;

architecture simulacion of comparador_1bit_tb is
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

  signal a         : std_logic := '0';
  signal b         : std_logic := '0';
  signal mayor_in  : std_logic := '0';
  signal igual_in  : std_logic := '1';
  signal menor_in  : std_logic := '0';
  signal mayor_out : std_logic;
  signal igual_out : std_logic;
  signal menor_out : std_logic;
begin
  dut : comparador_1bit
    port map (
      a         => a,
      b         => b,
      mayor_in  => mayor_in,
      igual_in  => igual_in,
      menor_in  => menor_in,
      mayor_out => mayor_out,
      igual_out => igual_out,
      menor_out => menor_out
    );

  estimulos : process
  begin
    mayor_in <= '0'; igual_in <= '1'; menor_in <= '0';
    a <= '0'; b <= '0';
    wait for 10 ns;
    assert (mayor_out = '0') and (igual_out = '1') and (menor_out = '0')
      report "Error al comparar 0 y 0" severity error;

    a <= '0'; b <= '1';
    wait for 10 ns;
    assert (mayor_out = '0') and (igual_out = '0') and (menor_out = '1')
      report "Error al comparar 0 y 1" severity error;

    a <= '1'; b <= '0';
    wait for 10 ns;
    assert (mayor_out = '1') and (igual_out = '0') and (menor_out = '0')
      report "Error al comparar 1 y 0" severity error;

    a <= '1'; b <= '1';
    wait for 10 ns;
    assert (mayor_out = '0') and (igual_out = '1') and (menor_out = '0')
      report "Error al comparar 1 y 1" severity error;

    -- Una relacion decidida por un bit anterior debe conservarse.
    mayor_in <= '1'; igual_in <= '0'; menor_in <= '0';
    a <= '0'; b <= '1';
    wait for 10 ns;
    assert (mayor_out = '1') and (igual_out = '0') and (menor_out = '0')
      report "Error al conservar la condicion mayor" severity error;

    mayor_in <= '0'; igual_in <= '0'; menor_in <= '1';
    a <= '1'; b <= '0';
    wait for 10 ns;
    assert (mayor_out = '0') and (igual_out = '0') and (menor_out = '1')
      report "Error al conservar la condicion menor" severity error;

    report "Todas las pruebas terminaron correctamente" severity note;
    wait;
  end process estimulos;
end architecture simulacion;

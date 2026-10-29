library ieee;
use ieee.std_logic_1164.all;

entity comparador_4bits_tb is
end entity comparador_4bits_tb;

architecture simulacion of comparador_4bits_tb is
  component comparador_4bits is
    port (
      a     : in  std_logic_vector(3 downto 0);
      b     : in  std_logic_vector(3 downto 0);
      mayor : out std_logic;
      igual : out std_logic;
      menor : out std_logic
    );
  end component comparador_4bits;

  signal a     : std_logic_vector(3 downto 0) := "0000";
  signal b     : std_logic_vector(3 downto 0) := "0000";
  signal mayor : std_logic;
  signal igual : std_logic;
  signal menor : std_logic;
begin
  dut : comparador_4bits
    port map (
      a     => a,
      b     => b,
      mayor => mayor,
      igual => igual,
      menor => menor
    );

  estimulos : process
  begin
    a <= "0000"; b <= "0000";
    wait for 10 ns;
    assert (mayor = '0') and (igual = '1') and (menor = '0')
      report "Error al comparar 0 y 0" severity error;

    a <= "0101"; b <= "0011";
    wait for 10 ns;
    assert (mayor = '1') and (igual = '0') and (menor = '0')
      report "Error al comparar 5 y 3" severity error;

    a <= "0010"; b <= "0110";
    wait for 10 ns;
    assert (mayor = '0') and (igual = '0') and (menor = '1')
      report "Error al comparar 2 y 6" severity error;

    a <= "1111"; b <= "0111";
    wait for 10 ns;
    assert (mayor = '1') and (igual = '0') and (menor = '0')
      report "Error al comparar 15 y 7" severity error;

    a <= "1000"; b <= "1001";
    wait for 10 ns;
    assert (mayor = '0') and (igual = '0') and (menor = '1')
      report "Error al comparar 8 y 9" severity error;

    a <= "1010"; b <= "1010";
    wait for 10 ns;
    assert (mayor = '0') and (igual = '1') and (menor = '0')
      report "Error al comparar 10 y 10" severity error;

    report "Todas las pruebas terminaron correctamente" severity note;
    wait;
  end process estimulos;
end architecture simulacion;

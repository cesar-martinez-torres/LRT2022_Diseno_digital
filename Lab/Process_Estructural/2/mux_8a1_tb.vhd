library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux_8a1_tb is
end entity mux_8a1_tb;

architecture simulacion of mux_8a1_tb is
  component mux_8a1 is
    port (
      d   : in  std_logic_vector(7 downto 0);
      sel : in  unsigned(2 downto 0);
      y   : out std_logic
    );
  end component mux_8a1;

  signal d   : std_logic_vector(7 downto 0) := "10100110";
  signal sel : unsigned(2 downto 0) := "000";
  signal y   : std_logic;
begin
  dut : mux_8a1
    port map (
      d   => d,
      sel => sel,
      y   => y
    );

  estimulos : process
  begin
    sel <= "000";
    wait for 10 ns;
    assert y = '0' report "Error al seleccionar d(0)" severity error;

    sel <= "001";
    wait for 10 ns;
    assert y = '1' report "Error al seleccionar d(1)" severity error;

    sel <= "010";
    wait for 10 ns;
    assert y = '1' report "Error al seleccionar d(2)" severity error;

    sel <= "011";
    wait for 10 ns;
    assert y = '0' report "Error al seleccionar d(3)" severity error;

    sel <= "100";
    wait for 10 ns;
    assert y = '0' report "Error al seleccionar d(4)" severity error;

    sel <= "101";
    wait for 10 ns;
    assert y = '1' report "Error al seleccionar d(5)" severity error;

    sel <= "110";
    wait for 10 ns;
    assert y = '0' report "Error al seleccionar d(6)" severity error;

    sel <= "111";
    wait for 10 ns;
    assert y = '1' report "Error al seleccionar d(7)" severity error;

    report "Todas las pruebas terminaron correctamente" severity note;
    wait;
  end process estimulos;
end architecture simulacion;

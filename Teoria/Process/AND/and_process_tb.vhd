library ieee;
use ieee.std_logic_1164.all;

entity and_process_tb is
end entity and_process_tb;

architecture simulacion of and_process_tb is
  component compuerta_and_all is
    port (
      a : in  std_logic;
      b : in  std_logic;
      y : out std_logic
    );
  end component compuerta_and_all;

  signal a : std_logic := '0';
  signal b : std_logic := '0';
  signal y : std_logic;
begin
  dut : compuerta_and_all
    port map (
      a => a,
      b => b,
      y => y
    );

  estimulos : process
  begin
    a <= '0';
    b <= '0';
    wait for 10 ns;
    assert y = '0'
      report "Error para a=0, b=0" severity error;

    a <= '0';
    b <= '1';
    wait for 10 ns;
    assert y = '0'
      report "Error para a=0, b=1" severity error;

    a <= '1';
    b <= '0';
    wait for 10 ns;
    assert y = '0'
      report "Error para a=1, b=0" severity error;

    a <= '1';
    b <= '1';
    wait for 10 ns;
    assert y = '1'
      report "Error para a=1, b=1" severity error;

    report "Todas las pruebas terminaron correctamente" severity note;
    wait;
  end process estimulos;
end architecture simulacion;

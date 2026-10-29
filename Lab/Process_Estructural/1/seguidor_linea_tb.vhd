library ieee;
use ieee.std_logic_1164.all;

entity seguidor_linea_tb is
end entity seguidor_linea_tb;

architecture simulacion of seguidor_linea_tb is
  component seguidor_linea is
    port (
      sensor_izq : in  std_logic;
      sensor_cen : in  std_logic;
      sensor_der : in  std_logic;
      motor_izq  : out std_logic;
      motor_der  : out std_logic
    );
  end component seguidor_linea;

  signal sensor_izq : std_logic := '0';
  signal sensor_cen : std_logic := '0';
  signal sensor_der : std_logic := '0';
  signal motor_izq  : std_logic;
  signal motor_der  : std_logic;
begin
  dut : seguidor_linea
    port map (
      sensor_izq => sensor_izq,
      sensor_cen => sensor_cen,
      sensor_der => sensor_der,
      motor_izq  => motor_izq,
      motor_der  => motor_der
    );

  estimulos : process
  begin
    sensor_izq <= '0'; sensor_cen <= '0'; sensor_der <= '0';
    wait for 10 ns;
    assert (motor_izq = '0') and (motor_der = '0')
      report "Error para sensores 000" severity error;

    sensor_izq <= '0'; sensor_cen <= '0'; sensor_der <= '1';
    wait for 10 ns;
    assert (motor_izq = '1') and (motor_der = '0')
      report "Error para sensores 001" severity error;

    sensor_izq <= '0'; sensor_cen <= '1'; sensor_der <= '0';
    wait for 10 ns;
    assert (motor_izq = '1') and (motor_der = '1')
      report "Error para sensores 010" severity error;

    sensor_izq <= '0'; sensor_cen <= '1'; sensor_der <= '1';
    wait for 10 ns;
    assert (motor_izq = '1') and (motor_der = '0')
      report "Error para sensores 011" severity error;

    sensor_izq <= '1'; sensor_cen <= '0'; sensor_der <= '0';
    wait for 10 ns;
    assert (motor_izq = '0') and (motor_der = '1')
      report "Error para sensores 100" severity error;

    sensor_izq <= '1'; sensor_cen <= '0'; sensor_der <= '1';
    wait for 10 ns;
    assert (motor_izq = '1') and (motor_der = '1')
      report "Error para sensores 101" severity error;

    sensor_izq <= '1'; sensor_cen <= '1'; sensor_der <= '0';
    wait for 10 ns;
    assert (motor_izq = '0') and (motor_der = '1')
      report "Error para sensores 110" severity error;

    sensor_izq <= '1'; sensor_cen <= '1'; sensor_der <= '1';
    wait for 10 ns;
    assert (motor_izq = '1') and (motor_der = '1')
      report "Error para sensores 111" severity error;

    report "Todas las pruebas terminaron correctamente" severity note;
    wait;
  end process estimulos;
end architecture simulacion;

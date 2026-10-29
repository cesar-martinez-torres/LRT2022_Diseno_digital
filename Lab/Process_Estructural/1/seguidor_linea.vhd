library ieee;
use ieee.std_logic_1164.all;

entity seguidor_linea is
  port (
    sensor_izq : in  std_logic;
    sensor_cen : in  std_logic;
    sensor_der : in  std_logic;
    motor_izq  : out std_logic;
    motor_der  : out std_logic
  );
end entity seguidor_linea;

architecture proceso of seguidor_linea is
begin
  combinacional : process (all)
  begin
    -- Estado predeterminado: robot detenido.
    motor_izq <= '0';
    motor_der <= '0';

    -- Una deteccion lateral asimetrica tiene prioridad.
    if (sensor_izq = '1') and (sensor_der = '0') then
      motor_der <= '1';
      motor_izq <= '0';


    elsif (sensor_der = '1') and (sensor_izq = '0') then
      motor_izq <= '1';
      motor_der <= '0';

    -- Linea centrada, linea ancha o cruce: avanzar.
    elsif (sensor_cen = '1') or
          ((sensor_izq = '1') and (sensor_der = '1')) then
      motor_izq <= '1';
      motor_der <= '1';
    end if;
  end process combinacional;
end architecture proceso;

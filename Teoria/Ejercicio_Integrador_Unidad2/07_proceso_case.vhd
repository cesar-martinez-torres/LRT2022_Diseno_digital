library ieee;
use ieee.std_logic_1164.all;

entity funcion4 is
  port (a, b, c, d : in std_logic; y : out std_logic);
end entity funcion4;

architecture proceso_case of funcion4 is
  signal abcd : std_logic_vector(3 downto 0);
begin
  abcd <= a & b & c & d;

  combinacional : process (abcd)
  begin
    case abcd is
      when "0001" | "0100" | "0101" | "0110" |
           "0111" | "1001" | "1010" | "1011" |
           "1101" | "1110" | "1111" =>
        y <= '1';
      when others =>
        y <= '0';
    end case;
  end process combinacional;
end architecture proceso_case;


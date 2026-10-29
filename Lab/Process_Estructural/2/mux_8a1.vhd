library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux_8a1 is
  port (
    d   : in  std_logic_vector(7 downto 0);
    sel : in  unsigned(2 downto 0);
    y   : out std_logic
  );
end entity mux_8a1;

architecture proceso of mux_8a1 is
begin
  combinacional : process (all)
  begin
    y <= d(to_integer(sel));
  end process combinacional;
end architecture proceso;

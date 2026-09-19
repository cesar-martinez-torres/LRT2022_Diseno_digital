library ieee;
use ieee.std_logic_1164.all;

entity ejercicio01_tb is
end entity ejercicio01_tb;

architecture sim of ejercicio01_tb is
  component ejercicio01 is
    port (a : in std_logic; b : in std_logic; c : in std_logic; y : out std_logic);
  end component ejercicio01;
  signal a : std_logic := '0';
  signal b : std_logic := '0';
  signal c : std_logic := '0';
  signal y : std_logic;
begin
  dut : ejercicio01 port map (a => a, b => b, c => c, y => y);
  stimulus : process
  begin
    a <= '0'; b <= '0'; c <= '0'; wait for 10 ns;
    assert y = '0' report "Error para a=0, b=0, c=0" severity error;
    a <= '0'; b <= '0'; c <= '1'; wait for 10 ns;
    assert y = '0' report "Error para a=0, b=0, c=1" severity error;
    a <= '0'; b <= '1'; c <= '0'; wait for 10 ns;
    assert y = '1' report "Error para a=0, b=1, c=0" severity error;
    a <= '0'; b <= '1'; c <= '1'; wait for 10 ns;
    assert y = '1' report "Error para a=0, b=1, c=1" severity error;
    a <= '1'; b <= '0'; c <= '0'; wait for 10 ns;
    assert y = '0' report "Error para a=1, b=0, c=0" severity error;
    a <= '1'; b <= '0'; c <= '1'; wait for 10 ns;
    assert y = '1' report "Error para a=1, b=0, c=1" severity error;
    a <= '1'; b <= '1'; c <= '0'; wait for 10 ns;
    assert y = '0' report "Error para a=1, b=1, c=0" severity error;
    a <= '1'; b <= '1'; c <= '1'; wait for 10 ns;
    assert y = '1' report "Error para a=1, b=1, c=1" severity error;
    report "Prueba terminada" severity note;
    wait;
  end process stimulus;
end architecture sim;

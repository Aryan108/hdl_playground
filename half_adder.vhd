library IEEE;
use IEEE.std_logic_1164.all;


entity half_adder is
port (
	a,b : in std_logic_vector(1 downto 0);
	s,c : out std_logic_vector(1 downto 0)
);
end entity half_adder;

architecture behav of half_adder is

begin
	s <= a xor b;
	c <= a and b;
	
end behav;

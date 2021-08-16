library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity full_adder is
    port(
        A,B : in std_logic_vector(3 downto 0);
        Cin : in std_logic;
        Cout : out std_logic;
        S : out std_logic_vector(3 downto 0)

    );
end full_adder;

architecture behav of full_adder is
    signal out5bit : std_logic_vector(4 downto 0);
    begin
        out5bit <= ('0' & A) + ('0' & B) + ("0000" & Cin);
        S <= out5bit(3 downto 0);
        Cout <= out5bit(4);
end behav;



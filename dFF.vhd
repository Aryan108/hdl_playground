library ieee;
use ieee.std_logic_1164.all;

entity dFF is 
port (
    d,clk, reset : in std_logic;
    q : out std_logic
);
end dFF;

architecture RTL of dFF is
    begin
        clk_proc :
        process (clk,d,reset)
        begin
            if reset <= '0' then
                q <= '0';
            elsif rising_edge(clk) then
                q <= d;
            end if;
        end process;
end RTL;

                
        

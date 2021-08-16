library ieee;
use ieee.std_logic_1164.all;

entity tFF is 
port (
    t,clk, reset : in std_logic;
    q : out std_logic
);
end tFF;

architecture RTL of tFF is
    begin
        clk_proc :
        process (clk,t,reset)
        begin
            if reset <= '0' then
                q <= '0';
            elsif rising_edge(clk) then
                q <= not t;
            end if;
        end process;
end RTL;

                
        

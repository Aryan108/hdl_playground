library ieee;
use ieee.std_logic_1164.all;

entity dLatch is 
port (
    d,ce, reset : in std_logic;
    q : out std_logic
);
end dLatch;

architecture RTL of dLatch is
    begin
        latch_proc :
        process (ce,d,reset)
        begin
            if reset <= '0' then
                q <= '0';
            elsif ce <= '1' then
                q <= d;
            end if;
        end process latch_proc;
end RTL;

                
        

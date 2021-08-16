library ieee;
use ieee.std_logic_1164.all;

entity srLatch is 
port (
    ce, S,R : in std_logic;
    q , qb: out std_logic
);
end srLatch;

architecture RTL of srLatch is
    begin
        latch_proc :
        process (ce,S,R,q,qb)
        begin
            if ce <= '1' then
                q <= S nand qb;
                qb <= R nand q;
            end if;

        end process;
end RTL;
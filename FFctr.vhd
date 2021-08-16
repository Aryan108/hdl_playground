library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std_unsigned.all;

entity FFctr is
    port(
        clk,en,clr : in std_logic; -- clr and load - active low, en - count enable
        q : out std_logic_vector(3 downto 0)

    );
end FFctr;

-- Structural Architecture
architecture RTL of FFctr is
    component dFF is -- previously defined DFF
        port(
            d,clk,rst in std_logic;
            q : out std_logic

        );
    end component;

    signal dffs_in : std_logic_vector(3 downto 0); -- input to each DFF
    signal dffs_out : std_logic_vector(3 downto 0); -- output of each DFF
    signal ands_out : std_logic_vector(2 downto 0); -- ANDs for each DFF
    begin
        ands_out(0) <= en and dffs_out(0);
        ands_out(1) <= ands_out(0) and dffs_out(1);
        ands_out(2) <= ands_out(1) and dffs_out(2);

        dffs_in(0) <= en XOR dffs_out(0);
        dffs_in(1) <= dffs_out(0) XOR dffs_out(1);
        dffs_in(2) <= dffs_out(1) XOR dffs_out(2);
        dffs_in(3) <= dffs_out(2) XOR dffs_out(3);       

        
        gen: -- generate 4 dffs
        for i in 0 to 3 generate
        dff:
            dFF port map (
                d => dffs_in(i),
                clk => clk,
                rst => clr,
                q => dffs_out(i)
            );
        end generate;
    end RTL;
                    


 
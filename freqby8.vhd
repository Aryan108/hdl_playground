library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std_unsigned.all;

entity freqby8 is
    port(
        clk,en,clr : in std_logic; -- clr - active low
        qout : out std_logic -- serial out

    );
end freqby8;

architecture RTL of freqby8 is
    signal tmp : std_logic_vector(2 downto 0);

    begin            
        process(clk,en,clr)
        begin

            if clr = '0' then
                tmp <= "000";
            elsif rising_edge(clk) and en = '1' then
                tmp <= tmp + 1;
            end if;
        end process;

end RTL;
        

        

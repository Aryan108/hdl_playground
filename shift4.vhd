library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std_unsigned.all;

entity shift4 is
    port(
        clk,en,clr,shift,load,din : in std_logic; -- clr - active low, serial in
        qout : out std_logic -- serial out

    );
end shift4;

architecture RTL of shift4 is
    signal Pl : std_logic_vector(3 downto 0);
    begin
        reg_proc:
        process(clk,shift,load,clr,en)
        begin
            if clr = '0' then -- async clear
                Pl <= "0000";
            elsif rising_edge(clk) then --- sync
                if en = '1' then
                    if shift = '1' then        
                        Pl(0) <= Pl(1);
                        Pl(1) <= Pl(2);
                        Pl(2) <= Pl(3);
                        Pl(3) <= Pl(0);
                    end if;
                    if load = '1' then
                        Pl(0) <= Pl(1);
                        Pl(1) <= Pl(2);
                        Pl(2) <= Pl(3);
                        Pl(3) <= din;
                    end if;
                end if;
            end if;
        end process;
    qout <= Pl(0);
end RTL;
                    


 
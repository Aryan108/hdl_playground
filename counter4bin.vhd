library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std_unsigned.all;

entity counter4bin is
    port(
        clk,en,clr,load,dir : in std_logic; -- clr and load - active low, en - count enable
        din : in std_logic_vector(3 downto 0);
        q : out std_logic_vector(3 downto 0)

    );
end counter4bin;

architecture RTL of counter4bin is
    signal count : std_logic_vector(3 downto 0);
    begin
        count_proc:
        process(clk,load,clr,en,dir)
        begin
            if clr = '0' then -- async clear
                count <= "0000";
            elsif load = '0' then -- async load
                count <= din;
            elsif rising_edge(clk) then --- sync count
                if en = '1' then
                    case(dir) is
                        when '0' => count <= count + 1;
                        when '1' => count <= count - 1;
                        when others  => count <= count;
                    end case;
                else
                    count <= count;
                end if;
            end if;
        end process;
    q <= count;
    end RTL;
                    


 
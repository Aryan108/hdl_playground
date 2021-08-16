library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std_unsigned.all;

entity johnsn4 is
    port(
        clk,en,clr,load,dir : in std_logic; -- clr and load - active low, en - count enable
        din : in std_logic_vector(3 downto 0);
        q : out std_logic_vector(3 downto 0)

    );
end johnsn4;

architecture RTL of johnsn4 is
    signal count : std_logic_vector(3 downto 0);
    begin
        count_proc:
        process(clk,load,clr,dir,en)
        begin
            if clr = '0' then -- async clear
                count <= "0000";
            elsif load = '0' then -- async load
                count <= din;
            elsif rising_edge(clk) then --- sync count
                if en = '1' then
                    case(dir) is
                        when '0' => -- left
                            count(0) <= not count(3);
                            count(1) <= count(0);
                            count(2) <= count(1);
                            count(3) <= count(2);
    
                        when '1' =>  -- right
                            count(0) <= count(1);
                            count(1) <= count(2);
                            count(2) <= count(3);
                            count(3) <= not count(0);
                        when others => count <= count;
                    end case;
                else 
                    count <= count;
                end if;
            end if;
        end process;
    q <= count;
    end RTL;
                    


 
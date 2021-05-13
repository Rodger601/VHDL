----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:36:55 04/26/2020 
-- Design Name: 
-- Module Name:    counter - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use ieee.numeric_std.all;

entity counter is
	generic (n : STD_LOGIC_VECTOR :="0111"
				);
    Port ( Clk, Reset, L, Up, Enable : in  STD_LOGIC;
			  wpis : in  STD_LOGIC_VECTOR (n'length-1 downto 0);
           Q : out  STD_LOGIC_VECTOR (n'length-1 downto 0)
			  );
end counter;

architecture Behavioral of counter is
signal count : STD_LOGIC_VECTOR (n'length-1 downto 0) :=(others=>'0') ;
begin
	process(Clk, Reset, L, Up, Enable)
		begin
			if rising_edge(Clk) and Enable= '1' then
				if Reset = '1' then
					count<= (others=>'0');
				elsif L='1' and wpis <= (n-'1') then
					count<= wpis;
				elsif L='1' and wpis > (n-'1') then
					count<= (n-'1');
				elsif Up='1' and count /= (n-'1') then 
					count<= count +'1';
				elsif Up='1' and count = (n-'1') then 
					count<= (others=>'0');
				elsif Up='0' and not(count=0) then 
					count<= count -'1';
				elsif Up='0' and count = 0 then
					count<= n-'1';
				else null;
				end if;
			end if;
	end process;
	Q<=count;

end Behavioral;


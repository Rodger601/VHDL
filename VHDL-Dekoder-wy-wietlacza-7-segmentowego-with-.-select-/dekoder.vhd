----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:30:29 04/28/2020 
-- Design Name: 
-- Module Name:    dekoder - Behavioral 
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

entity dekoder is
    Port ( adres : in  STD_LOGIC_VECTOR (3 downto 0);
           kod : out  STD_LOGIC_VECTOR (6 downto 0));
end dekoder;

architecture Behavioral of dekoder is

begin

	with adres select
	
		kod <=   "1110111" when "0000",
					"0010010" when "0001",
					"1011101" when "0010",
					"1011011" when "0011",
					"0111010" when "0100",
					"1101011" when "0101",
					"1101111" when "0110",
					"1010010" when "0111",
					"1111111" when "1000",
					"1111011" when "1001",
					"1101101" when "1010"|"1011"|"1100"|
					"1101"|"1110"|"1111",
					"0000000" when others;

end Behavioral;

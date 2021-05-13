----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:24:10 04/27/2020 
-- Design Name: 
-- Module Name:    kompar - Behavioral 
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

entity kompar is
	generic (n: positive :=4);
    Port ( V1 : in  STD_LOGIC_VECTOR (n-1 downto 0);
           V2 : in  STD_LOGIC_VECTOR (n-1 downto 0);
           V1bigger : out  STD_LOGIC;
           Vequal : out  STD_LOGIC;
           V1smaller : out  STD_LOGIC);
end kompar;

architecture Behavioral of kompar is
	signal bigger :  STD_LOGIC;
	signal equal :  STD_LOGIC;
	signal smaller : STD_LOGIC;
	
begin
		process (V1, V2)
			begin
				if V1>V2 then
					bigger <= '1';
					equal <= '0';
					smaller <= '0';
				elsif V1<V2 then
					bigger <= '0';
					equal <= '0';
					smaller <= '1';
				elsif V1=V2 then
					bigger <= '0';
					equal <= '1';
					smaller <= '0';
				end if;
		end process;
	V1bigger <= bigger;
	Vequal  <= equal;
	V1smaller <= smaller;

end Behavioral;


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:51:40 05/09/2020 
-- Design Name: 
-- Module Name:    automat - Behavioral 
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

entity automat is
    Port ( cz10gr : in  STD_LOGIC;
           cz20gr : in  STD_LOGIC;
           cz50gr : in  STD_LOGIC;
           cz1zl : in  STD_LOGIC;
           cz2zl : in  STD_LOGIC;
           cz5zl : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  clk : in  STD_LOGIC;
			  wydnap : out  STD_LOGIC :='0';
           reszta5 : inout  STD_LOGIC_VECTOR(1 downto 0) := (others=>'0');
			  reszta2 : inout  STD_LOGIC_VECTOR(1 downto 0):= (others=>'0');
			  reszta1 : inout  STD_LOGIC_VECTOR(1 downto 0):= (others=>'0');
			  reszta50 : inout  STD_LOGIC_VECTOR(1 downto 0):= (others=>'0');
			  reszta20 : inout  STD_LOGIC_VECTOR(1 downto 0):= (others=>'0');
			  reszta10 : inout  STD_LOGIC_VECTOR(1 downto 0):= (others=>'0')
			  );
end automat;

architecture Behavioral of automat is
	type stan is (S1, S2, S3, S4);
	signal S :stan :=S1;
	signal por :STD_LOGIC :='0';
begin
	process (clk, cz10gr,  cz20gr, cz50gr, cz1zl, cz2zl, cz5zl, reset)
	variable sum : integer :=0 ;
	
		begin
			if rising_edge(clk) then
												
				case S is
					when S1 =>
						wydnap<='0';
										
						if cz10gr='1' then sum:=sum+10;
							elsif cz20gr='1' then sum:=sum+20;
							elsif cz50gr='1' then sum:=sum+50;
							elsif cz1zl='1' then sum:=sum+100;
							elsif cz2zl='1' then sum:=sum+200;
							elsif cz5zl='1' then sum:=sum+500;
							else null;
						end if;
						
						if sum>=330 then por<='1';
							else por<='0';
						end if;
										
						if (por = '0' and reset = '0') then S<=S1;
							elsif (por = '0' and reset = '1') then S<=S2;
							elsif (por = '1') then S<=S3;
							else null;
						end if;
											
					when S2 =>
						wydnap<='0';
												
						if sum>=500 then reszta5<=reszta5+'1';  sum:=sum-500;
							elsif sum>=200 then reszta2<=reszta2+'1'; sum:=sum-200;
							elsif sum>=100 then reszta1<=reszta1+'1'; sum:=sum-100;
							elsif sum>=50 then reszta50<=reszta50+'1'; sum:=sum-50;
							elsif sum>=20 then reszta20<=reszta20+'1'; sum:=sum-20;
							elsif sum>=10 then reszta10<=reszta10+'1'; sum:=sum-10;
							else null;
						end if;
												
						if sum=0 then S<=S4;
							else null;
						end if;
											
					when S3 =>
						wydnap<='1';
											
						if sum>=830 then reszta5<=reszta5+'1';  sum:=sum-500;
							elsif sum>=530 then reszta2<=reszta2+'1'; sum:=sum-200;
							elsif sum>=430 then reszta1<=reszta1+'1'; sum:=sum-100;
							elsif sum>=380 then reszta50<=reszta50+'1'; sum:=sum-50;
							elsif sum>=350 then reszta20<=reszta20+'1'; sum:=sum-20;
							elsif sum>=340 then reszta10<=reszta10+'1'; sum:=sum-10;
							else null;
						end if;
											
						if sum=330 then S<=S4;
							else null;
						end if;
													
					when S4 =>	
						wydnap<='0';
												
						reszta5 <=(others=>'0');
						reszta2 <=(others=>'0');
						reszta1 <=(others=>'0');
						reszta50 <=(others=>'0');
						reszta20<=(others=>'0');
						reszta10 <=(others=>'0');
						sum:=0;
						por<='0';

						S<=S1;
											
					when others => null;
				end case;
			end if;
	end process;

end Behavioral;


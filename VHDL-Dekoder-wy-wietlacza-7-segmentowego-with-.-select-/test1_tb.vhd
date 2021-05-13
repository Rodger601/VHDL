--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:34:14 04/28/2020
-- Design Name:   
-- Module Name:   C:/Users/Ja/Desktop/pk/semestr_VI/SUCS/projektyVHDL/dek7segm/test1.vhd
-- Project Name:  dek7segm
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: dekoder
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

ENTITY test1 IS
END test1;
 
ARCHITECTURE behavior OF test1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT dekoder
    PORT(
         adres : IN  std_logic_vector(3 downto 0);
         kod : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal adres : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal kod : std_logic_vector(6 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: dekoder PORT MAP (
          adres => adres,
          kod => kod
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
adres<= (others =>'0');
	  wait for 10 ns;	
for i in 0 to 15 loop
adres<= adres+'1';
wait for 1 ns;
end loop;


      wait;
   end process;

END;

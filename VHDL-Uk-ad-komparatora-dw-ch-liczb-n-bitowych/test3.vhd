--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:47:16 04/29/2020
-- Design Name:   
-- Module Name:   C:/Users/Ja/Desktop/pk/semestr_VI/SUCS/projektyVHDL/proj2/test3.vhd
-- Project Name:  proj2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: kompar
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
 
ENTITY test3 IS
END test3;
 
ARCHITECTURE behavior OF test3 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT kompar
    PORT(
         V1 : IN  std_logic_vector(3 downto 0);
         V2 : IN  std_logic_vector(3 downto 0);
         V1bigger : OUT  std_logic;
         Vequal : OUT  std_logic;
         V1smaller : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal V1 : std_logic_vector(3 downto 0) := (others => '0');
   signal V2 : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal V1bigger : std_logic;
   signal Vequal : std_logic;
   signal V1smaller : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: kompar PORT MAP (
          V1 => V1,
          V2 => V2,
          V1bigger => V1bigger,
          Vequal => Vequal,
          V1smaller => V1smaller
        );

   -- Stimulus process
   stim_proc: process
   begin		

      wait for 10 ns;	
		V1<="0110";
		wait for 10 ns;
		V2<="1010";
		wait for 10 ns;	
		V1<="1101";
		wait for 10 ns;
		V2<="1101";

      wait;
   end process;

END;

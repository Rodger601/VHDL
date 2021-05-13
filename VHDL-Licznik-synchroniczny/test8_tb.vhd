--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   03:25:37 04/27/2020
-- Design Name:   
-- Module Name:   C:/Users/Ja/Desktop/pk/semestr_VI/SUCS/projektyVHDL/proj1/test8_tb.vhd
-- Project Name:  proj1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: counter
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test8_tb IS
END test8_tb;
 
ARCHITECTURE behavior OF test8_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT counter
    PORT(
         Clk : IN  std_logic;
         Reset : IN  std_logic;
         L : IN  std_logic;
         Up : IN  std_logic;
         Enable : IN  std_logic;
         wpis : IN  std_logic_vector(3 downto 0);
         Q : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Reset : std_logic := '0';
   signal L : std_logic := '0';
   signal Up : std_logic := '1';
   signal Enable : std_logic := '0';
   signal wpis : std_logic_vector(3 downto 0) := "0011";
	
 	--Outputs
   signal Q : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: counter PORT MAP (
          Clk => Clk,
          Reset => Reset,
          L => L,
          Up => Up,
          Enable => Enable,
          wpis => wpis,
          Q => Q
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

Enable<='1';
  wait for 100 ns;
L<='1';
   wait for Clk_period;      
	
L<='0';	
Up<='0'; 
wait for 100 ns;
Up<='1';        
    wait for 100 ns;      
Reset <='1';


      wait for Clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;

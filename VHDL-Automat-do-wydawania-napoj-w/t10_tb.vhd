--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:38:45 05/11/2020
-- Design Name:   
-- Module Name:   C:/Users/Ja/Desktop/pk/semestr_VI/SUCS/projektyVHDL/automat/t10.vhd
-- Project Name:  automat
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: automat
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
 
ENTITY t10 IS
END t10;
 
ARCHITECTURE behavior OF t10 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT automat
    PORT(
         cz10gr : IN  std_logic;
         cz20gr : IN  std_logic;
         cz50gr : IN  std_logic;
         cz1zl : IN  std_logic;
         cz2zl : IN  std_logic;
         cz5zl : IN  std_logic;
         reset : IN  std_logic;
         clk : IN  std_logic;
         wydnap : OUT  std_logic;
         reszta5 : INOUT  std_logic_vector(1 downto 0);
         reszta2 : INOUT  std_logic_vector(1 downto 0);
         reszta1 : INOUT  std_logic_vector(1 downto 0);
         reszta50 : INOUT  std_logic_vector(1 downto 0);
         reszta20 : INOUT  std_logic_vector(1 downto 0);
         reszta10 : INOUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal cz10gr : std_logic := '0';
   signal cz20gr : std_logic := '0';
   signal cz50gr : std_logic := '0';
   signal cz1zl : std_logic := '0';
   signal cz2zl : std_logic := '0';
   signal cz5zl : std_logic := '0';
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';

	--BiDirs
   signal reszta5 : std_logic_vector(1 downto 0);
   signal reszta2 : std_logic_vector(1 downto 0);
   signal reszta1 : std_logic_vector(1 downto 0);
   signal reszta50 : std_logic_vector(1 downto 0);
   signal reszta20 : std_logic_vector(1 downto 0);
   signal reszta10 : std_logic_vector(1 downto 0);

 	--Outputs
   signal wydnap : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: automat PORT MAP (
          cz10gr => cz10gr,
          cz20gr => cz20gr,
          cz50gr => cz50gr,
          cz1zl => cz1zl,
          cz2zl => cz2zl,
          cz5zl => cz5zl,
          reset => reset,
          clk => clk,
          wydnap => wydnap,
          reszta5 => reszta5,
          reszta2 => reszta2,
          reszta1 => reszta1,
          reszta50 => reszta50,
          reszta20 => reszta20,
          reszta10 => reszta10
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		

      wait for 10 ns;	

		cz5zl<= '1';
		wait for 10 ns;
		cz5zl<= '0';
		wait for 100 ns;
			
		cz10gr<= '1';
		wait for 10 ns;
		cz10gr<= '0';
      cz20gr<= '1';
		wait for 10 ns;
		cz20gr<= '0';
		wait for 10 ns;
		reset<='1';
		wait for 10 ns;
		reset<='0';
		wait for 100 ns;
			
		cz50gr<= '1';
		wait for 10 ns;
		cz50gr<= '0';
      cz20gr<= '1';
		wait for 10 ns;
		cz20gr<= '0';
		cz2zl<= '1';
		wait for 10 ns;
		cz2zl<= '0';
      cz1zl<= '1';
		wait for 10 ns;
		cz1zl<= '0';
		wait for 100 ns;

      wait;
   end process;

END;

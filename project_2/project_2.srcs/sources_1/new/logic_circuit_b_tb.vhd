----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.03.2018 17:57:16
-- Design Name: 
-- Module Name: logic_circuit_b_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity logic_circuit_b_tb is
--  Port ( );
end logic_circuit_b_tb;

ARCHITECTURE behavior OF logic_circuit_b_TB IS 
 
    -- (UUT)
 
    COMPONENT logic_circuit_b
    PORT(
         B : IN  std_logic_vector(15 downto 0);
         S_in : IN  std_logic_vector(1 downto 0);
         Y_out : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --In
   signal B : std_logic_vector(15 downto 0) := (others => '0');
   signal S_in : std_logic_vector(1 downto 0) := (others => '0');

 	--Out
   signal Y_out : std_logic_vector(15 downto 0);
 
BEGIN
 
	-- (UUT)
   uut: logic_circuit_b PORT MAP (
          B => B,
          S_in => S_in,
          Y_out => Y_out
        );

   -- test process
   test: process
   begin		
		B <= x"AAAA";
		S_in <= "00";
		
		wait for 5ns;
		S_in <= "01";
		
		wait for 5ns;
		S_in <= "10";
		
		wait for 5ns;
		S_in <= "11";

      wait;
   end process;

END;


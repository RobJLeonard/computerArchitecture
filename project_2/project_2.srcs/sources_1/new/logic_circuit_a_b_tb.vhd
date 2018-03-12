----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.03.2018 17:38:47
-- Design Name: 
-- Module Name: logic_circuit_a_b_tb - Behavioral
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

entity logic_circuit_a_b_tb is
--  Port ( );
end logic_circuit_a_b_tb;

architecture Behavioral of logic_circuit_a_b_tb is


    -- component declaration
 COMPONENT logic_circuit_a_b
    PORT(
         a_logic_in : IN  std_logic_vector(15 downto 0);
         b_logic_in : IN  std_logic_vector(15 downto 0);
         select_in : IN  std_logic_vector(1 downto 0);
         logic_output_a_b : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --In
   signal a_logic_in : std_logic_vector(15 downto 0) := (others => '0');
   signal b_logic_in : std_logic_vector(15 downto 0) := (others => '0');
   signal select_in : std_logic_vector(1 downto 0) := (others => '0');

 	--Out
   signal logic_output_a_b : std_logic_vector(15 downto 0);
 
BEGIN
 
	-- (UUT)
   uut: logic_circuit_a_b PORT MAP (
          a_logic_in => a_logic_in,
          b_logic_in => b_logic_in,
          select_in => select_in,
          logic_output_a_b => logic_output_a_b
        ); 

   -- test process
   test: process
   begin		
		wait for 5ns;
		a_logic_in <= x"FFFF";
		b_logic_in <= x"9999";
		select_in <= "00";
		
		wait for 5ns;
		select_in <= "01";
		
		wait for 5ns;
		select_in <= "10";
		
		wait for 5ns;
		select_in <= "11";

      wait;
   end process;


end Behavioral;

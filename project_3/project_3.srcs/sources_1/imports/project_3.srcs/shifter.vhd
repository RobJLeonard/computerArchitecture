----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.03.2018 20:21:35
-- Design Name: 
-- Module Name: shifter - Behavioral
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

entity shifter is
	Port ( 
		In0 : in std_logic;
		In1 : in std_logic;
		In2 : in std_logic;
		s : in std_logic_vector(1 downto 0);
		Z : out std_logic
	);
end shifter;

architecture Behavioral of shifter is

begin

	Z <= In0 after 1ns when S="00" else
		In1 after 1ns when S="01" else
		In2 after 1ns when S="10" else
		'0' after 1ns;
	
end Behavioral;

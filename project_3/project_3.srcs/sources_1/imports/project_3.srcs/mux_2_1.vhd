----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.03.2018 17:46:05
-- Design Name: 
-- Module Name: mux_2_1 - Behavioral
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

entity mux2_1 is
	Port(
		Sel : in std_logic;
		In0 : in std_logic;
		In1 : in std_logic;
		mux_out : out std_logic
	);
end mux2_1;

architecture Behavioral of mux2_1 is

begin

	mux_out <= 	In0 after 1ns when Sel = '0' else
				In1 after 1ns when Sel = '1' else
				'0' after 1ns;

end Behavioral;
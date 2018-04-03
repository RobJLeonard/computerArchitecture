----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    
-- Design Name: 
-- Module Name:    decoder - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decoder is
	Port(
			a0, a1, a2, aControl : in STD_LOGIC;
			q0, q1, q2, q3, q4, q5, q6, q7, q8 : out STD_LOGIC
		);
end decoder;

architecture Behavioral of decoder is

begin
	q0 <= ((not a2) and (not a1) and (not a0) and (not aControl)) after 5ns;    --0000
	q1 <= ((not a2) and (not a1) and (a0) and (not aControl)) after 5ns;		--0010
	q2 <= ((not a2) and (a1) and (not a0) and (not aControl)) after 5ns;		--0100
	q3 <= ((not a2) and (a1) and (a0) and (not aControl)) after 5ns;			--0110
	q4 <= ((a2) and (not a1) and (not a0) and (not aControl)) after 5ns;		--1000
	q5 <= ((a2) and (not a1) and (a0) and (not aControl)) after 5ns;			--1010
	q6 <= ((a2) and (a1) and (not a0) and (not aControl)) after 5ns;			--1100
	q7 <= ((a2) and (a1) and (a0) and (not aControl)) after 5ns;				--1110
    q8 <= ((not a2) and (not a1) and (not a0) and (aControl)) after 5ns;        --0001
end Behavioral;

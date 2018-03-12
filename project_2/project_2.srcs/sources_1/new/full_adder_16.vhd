----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Robert Leonard
-- 
-- Create Date: 03/07/2018 01:52:33 PM
-- Design Name: 
-- Module Name: full_adder_16 - Behavioral
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

entity full_adder_16 is
  Port (
        A, B : in STD_LOGIC;
        Cin  : in STD_LOGIC;
        Cout : out STD_LOGIC;
        S    : out STD_LOGIC
   );
end full_adder_16;

architecture Behavioral of full_adder_16 is
        
begin
        S <= ( A xor B xor Cin);
        Cout <= (A and B) or (A and Cin) or (B and Cin);

end Behavioral;

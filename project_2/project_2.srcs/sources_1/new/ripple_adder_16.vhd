----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Robert Leonard
-- 
-- Create Date: 03/07/2018 01:44:18 PM
-- Design Name: 
-- Module Name: ripple_adder_16 - Behavioral
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

entity ripple_adder_16 is
  Port ( 
    A, B : in STD_LOGIC_VECTOR(15 downto 0);
    Cin : in STD_LOGIC;
    Cout, V_out : out STD_LOGIC;
    Gout : out STD_LOGIC_VECTOR(15 downto 0)
  );
end ripple_adder_16;

architecture Behavioral of ripple_adder_16 is

    Component full_adder_16
		Port(
			X, Y, Cin : in STD_LOGIC;
			Cout, S : out STD_LOGIC
			);
	End Component;

    --signals - 16 carry bits and 1 output
	signal C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15: STD_LOGIC;
	signal C_out : STD_LOGIC;

begin

    adder00: full_adder_16 PORT MAP (
            X   =>  A(0),
            Y   =>  B(0),
            Cin =>  Cin,
            Cout    =>  C0,
            S       =>  Gout(0)   
       );
       
       adder01: full_adder_16 PORT MAP (
            X   =>  A(1),
            Y   =>  B(1),
            Cin =>  C0,
            Cout    =>  C1,
            S       =>  Gout(1)   
       );
       
       adder02: full_adder_16 PORT MAP (
            X   =>  A(2),
            Y   =>  B(2),
            Cin =>  C1,
            Cout    =>  C2,
            S       =>  Gout(2)   
       );
       
       adder03: full_adder_16 PORT MAP (
            X   =>  A(3),
            Y   =>  B(3),
            Cin =>  C2,
            Cout    =>  C3,
            S       =>  Gout(3)   
       );
       
       adder04: full_adder_16 PORT MAP (
            X   =>  A(4),
            Y   =>  B(4),
            Cin =>  C3,
            Cout    =>  C4,
            S       =>  Gout(4)   
       );
       
       adder05: full_adder_16 PORT MAP (
            X   =>  A(5),
            Y   =>  B(5),
            Cin =>  C4,
            Cout    =>  C5,
            S       =>  Gout(5)   
       );
       
       adder06: full_adder_16 PORT MAP (
            X   =>  A(6),
            Y   =>  B(6),
            Cin =>  C5,
            Cout    =>  C6,
            S       =>  Gout(6)   
       );
       
       adder07: full_adder_16 PORT MAP (
            X   =>  A(7),
            Y   =>  B(7),
            Cin =>  C6,
            Cout    =>  C7,
            S       =>  Gout(7)   
       );
       
       adder08: full_adder_16 PORT MAP (
            X   =>  A(8),
            Y   =>  B(8),
            Cin =>  C7,
            Cout    =>  C8,
            S       =>  Gout(8)   
       );
       
       adder09: full_adder_16 PORT MAP (
            X   =>  A(9),
            Y   =>  B(9),
            Cin =>  C8,
            Cout    =>  C9,
            S       =>  Gout(9)   
       );
       
       adder10: full_adder_16 PORT MAP (
            X   =>  A(10),
            Y   =>  B(10),
            Cin =>  C9,
            Cout    =>  C10,
            S       =>  Gout(10)   
       );
       
       adder11: full_adder_16 PORT MAP (
            X   =>  A(11),
            Y   =>  B(11),
            Cin =>  C10,
            Cout    =>  C11,
            S       =>  Gout(11)   
       );
        
       adder12: full_adder_16 PORT MAP (
            X   =>  A(12),
            Y   =>  B(12),
            Cin =>  C11,
            Cout    =>  C12,
            S       =>  Gout(12)   
       );
        
       adder13: full_adder_16 PORT MAP (
            X   =>  A(13),
            Y   =>  B(13),
            Cin =>  C12,
            Cout    =>  C13,
            S       =>  Gout(13)   
       );
        
       adder14: full_adder_16 PORT MAP (
            X   =>  A(14),
            Y   =>  B(14),
            Cin =>  C13,
            Cout    =>  C14,
            S       =>  Gout(14)   
       );
        
       adder15: full_adder_16 PORT MAP (
            X   =>  A(15),
            Y   =>  B(15),
            Cin =>  C14,
            Cout    =>  C15,
            S       =>  Gout(15)   
       );
        -- last FA carry becomes RA carry
        C_out <= C15;
        -- carry flag
        Cout <= C_out;
        -- overflow flag
        V_out <= (C15 xor C14);

end Behavioral;

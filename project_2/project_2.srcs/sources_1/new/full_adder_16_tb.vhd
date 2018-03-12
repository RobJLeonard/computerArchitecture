----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Robert Leonard
-- 
-- Create Date: 03/07/2018 02:05:08 PM
-- Design Name: 
-- Module Name: full_adder_16_tb - Behavioral
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

entity full_adder_16_tb is
end full_adder_16_tb;

architecture Behavioral of full_adder_16_tb is
    
    COMPONENT full_adder_16
    port(
         X,Y,Cin : in STD_LOGIC;   
         S, Cout : out STD_LOGIC
    );
    end COMPONENT;

    --in 
    signal X : STD_LOGIC := '0';
    signal Y : STD_LOGIC := '0';
    signal Cin : STD_LOGIC := '0';

    --out
    signal S : STD_LOGIC := '0';
    signal Cout : STD_LOGIC := '0';

BEGIN

    -- (UUT)
   uut: full_adder_16 PORT MAP (
        X => X,
        Y => Y,
        Cin => Cin,
        S => S,
        Cout => Cout
   );


    --testing
    test: process
    begin
    
    wait for 10ns;
    X <= '1';
    
    wait for 10ns;
    Y <= '1';
    
    wait for 10ns;
    Cin <= '1';
    
    wait for 10ns;
    X <= '0';
        
    wait for 10ns;
    Y <= '0';


    end process;

END;
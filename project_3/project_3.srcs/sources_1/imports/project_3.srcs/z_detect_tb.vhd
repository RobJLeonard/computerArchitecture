----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.03.2018 15:28:10
-- Design Name: 
-- Module Name: z_detect_tb - Behavioral
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

entity z_detect_tb is
end z_detect_tb;

architecture Behavioral of z_detect_tb is

    component z_detect
	port ( 
		I : in std_logic_vector(15 downto 0);
		O : out std_logic
	);
end component;

   --inputs    
    signal I : std_logic_vector(15 downto 0):= x"0000";
    
    --outputs
    signal O : std_logic := '0';
        
begin

    -- instantiate component for test, connect ports to internal signals
    UUT: z_detect
    Port Map(
        I => I,
        O => O
    );
    
test :process
begin
        
        --Test non zero value
        I <= x"00FF";
        wait for 1ns;
        
        --Test zero value
        I <= x"0000";
        wait for 1ns;
        
        --Test non zero value
        I <= x"AFFF";
        wait for 1ns;
        
        --Test zero value
        I <= x"0000";
        wait for 1ns;
        
     wait;
     end process;
     
end;

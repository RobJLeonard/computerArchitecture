----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.03.2018 21:37:39
-- Design Name: 
-- Module Name: shifter_16_tb - Behavioral
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

entity shifter_16_tb is
--  Port ( );
end shifter_16_tb;

architecture Behavioral of shifter_16_tb is
-- declare component to test
    component shifter_16 is
        Port ( 
		    B : in std_logic_vector (15 downto 0);
			FS : in std_logic_vector (4 downto 0);
			Lr : in std_logic;
			Ll : in std_logic;
			H : out std_logic_vector (15 downto 0)
		);
    end component;
    
    -- signals for tests (initialise to 0)
    
    --inputs    
    signal B : std_logic_vector(15 downto 0) := x"0000";
    signal FS : std_logic_vector(4 downto 0) := "00000";
    signal Lr : std_logic := '0';
    signal Ll : std_logic := '0';
    
    --outputs 
    signal H : std_logic_vector(15 downto 0) := x"0000";  
        
begin

    -- instantiate component for test, connect ports to internal signals
    UUT: shifter_16
    Port Map(
        B => B,
        FS => FS,
        Lr => Lr,
        Ll => Ll,
        H => H
    );
    
simulation_process :process
begin
        --Check that incorrect FS code doesn't perform shift (H = 0x0000)
       	B <= x"0FF0";
       	FS <= "01100";
        wait for 1ns;
        
        --Check that FS = 10000 passes B (H = 0x0FF0)
        FS <= "10000";
        wait for 1ns;
        
        --Check that LSR works correctly... 0x0FF0 >> = 0x7F8
       	FS <= "10100";
        wait for 1ns;
        
        --Check that LSL works correctly... 0x0FF0 << = 0x1FE0
       	FS <= "11000";
        wait for 1ns;
        
     end process;
    
end Behavioral;
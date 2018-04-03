----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.03.2018 16:38:04
-- Design Name: 
-- Module Name: ripple_adder_16_tb - Behavioral
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

entity ripple_adder_16_tb is
end ripple_adder_16_tb;

architecture Behavioral of ripple_adder_16_tb is

    -- Component Declaration 
    COMPONENT ripple_adder_16
    PORT(
         A : in  std_logic_vector(15 downto 0);
         B : in  std_logic_vector(15 downto 0);
         Cin : in  std_logic;
         Cout : out  std_logic;
         V_out : out  std_logic;
         Gout : out  std_logic_vector(15 downto 0)
        );
    END COMPONENT;


    --In
   signal X : std_logic_vector(15 downto 0) := (others => '0');
   signal Y : std_logic_vector(15 downto 0) := (others => '0');
   signal Cin : std_logic := '0';
   
   --Out
   signal Cout : std_logic;
   signal V_out : std_logic;
   signal Gout : std_logic_vector(15 downto 0);


begin

    -- (UUT)
   uut: ripple_adder_16 PORT MAP (
          A => X,
          B => Y,
          Cin => Cin,
          Cout => Cout,
          V_out => V_out,
          Gout => Gout
        ); 

   -- Stimulus process
   stim_proc: process
   begin		
		X <= x"AAAA";
		Y <= x"FBAA";
		Cin <= '1';
		
		wait for 80ns;
		
		X <= x"FFFF";
		Y <= x"0000";
		Cin <= '1';
		wait for 80ns;
		X <= x"0000";
        Y <= x"0000";
        Cin <= '0';
        
        wait for 80ns;
        X <= x"0001";
        Y <= x"0001";
        Cin <= '0';
        
        wait for 80ns;
        X <= x"ffff";
        Y <= x"0001";
        Cin <= '0';
        
        wait for 80ns;
        X <= x"8000";
        Y <= x"8000";
        Cin <= '0';
	
      wait;
   end process;


end Behavioral;

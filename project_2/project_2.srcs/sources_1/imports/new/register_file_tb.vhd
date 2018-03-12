--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date: 
-- Design Name:   
-- Module Name:   
-- Project Name:  
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: register_file
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY register_file_tb IS
END register_file_tb;
 
ARCHITECTURE behavior OF register_file_tb IS 
 
    -- Component Declaration 
 
    COMPONENT register_file
    PORT(
         a_select, b_select : IN  STD_LOGIC_VECTOR(2 downto 0);         
         des_select : IN  STD_LOGIC_VECTOR(2 downto 0);     
         write : IN  std_logic;
         clk : IN  std_logic;
         data : IN  std_logic_vector(15 downto 0);
         reg0 : OUT  std_logic_vector(15 downto 0);
         reg1 : OUT  std_logic_vector(15 downto 0);
         reg2 : OUT  std_logic_vector(15 downto 0);
         reg3 : OUT  std_logic_vector(15 downto 0);
         reg4 : OUT  std_logic_vector(15 downto 0);
         reg5 : OUT  std_logic_vector(15 downto 0);
         reg6 : OUT  std_logic_vector(15 downto 0);
         reg7 : OUT  std_logic_vector(15 downto 0);
         a_reg : OUT  std_logic_vector(15 downto 0);
         b_reg : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --In
   signal a_select : std_logic_vector(2 downto 0);
   signal b_select : std_logic_vector(2 downto 0);
   signal des_select : std_logic_vector(2 downto 0);
   signal write : std_logic := '0';
   signal clock : std_logic := '0';
   signal data : std_logic_vector(15 downto 0) := (others => '0');

 	--Out
   signal reg0 : std_logic_vector(15 downto 0);
   signal reg1 : std_logic_vector(15 downto 0);
   signal reg2 : std_logic_vector(15 downto 0);
   signal reg3 : std_logic_vector(15 downto 0);
   signal reg4 : std_logic_vector(15 downto 0);
   signal reg5 : std_logic_vector(15 downto 0);
   signal reg6 : std_logic_vector(15 downto 0);
   signal reg7 : std_logic_vector(15 downto 0);
   signal a_reg : std_logic_vector(15 downto 0);
   signal b_reg : std_logic_vector(15 downto 0);

   -- Clock definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- (UUT)
   uut: register_file PORT MAP (
          a_select => a_select,
          b_select => b_select,
          des_select => des_select,
          write => write,
          clk => clock,
          data => data,
          reg0 => reg0,
          reg1 => reg1,
          reg2 => reg2,
          reg3 => reg3,
          reg4 => reg4,
          reg5 => reg5,
          reg6 => reg6,
          reg7 => reg7,
          a_reg => a_reg,
          b_reg => b_reg
        );

   -- Clock process 
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Testing
   test: process
   begin
   		
		wait for 10ns;
		-- set data_load to 0 (from data input line)
		write <= '0';
		des_select <= "000";
		data <= x"0000";

		
		wait for 10ns;
		write <= '1';
		des_select <= "100";
		data <= x"1111";
		
		wait for 10ns;
		write <= '1';
		des_select <= "010";
		data <= x"2222";
		
		wait for 10ns;
		des_select <= "110";
		data <= x"3333";
		
		wait for 10ns;
		des_select <= "001";
		data <= x"4444";
		
		wait for 10ns;
		des_select <= "101";
		data <= x"5555";
		
		wait for 10ns;
		des_select <= "011";
		data <= x"6666";
		
		wait for 10ns;
		des_select <= "111";
		data <= x"7777";
		
		
		-- set a select to reg2 addr[010]
		-- set b select to reg5 addr[101] 
		wait for 10ns;
        a_select <= "010";
        b_select <= "101";
         
        -- set destination register to reg7 addr[111]        
		wait for 10ns;
        des_select <= "111";
        
        -- set data_load to 1 
        wait for 10ns;
        write <= '1';
	
   end process;

END;
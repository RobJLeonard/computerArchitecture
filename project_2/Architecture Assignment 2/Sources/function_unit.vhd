----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.03.2018 20:27:14
-- Design Name: 
-- Module Name: function_unit - Behavioral
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

entity function_unit is
	Port ( 
		A : in std_logic_vector(15 downto 0);
		B : in std_logic_vector(15 downto 0);
		FS : in std_logic_vector(4 downto 0);
		V : out std_logic;
		C : out std_logic;
		N : out std_logic;
		Z : out std_logic;	
		F : out std_logic_vector(15 downto 0)
	);
end function_unit;

architecture Behavioral of function_unit is
-- components

	-- 16bit Arithmetic Logic Unit (ALU)
	component alu_16
		Port(
			A: in std_logic_vector(15 downto 0);       -- A data input of the 16-bit ALU
	   		B: in std_logic_vector(15 downto 0);       -- B data input of the 16-bit ALU
	   		Gsel: in std_logic_vector(3 downto 0);     -- FS control input of the 16-bit ALU 
		   	F: out std_logic_vector(15 downto 0);      -- 16-bit data output of the 16-bit ALU 
		   	V : out std_logic;                         -- Overflow Flag out
		   	C : out std_logic;                         -- Carry Flag out
		   	N : out std_logic;                         -- Negative Flag out
		   	Z : out std_logic                          -- Zero Flag Out
		);
	end component;
	
	
	-- 16bit Shifter
	component shifter_16
		Port(
			B : in std_logic_vector (15 downto 0);
			FS : in std_logic_vector (4 downto 0);
			Lr : in std_logic;
			Ll : in std_logic;
			H : out std_logic_vector (15 downto 0)
		);
	end component;
	
	-- 2 to 1 line multiplexer
	component mux_2_16
		Port(
			In0 : IN std_logic_vector(15 downto 0);
			In1 : IN std_logic_vector(15 downto 0);
			s : IN std_logic;
			Z : OUT std_logic_vector(15 downto 0)
		);
	end component;
	
	-- signals
	signal ALU_out, shifter_out, mux_out : std_logic_vector(15 downto 0);
	
begin
	-- Arithmetic Logic Unit (ALU)
	alu: alu_16
	Port Map(
		A => A,
		B => B,
		Gsel(0) => FS(0),
		Gsel(1) => FS(1),
		Gsel(2) => FS(2),
		Gsel(3) => FS(3),
		F => ALU_out,
		V => V,
		C => C,
		N => N, 
		Z => Z
	);
	
	-- 16 Bit Shifter
	shifter: shifter_16
	Port Map(
		B => B,
		FS => FS,
		Lr => '0',
		Ll => '0',
		H => shifter_out
	);
	
	-- 2 to 1 mux
	MUXF: mux_2_16
	Port Map(
		In0 => ALU_out,
		In1 => shifter_out,
		s => FS(4),
		Z => F
	);
  

end Behavioral;

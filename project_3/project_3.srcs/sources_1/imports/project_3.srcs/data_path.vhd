----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.03.2018 20:32:20
-- Design Name: 
-- Module Name: data_path - Behavioral
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

entity data_path is
	Port (
	    TA : in std_logic;
        TB : in std_logic;
        TD : in std_logic;
		data_in : in std_logic_vector(15 downto 0);
		constant_in : in std_logic_vector(15 downto 0);
		a_address : in std_logic_vector(2 downto 0);
		b_address : in std_logic_vector(2 downto 0);
		d_address : in std_logic_vector(2 downto 0);
		FS : in std_logic_vector(4 downto 0);
		write : in std_logic;
		clock : in std_logic;
		v_out : out std_logic;
		c_out : out std_logic;
		n_out : out std_logic;
		z_out : out std_logic;
		mb_select : in std_logic;
		md_select : in std_logic;
		bus_a_adr_out : out std_logic_vector(15 downto 0);
		bus_b_data_out : out std_logic_vector(15 downto 0);		
		reg_0_data_out : out std_logic_vector(15 downto 0);
		reg_1_data_out : out std_logic_vector(15 downto 0);
		reg_2_data_out : out std_logic_vector(15 downto 0);
		reg_3_data_out : out std_logic_vector(15 downto 0);
		reg_4_data_out : out std_logic_vector(15 downto 0);
		reg_5_data_out : out std_logic_vector(15 downto 0);
		reg_6_data_out : out std_logic_vector(15 downto 0);
		reg_7_data_out : out std_logic_vector(15 downto 0);
		reg_8_data_out : out std_logic_vector(15 downto 0);
		f_data_out : out std_logic_vector(15 downto 0)
	);
end data_path;

architecture Behavioral of data_path is
-- components

	-- 16 Bit Register File
	component register_file
		Port(
			a_select : in std_logic_vector(2 downto 0);	
			b_select : in std_logic_vector(2 downto 0);
			des_select : in std_logic_vector(2 downto 0);
			write, clk 	: in STD_LOGIC;
			TA,TB,TD : in STD_LOGIC;
            data    : in STD_LOGIC_VECTOR(15 downto 0);
			reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8 : out STD_LOGIC_VECTOR(15 downto 0);
            a_reg, b_reg : out STD_LOGIC_VECTOR(15 downto 0)
		);
	end component;
	
	-- 2 to 1 line multiplexer
	component mux_2_16
		Port(
			In0 : in std_logic_vector(15 downto 0);
			In1 : in std_logic_vector(15 downto 0);
			s : in std_logic;
			Z : out std_logic_vector(15 downto 0)
		);
	end component;
	
	-- ALU + Shifter Function Unit
	component function_unit
		Port(
			A : in std_logic_vector(15 downto 0);
			B : in std_logic_vector(15 downto 0);
			FS : in std_logic_vector(4 downto 0);
			V : out std_logic;
			C : out std_logic;
			N : out std_logic;
			Z : out std_logic;	
			F : out std_logic_vector(15 downto 0)
		);
	end component;
	
	-- signals
	signal a_data, b_data, mb_out, f_out, md_out, reg0out, reg1out, reg2out, reg3out, reg4out, 
	           reg5out, reg6out, reg7out, instructionReg_out: std_logic_vector(15 downto 0);
		
	begin
	
	-- Register File
	reg_file: register_file PORT MAP(
	          TA => TA,
	          TB => TB,
	          TD => TD,
              a_select => a_address,
              b_select => b_address,
              des_select => d_address,
              write => write,
              clk => clock,
              data => md_out,
              reg0 => reg0out,
              reg1 => reg1out,
              reg2 => reg2out,
              reg3 => reg3out,
              reg4 => reg4out,
              reg5 => reg5out,
              reg6 => reg6out,
              reg7 => reg7out,
              reg8 => instructionReg_out,
              a_reg => a_data,
              b_reg => b_data
            );
	
	-- MUX B
	mux_b: mux_2_16 Port Map(
		In0 => b_data,
		In1 => constant_in,
		s => mb_select,
		Z => mb_out
	);
	
	-- Function Unit
	funct_unit: function_unit Port Map(
		A => a_data,
		B => mb_out,
		FS => FS,
		V => v_out,
		C => c_out,
		N => n_out,
		Z => z_out,	
		F => f_out
	);
	
	-- MUX D
	mux_d: mux_2_16 Port Map(
		In0 => f_out,
		In1 => data_in,
		s => md_select,
		Z => md_out
	);
	
	bus_a_adr_out <= a_data;
	bus_b_data_out <= mb_out;
	f_data_out <= f_out;
	
	reg_0_data_out <= reg0out;
	reg_1_data_out <= reg1out;
	reg_2_data_out <= reg2out;
	reg_3_data_out <= reg3out;
	reg_4_data_out <= reg4out;
	reg_5_data_out <= reg5out;
	reg_6_data_out <= reg6out;
	reg_7_data_out <= reg7out;
	reg_8_data_out <= instructionReg_out;
	 
end Behavioral;
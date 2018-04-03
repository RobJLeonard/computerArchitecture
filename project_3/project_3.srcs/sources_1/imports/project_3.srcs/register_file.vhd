----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    
-- Design Name: 
-- Module Name:    
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

entity register_file is
	Port(
	        a_select, b_select : in STD_LOGIC_VECTOR(2 downto 0);
			des_select 	: in STD_LOGIC_VECTOR(2 downto 0);
			write, clk	: in STD_LOGIC;
			TA : in STD_LOGIC;
			TB : in STD_LOGIC; 
			TD : in STD_LOGIC;
			data 	: in STD_LOGIC_VECTOR(15 downto 0);
			reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8 : out STD_LOGIC_VECTOR(15 downto 0);
			a_reg, b_reg : out STD_LOGIC_VECTOR(15 downto 0)
			);
end register_file;

architecture Behavioral of register_file is
--register component
	Component reg
		Port(
				load, clk 	: in 	STD_LOGIC;
				D 				: in STD_LOGIC_VECTOR(15 downto 0);
				Q				: out STD_LOGIC_VECTOR(15 downto 0)
				);
	End Component;
--decoder 3 to 8 bit
	Component decoder
		Port(
				a0, a1, a2, aControl : in STD_LOGIC;
				Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8 : out STD_LOGIC 
				);
	End Component;

-- not needed in register file
--mux 2 to 16 bit
--	Component mux_2_16
--		Port(
--				in0, in1 : in STD_LOGIC_VECTOR(15 downto 0);
--				s : in STD_LOGIC;
--				z : out STD_LOGIC_VECTOR(15 downto 0)
--				);
--	End Component;

--mux 8 to 16 bit
	Component mux_8_16
		Port(
				in0, in1, in2, in3, in4, in5, in6, in7, in8 : in STD_LOGIC_VECTOR(15 downto 0);
				s0, s1, s2, sControl : in STD_LOGIC;
				z : out STD_LOGIC_VECTOR(15 downto 0)
				);
	End Component;
	
--inter-component signals
    --register select from decoder
    signal reg0_select, reg1_select, reg2_select, reg3_select, reg4_select, reg5_select, reg6_select, reg7_select, instructionReg_select : STD_LOGIC;
	--load in for each register's load
	signal load_reg0, load_reg1, load_reg2, load_reg3, load_reg4, load_reg5, load_reg6, load_reg7, load_instructionReg : STD_LOGIC;
	--output load for each register
	signal q_reg0, q_reg1, q_reg2, q_reg3, q_reg4, q_reg5, q_reg6, q_reg7, q_instructionReg : STD_LOGIC_VECTOR(15 downto 0);
	signal src_reg : STD_LOGIC_VECTOR(15 downto 0);
	
--port mapping for each individual component within the schema
begin
	reg00 : reg PORT MAP(
			load 	=>		load_reg0,
			clk 	=>		clk,
			D 		=>		data,
			Q 		=>		q_reg0
	);
	
	reg01 : reg PORT MAP(
			load 	=>		load_reg1,
			clk 	=>		clk,
			D		=>		data,
			Q 		=>		q_reg1
	);
	
	reg02 : reg PORT MAP(
			load 	=>		load_reg2,
			clk 	=>		clk,
			D		=>		data,
			Q 		=>		q_reg2
	);

	reg03 : reg PORT MAP(
			load 	=>		load_reg3,
			clk 	=>		clk,
			D		=>		data,
			Q 		=>		q_reg3
	);
	
	
	reg04 : reg PORT MAP(
			load 	=>		load_reg4,
			clk 	=>		clk,
			D		=>		data,
			Q 		=>		q_reg4
	);
	
	reg05 : reg PORT MAP(
			load 	=>		load_reg5,
			clk 	=>		clk,
			D		=>		data,
			Q 		=>		q_reg5
	);
	
	reg06 : reg PORT MAP(
			load 	=>		load_reg6,
			clk 	=>		clk,
			D		=>		data,
			Q 		=>		q_reg6
	);
	
	reg07 : reg PORT MAP(
			load 	=>		load_reg7,
			clk 	=>		clk,
			D		=>		data,
			Q 		=>		q_reg7
	);
	
	instructionReg : reg PORT MAP(
                load    =>        load_instructionReg,
                clk     =>        clk,
                D       =>        data,
                Q       =>        q_instructionReg
        );
	
	des_decoder_3_8 : decoder PORT MAP(
			a0 	=>	des_select(0),
			a1 	=>	des_select(1),
			a2 	=>	des_select(2),
			aControl => TD,
			q0 	=>	reg0_select,
			q1 	=>	reg1_select,
			q2 	=>	reg2_select,
			q3 	=>	reg3_select,
			q4 	=>	reg4_select,
			q5 	=>	reg5_select,
			q6 	=>	reg6_select,
			q7 	=>	reg7_select,
			q8  =>  instructionReg_select
		);
	
	--src_mux_2_16 : mux_2_16 PORT MAP(
	--		in0	=>	data,
	--		in1	=>	src_reg,
	--		s		=>	data_load,
	--		z		=>	data_src_mux_out
	--	);
	
	select_a_mux_8_16 : mux_8_16 PORT MAP(
			in0	=>	q_reg0,
			in1	=>	q_reg1,
			in2	=>	q_reg2,
			in3	=>	q_reg3,
			in4	=>	q_reg4,
			in5	=>	q_reg5,
			in6	=>	q_reg6,
			in7	=>	q_reg7,
			in8 => q_instructionReg,
			s0  =>	a_select(0),
			s1	=>	a_select(1),
			s2	=>	a_select(2),
			sControl => TA,
			z		=>	a_reg
		);
		
		select_b_mux_8_16 : mux_8_16 PORT MAP(
            in0    =>    q_reg0,
            in1    =>    q_reg1,
            in2    =>    q_reg2,
            in3    =>    q_reg3,
            in4    =>    q_reg4,
            in5    =>    q_reg5,
            in6    =>    q_reg6,
            in7    =>    q_reg7,
            in8    =>    q_instructionReg,
            s0    =>    b_select(0),
            s1    =>    b_select(1),
            s2    =>    b_select(2),
            sControl => TB,
            z        =>    b_reg
        );
		
	--register instantiation
	reg0 <= q_reg0;
	reg1 <= q_reg1;
	reg2 <= q_reg2;
	reg3 <= q_reg3;
	reg4 <= q_reg4;
	reg5 <= q_reg5;
	reg6 <= q_reg6;
	reg7 <= q_reg7;
	reg8 <= q_instructionReg;
	
	
	
	
	-- register select AND write
	 load_reg0 <= (reg0_select AND write);
	 load_reg1 <= (reg1_select AND write); 
	 load_reg2 <= (reg2_select AND write);
	 load_reg3 <= (reg3_select AND write); 
	 load_reg4 <= (reg4_select AND write); 
	 load_reg5 <= (reg5_select AND write); 
	 load_reg6 <= (reg6_select AND write); 
	 load_reg7 <= (reg7_select AND write);
	 load_instructionReg <= (instructionReg_select AND write);
	  
	
end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:06:39 05/03/2016 
-- Design Name: 
-- Module Name:    FirstMipsVersion - Behavioral 
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

entity FirstMipsVersion is
    Port ( clk : 		in  STD_LOGIC;
           reset : 	in  STD_LOGIC);
end FirstMipsVersion;

architecture Behavioral of FirstMipsVersion is
Component Branch2
    Port ( Branch1 	: in   STD_LOGIC;
           Z 			: in   STD_LOGIC;
			  Adderout	: in   STD_LOGIC_VECTOR(31 downto 0);
			  SignExt	: in   STD_LOGIC_VECTOR(31 downto 0);
           R 			: out  STD_LOGIC_vector(31 downto 0)
			  );
end Component;
component ALU
port(
ALUC:	in STD_LOGIC_VECTOR(2 downto 0);
A,B:	in STD_LOGIC_VECTOR(31 downto 0);
R:		out STD_LOGIC_VECTOR(31 downto 0);
Z:		out STD_LOGIC
);
end component;

component PCPlus4
port(
	clk,reset: 	in STD_LOGIC;
	SRin		:	in	STD_LOGIC_VECTOR(31 downto 0);
	Q:				out STD_LOGIC_VECTOR(31 downto 0)
);
end component;

component SignExtend
    Port ( 
	 A : 		in  STD_LOGIC_VECTOR(15 downto 0);
	 R : 		out STD_LOGIC_VECTOR(31 downto 0)
	 );
end component;

component programmemory
  port( address:		in std_logic_vector(31 downto 0);
        instruction: out std_logic_vector(31 downto 0)
        );
end component;

component Regfile
   port(
      clk:		 IN std_logic;
      reset:	 IN std_logic;
      A_data:	 OUT std_logic_vector(31 downto 0);
      B_data:	 OUT std_logic_vector(31 downto 0);
      A_addr:	 IN std_logic_vector(4 downto 0);
      B_addr:	 IN std_logic_vector(4 downto 0);
      W_data:	 IN std_logic_vector(31 downto 0);
      W_addr:	 IN std_logic_vector(4 downto 0);
      W_ena:	 IN std_logic
		);
end component;

component MultiplexerIO
    Port ( A : in   STD_LOGIC_vector(4 downto 0);
           B : in   STD_LOGIC_vector(4 downto 0);
			  C : in   STD_LOGIC;
           R : out  STD_LOGIC_vector(4 downto 0)
			  );
end component;

component MUX2
    Port ( A : in   STD_LOGIC_vector(31 downto 0);
           B : in   STD_LOGIC_vector(31 downto 0);
			  C : in   STD_LOGIC;
           R : out  STD_LOGIC_vector(31 downto 0)
			  );
end component;

component Controlunit
    Port ( 
			op 				: in STD_LOGIC_VECTOR(5 downto 0);
			funct 			: in STD_LOGIC_VECTOR(5 downto 0);
			ALUControl		: out STD_LOGIC_VECTOR(2 downto 0);
			ALUSource		: out STD_LOGIC;
			RegDestination	: out STD_LOGIC;
			WE					: out STD_LOGIC;
			MemToReg			: out STD_Logic;
			MemWE				: out STD_LOGIC;
			Branch1			: out STD_LOGIC;
			Jump				: OUT STD_LOGIC
			);
end component;

component dataMemory
   Port (
      clk: 			IN std_logic;
      reset: 		IN std_logic;
		Adress: 		in std_logic_vector(31 downto 0);
      DataIn: 		IN std_logic_vector(31 downto 0);
      DataOut: 	OUT std_logic_vector(31 downto 0);
      MemWE: 		IN std_logic
		);
end component;

component Adder
port ( 
		A,B	:in	 STD_LOGIC_VECTOR(31 downto 0);
		Cin	:in 	 STD_LOGIC;
		R		:out	 STD_LOGIC_VECTOR(31 downto 0)
		);
end component;

Component SignExtend2
	Port ( A : 		in  STD_LOGIC_vector(25 downto 0);
           R : 	out  STD_LOGIC_vector(27 downto 0)
			  );
end component;
Signal PC_out, IM_out, RD1, RD2, WD, SE_out, RD2F, DMout, ALUout, JumptoMux,Fyra,Adderout,sSRin,Branchout: STD_LOGIC_VECTOR(31 downto 0);
Signal Ext2out:																	STD_LOGIC_VECTOR(27 downto 0);
signal A3:																			STD_LOGIC_VECTOR(4 downto 0);
signal ALUCTRL:			 														STD_LOGIC_VECTOR(2 downto 0);
signal RD,WE,AS,ZZ, MWE, MTR, Brnch,Jump:											STD_LOGIC;
begin
PC : PCPlus4 port map(SRin=>sSRin,clk=>clk, reset=>reset,Q=>PC_out);

IM 			: programmemory 		port map(address=>PC_out, instruction=>IM_out);

CU 			: Controlunit 			port map(op=>IM_out(31 downto 26), funct=>IM_out(5 downto 0), ALUControl=>ALUCTRL, RegDestination => RD, ALUSource => AS, WE=>WE, MemToReg=>MTR, MemWE=> MWE,Branch1=>Brnch,Jump=>Jump);

MUX1			: MultiplexerIO 		port map(A=>IM_out(20 downto 16), B=> IM_out(15 downto 11), C=>RD, R=>A3);

RegF1			: Regfile 				port map(clk=>clk, reset=>reset, A_addr=>IM_out(25 downto 21), B_addr=>IM_out(20 downto 16), W_addr=>A3, W_ena=>WE, A_data=>RD1, B_data=>RD2, W_data=>WD);

SE  			: SignExtend 			port map(A=>IM_out(15 downto 0), R=>SE_out);

MUXX2 		: MUX2 					port map(A=>RD2, B=>SE_out, C=>AS, R=>RD2F);

ALU1 			: ALU 					port map(A=>RD1, B=>RD2F, ALUC=>ALUCTRL, R=>ALUout, Z=>ZZ);

dataMem 		: dataMemory 			port map(clk=>clk, reset=>reset, Adress=>ALUout, DataIn=>RD2, DataOut=>DMout, memWE=>MWE);

MemToRegMux : MUX2 					port map(A=>ALUout, B=>DMout, C=>MTR, R=>WD);

Ext2			: SignExtend2			port map(A=>IM_out(25 downto 0),R=>Ext2out);

Fyra<="00000000000000000000000000000100";

NAdder		: Adder					port map(A=>PC_out,Cin=>'0', B=>Fyra, R=>Adderout);

JumpToMux<=(Adderout(31 downto 28)& Ext2out);

JumpMux		: MUX2 					port map(B=>JumpToMux, A=>Branchout, C=>Jump, R=>sSRin);

BEQ			: Branch2					port map(Branch1=>Brnch,Adderout=>Adderout,Z=>ZZ,SignExt=>SE_out,R=>Branchout);







end Behavioral;	


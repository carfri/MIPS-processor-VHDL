library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
port(
A,B:in STD_LOGIC_VECTOR(31 downto 0);
ALUC:in STD_LOGIC_VECTOR(2 downto 0);
R:out STD_LOGIC_VECTOR(31 downto 0);
Z:out STD_LOGIC
);
end ALU;

architecture Behavioral of ALU is
component AndModule
port (A,B :in STD_LOGIC_VECTOR(31 downto 0);
R:out STD_LOGIC_VECTOR(31 downto 0)
 );
end component;
component OrModule
port ( A,B :in STD_LOGIC_VECTOR(31 downto 0);
R:out STD_LOGIC_VECTOR(31 downto 0)
 );
end component;
component ARITH
port(
		A,B	: in	STD_LOGIC_VECTOR(31 downto 0);
		ALUC2	: in	STD_LOGIC;
		V		: out	STD_LOGIC;
		R		: out STD_LOGIC_VECTOR(31 downto 0)
 );
end component;
component Module000
port (
		A	:in	STD_LOGIC_VECTOR(31 downto 0);
		R	:out	STD_LOGIC_VECTOR(31 downto 0)
 );
end component;
component multiplexer
port(
	A,B,C,D 		:in STD_LOGIC_VECTOR(31 downto 0);
	ALUC1:in STD_LOGIC;
	ALUC0:in STD_LOGIC;
	R				:out STD_LOGIC_VECTOR(31 downto 0)
	);
end component;
component zeroflg
Port ( A : in  STD_LOGIC_VECTOR(31 downto 0);
       Z : out  STD_LOGIC
		 );
end component;

signal s1,s2,s3,s4,s5:STD_LOGIC_VECTOR(31 downto 0);
begin
AndMod	:	AndModule	port map(A=>A,B=>B,R=>s1);
OrMod		:  OrModule		port map(A=>A,B=>B,R=>s2);
ARTITH1	: 	ARITH 		port map(A=>A,B=>B,ALUC2=>ALUC(2),R=>s3);
Mod000	:	Module000 	port map(A=>s3,R=>s4);
MUX		:	multiplexer	port map(A=>s1,B=>s2,C=>s3,D=>s4,ALUC1=>ALUC(1),ALUC0=>ALUC(0),R=>s5);
Zero		:	zeroflg		port map(A=>s5,Z=>Z);
R<=s5; 
end Behavioral;


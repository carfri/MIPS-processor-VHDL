library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mips is
    Port ( clk		: in  STD_LOGIC;
           reset	: in  STD_LOGIC;
           Q	 	: out  STD_LOGIC_VECTOR(31 downto 0)
			  );
end Mips;

architecture Behavioral of Mips is
component Adder
port ( 
		A,B	:in	 STD_LOGIC_VECTOR(31 downto 0);
		Cin  :in    STD_LOGIC;
		R		:out	 STD_LOGIC_VECTOR(31 downto 0)
		);
end component;
component MyRegister
port (
	D				:in STD_LOGIC_VECTOR(31 downto 0);
	clk,reset	:in STD_LOGIC;
	R				:out STD_LOGIC_VECTOR(31 downto 0))
;
end component;
signal B4,D_State_Temp, Q_State_Temp:STD_LOGIC_VECTOR(31 downto 0);		
begin
Adder1: Adder port map(A=>Q_State_Temp,B=>b4,Cin=>'0', R=>D_State_temp);

Reg  : MyREGISTER port map(clk=>clk,reset=>reset,D=>D_state_temp,R=>Q_State_Temp);
Q<=Q_State_Temp;
end Behavioral;


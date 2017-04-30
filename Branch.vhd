----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:51:24 05/23/2016 
-- Design Name: 
-- Module Name:    Branch - Behavioral 
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

entity Branch2 is
    Port ( Branch1 	: in   STD_LOGIC;
           Z 			: in   STD_LOGIC;
			  Adderout	: in   STD_LOGIC_VECTOR(31 downto 0);
			  SignExt	: in   STD_LOGIC_VECTOR(31 downto 0);
           R 			: out  STD_LOGIC_vector(31 downto 0)
			  );
end Branch2;

architecture Behavioral of Branch2 is
Signal SLLout,ADDout,BranchOut: STD_LOGIC_VECTOR(31 downto 0);
Signal MUXSIGNAL :				  STD_LOGIC;
component Adder
port ( 
		A,B	:in	 STD_LOGIC_VECTOR(31 downto 0);
		Cin	:in	 STD_LOGIC;
		R		:out	 STD_LOGIC_VECTOR(31 downto 0)
		);
end component;
component MUX2
    Port ( A : in   STD_LOGIC_vector(31 downto 0);
           B : in   STD_LOGIC_vector(31 downto 0);
			  C : in   STD_LOGIC;
           R : out  STD_LOGIC_vector(31 downto 0)
			  );
end component;

begin
SLLout<=SignExt(29 downto 0)&"00";

Adder1: Adder port map(A=>SLLout,Cin=>'0',B=>Adderout,R=>ADDout);

MUXSIGNAL<=Z and Branch1;

BranchMux: MUX2 port map(A=>Adderout,B=>ADDout,C=>MUXSIGNAL,R=>BranchOut);

R<=BranchOut;

end Behavioral;


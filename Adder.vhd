----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:14:40 04/26/2016 
-- Design Name: 
-- Module Name:    Adder - Behavioral 
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

entity Adder is
port( A,B:in STD_LOGIC_VECTOR(31 downto 0);
		Cin:in STD_LOGIC;
		R:out STD_LOGIC_VECTOR(31 downto 0);
		V,C:out STD_LOGIC);
end Adder;

architecture Behavioral of Adder is
component OnebitFullAdder
port(
A,B,Cin: in STD_LOGIC;
R,Cout:out STD_LOGIC);
end component;
signal CVECTOR: STD_LOGIC_VECTOR(32 downto 0);
signal Result : STD_LOGIC_VECTOR(31 downto 0);
begin
CVECTOR(0)<=Cin;
adders: for i in 0 to 31 generate
	adder_instance: OnebitFullAdder port map(A=>A(i),B=>B(i),Cin=>CVECTOR(i),R=>Result(i),Cout=>CVECTOR(i+1));
end generate;
V<=CVECTOR(31) xor CVECTOR(32); 
C<=CVECTOR(32);
R <= Result;
end Behavioral;


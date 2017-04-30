----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:31:05 04/20/2016 
-- Design Name: 
-- Module Name:    ARITH - Behavioral 
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

entity ARITH is
port (
A,B :in STD_LOGIC_VECTOR(31 downto 0);
ALUC2 :in STD_LOGIC;
R:out STD_LOGIC_VECTOR(31 downto 0);
V,C: out STD_LOGIC);
end ARITH;

architecture Behavioral of ARITH is
component ADDER
port (
A,B  		 :in STD_LOGIC_VECTOR(31 downto 0);
Cin		 :in STD_LOGIC;
R			 :out STD_LOGIC_VECTOR(31 downto 0);
C,V		 :out STD_LOGIC);
end component;
signal B2:STD_LOGIC_VECTOR(31 downto 0);
begin
badders:for i in 0 to 31 generate
 B2(i)<=ALUC2 xor B(i);
end generate;
SUBTRACTOR: ADDER port map( A=>A, B=>B2, Cin=>ALUC2, V=>V, C=>C, R=>R);



end Behavioral;


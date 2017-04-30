----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:09:20 05/03/2016 
-- Design Name: 
-- Module Name:    SignExtend - Behavioral 
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

entity SignExtend is
    Port ( 
	 A : in  STD_LOGIC_VECTOR(15 downto 0);
	 R : out STD_LOGIC_VECTOR(31 downto 0)
	 );
end SignExtend;

architecture Behavioral of SignExtend is
signal extend : STD_LOGIC_VECTOR(15 downto 0);

begin
forloop:for i in 0 to 15 generate
R(i)<=A(i);
end generate;
forloop1:for i in 16 to 31 generate
R(i)<=A(15);
end generate;
end Behavioral;

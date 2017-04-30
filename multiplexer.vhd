----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:51:04 04/26/2016 
-- Design Name: 
-- Module Name:    multiplexer - Behavioral 
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

entity multiplexer is
port (
A, B, C, D : in STD_LOGIC_VECTOR(31 downto 0);
ALUC1, ALUC0 : in STD_LOGIC;
R : out STD_LOGIC_VECTOR(31 downto 0));
end multiplexer;

architecture Behavioral of multiplexer is
signal ALUC : STD_LOGIC_VECTOR(1 downto 0);


begin
ALUC <= (ALUC1,ALUC0);



R<=A when (Aluc1='0' and ALUC0='0')else
	B when (Aluc1='0' and ALUC0='1')else
	C when (Aluc1='1' and ALUC0='0')else
	D;

end Behavioral;


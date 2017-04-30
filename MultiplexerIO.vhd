----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:23:32 05/03/2016 
-- Design Name: 
-- Module Name:    MultiplexerIO - Behavioral 
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

entity MultiplexerIO is
    Port ( A : in   STD_LOGIC_vector(4 downto 0);
           B : in   STD_LOGIC_vector(4 downto 0);
			  C : in   STD_LOGIC;
           R : out  STD_LOGIC_vector(4 downto 0));
end MultiplexerIO;

architecture Behavioral of MultiplexerIO is

begin
R <= B when (C='1') else A;

end Behavioral;


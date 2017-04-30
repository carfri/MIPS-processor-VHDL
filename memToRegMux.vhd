----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:41:19 05/23/2016 
-- Design Name: 
-- Module Name:    memToRegMux - Behavioral 
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

entity memToRegMux is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
			  C : in  STD_LOGIC;
           R : out  STD_LOGIC);
end memToRegMux;

architecture Behavioral of memToRegMux is

begin
R <= B when (C='1') else A;

end Behavioral;


----------------------------------------------------------------------------------
-- Company: 	Carl Frisenstam HB
-- Engineer:	Carl Frisenstam
-- 
-- Create Date:    16:54:13 05/23/2016 
-- Design Name: 
-- Module Name:    SignExtend2 - Behavioral 
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

entity SignExtend2 is
    Port ( A : in  STD_LOGIC_vector(25 downto 0);
           R : out  STD_LOGIC_vector(27 downto 0));
end entity;

architecture Behavioral of SignExtend2 is
Signal temp: STD_LOGIC_VECTOR(27 downto 0);
begin
temp<=A&"00";
R<=temp;


end Behavioral;


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:00:22 05/24/2016 
-- Design Name: 
-- Module Name:    zeroflg - Behavioral 
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

entity zeroflg is
    Port ( A : in  STD_LOGIC_vector (31 downto 0);
           Z : out  STD_LOGIC);
end zeroflg;

architecture Behavioral of zeroflg is
begin
Z<= '1' when A = "00000000000000000000000000000000" else '0';



end Behavioral;


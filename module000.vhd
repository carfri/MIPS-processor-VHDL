----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:11:52 04/26/2016 
-- Design Name: 
-- Module Name:    module000 - Behavioral 
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

entity module000 is
port (
A	:in	STD_LOGIC_VECTOR(31 downto 0);
R	:out STD_LOGIC_VECTOR(31 downto 0));
end entity;

architecture Behavioral of module000 is
begin
forloop:for i in 1 to 31 generate
R(i)<='0';
end generate;
R(0)<=A(31);
end Behavioral;


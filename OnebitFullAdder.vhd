----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:43:44 04/19/2016 
-- Design Name: 
-- Module Name:    OnebitFullAdder - Behavioral 
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

entity OnebitFullAdder is
port(
A,B,Cin: in STD_LOGIC;
R,Cout:out STD_LOGIC);
end OnebitFullAdder;

architecture Behavioral of OnebitFullAdder is
signal s_1,s_2,s_3:STD_LOGIC;


begin
s_1<=(A xor B);
s_2<=(s_1 and Cin);
s_3<=(A and B);
R<=(Cin xor s_1);
Cout<=(s_2 xor s_3);
end Behavioral;


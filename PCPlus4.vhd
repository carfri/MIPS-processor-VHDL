----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:06:03 04/29/2016 
-- Design Name: 
-- Module Name:    PCPlus4 - Behavioral 
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

entity PCPlus4 is
port(
	clk,reset: 	in STD_LOGIC;
	SRin		:	in STD_LOGIC_VECTOR(31 downto 0);
	Q 			:	out STD_LOGIC_VECTOR(31 downto 0)
);
end PCPlus4;

architecture Behavioral of PCPlus4 is
component MyREGISTER
port ( 
		D		:in	 STD_LOGIC_VECTOR(31 downto 0);
		Clk   :in    STD_LOGIC;
		reset :in    STD_LOGIC;
		Q		:out	 STD_LOGIC_VECTOR(31 downto 0)
		);
end component;


signal b4,D_State_Temp, Q_State_Temp:STD_LOGIC_VECTOR(31 downto 0);
Begin
reg	: MyREGISTER port map(D=>SRin, Clk=>Clk, reset=>reset, Q=>Q_State_Temp);
Q<=Q_State_Temp;

end Behavioral;


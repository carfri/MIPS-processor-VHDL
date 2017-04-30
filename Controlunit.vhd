----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:21:08 05/03/2016 
-- Design Name: 
-- Module Name:    Controlunit - Behavioral 
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

entity Controlunit is
    Port ( 
			op 				: in STD_LOGIC_VECTOR(5 downto 0);
			funct 			: in STD_LOGIC_VECTOR(5 downto 0);
			ALUControl		: out STD_LOGIC_VECTOR(2 downto 0);
			ALUSource		: out STD_LOGIC;
			RegDestination	: out STD_LOGIC;
			WE					: out STD_LOGIC;
			MemToReg			: out STD_LOGIC;
			MemWE				: out STD_LOGIC;
			Branch1			: out STD_LOGIC;
			Jump				: out	STD_LOGIC 
			);
end Controlunit;

architecture Behavioral of Controlunit is
signal nonsense :STD_LOGIC;


begin

process(op,funct)
begin
	if (op="000000")then
		case funct is 
			when 	"100000" =>  --add
										MemToReg			<='0';
										MemWE				<='0';
										ALUControl	 	<="010";
										ALUSource		<='0';
										Jump				<='0';
										RegDestination	<='1';
										WE					<='1';
										Branch1			<='0';
			when 	"100010" =>  --sub
										MemToReg			<='0';
										MemWE				<='0';
										ALUControl	 	<="110";
										ALUSource		<='0';
										RegDestination	<='1';
										Jump				<='0';
										Branch1			<='0';
										WE					<='1';
			when 	"101010" =>  --slt
										MemToReg			<='0';
										MemWE				<='0';
										ALUControl	 	<="111";
										ALUSource		<='0';
										RegDestination	<='1';
										Jump				<='0';
										Branch1			<='0';
										WE					<='1';
			when 	"100101" =>  --or
										MemToReg			<='0';
										MemWE				<='0';
										ALUControl	 	<="001";
										ALUSource		<='0';
										Jump				<='0';
										Branch1			<='0';
										RegDestination	<='1';
										WE					<='1';
			when 	"100100" =>  --and
										MemToReg			<='0';
										MemWE				<='0';
										ALUControl	 	<="000";
										ALUSource		<='0';
										Jump				<='0';
										RegDestination	<='1';
										Branch1			<='0';
										WE					<='1';
			when others		=>		
										nonsense 		<='1';
		end case;
	Else
		case op is
			when "001000" 	=>  --addi
										MemToReg			<='0';
										MemWE				<='0';
										ALUControl	 	<="010";
										ALUSource		<='1';
										RegDestination	<='0';
										Jump				<='0';
										Branch1			<='0';
										WE					<='1';
			when "001010" 	=>  --slti
										MemToReg			<='0';
										MemWE				<='0';
										ALUControl	 	<="111";
										ALUSource		<='1';
										RegDestination	<='0';
										Jump				<='0';
										Branch1			<='0';
										WE					<='1';
			when "100011"	=>	 --lw
										MemToReg			<='1';
										MemWE				<='0';
										ALUControl		<="010";
										WE					<='1';
										RegDestination	<='0';
										Jump				<='0';
										Branch1			<='0';
										ALUSource		<='1';
			when "101011"	=>	 --sw
										MemWE				<='1';
										ALUControl		<="010";
										WE					<='0';
										Jump				<='0';
										Branch1			<='0';
										ALUSource		<='1';
			when "000100"	=>	 --beq
										MemWE				<='0';
										ALUControl		<="110";
										WE					<='0';
										ALUSource		<='0';
										Jump				<='0';
										Branch1			<='1';
			when "000010"	=>	 --J
										MemToReg			<='0';
										MemWE				<='0';
										ALUControl		<="110";
										WE					<='0';
										RegDestination	<='0';
										ALUSource		<='0';
										Jump				<='1';
										Branch1			<='0';
			when others		=>		
										nonsense 		<='1';
		end case;
	end if;
end process;								
end Behavioral;


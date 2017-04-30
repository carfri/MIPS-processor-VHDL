
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity dataMemory is
   port(
      clk: IN std_logic;
      reset: IN std_logic;
		Adress: in std_logic_vector(31 downto 0);
      DataIn: IN std_logic_vector(31 downto 0);
      DataOut: OUT std_logic_vector(31 downto 0);
      MemWE: IN std_logic);
end dataMemory;

architecture behav of dataMemory is
type registerfile_type is array(31 downto 0) of std_logic_vector(31 downto 0);
signal MyMemmoryfile:registerfile_type;
begin
       
   -- Register file
   --Write into a register at rising clock edge and when enable (W_en) is high.
	process(clk,reset)
   begin
         if reset = '1' then
				MyMemmoryfile <= (others => (others => '0'));
         elsif clk'event and clk='1' then
				if MemWE='1' then
                MyMemmoryfile(conv_integer(Adress))<=DataIn;
				end if;
			elsif Adress<=31 and Adress>=0 then
				DataOut<=MyMemmoryfile(conv_integer(Adress));
			end if;
		end process;
end behav;


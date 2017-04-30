library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MyREGISTER is
Port(
clk,reset: in std_logic;
D :in STD_LOGIC_VECTOR(31 downto 0);
Q :out std_logic_vector(31 downto 0)
);
end MyREGISTER;


architecture Behavioral of MyREGISTER is

Begin
Process(clk,reset)
Begin
if reset='1' then
Q<="00000000000000000000000000000000";
elsif clk'event and clk='1' then
Q<=D;
End if;
End Process;
end Behavioral;
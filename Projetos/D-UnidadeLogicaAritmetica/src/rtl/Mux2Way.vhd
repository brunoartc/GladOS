library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux2Way is
	port (
			a:   in  STD_LOGIC_VECTOR(15 DOWNTO 0);
			b:   in  STD_LOGIC_VECTOR(15 DOWNTO 0);
			sel: in  STD_LOGIC;
			q:   out STD_LOGIC_VECTOR(15 DOWNTO 0)
			);
end entity;
architecture func of Mux2Way is
begin
	q <= a when (sel = '0') else
			 b when (sel = '1');
end func;
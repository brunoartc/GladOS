library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DMux4Way is
	port (
			a:   in  STD_LOGIC;
			sel: in  STD_LOGIC_VECTOR(1 downto 0);
			q0:  out STD_LOGIC;
			q1:  out STD_LOGIC;
			q2:  out STD_LOGIC;
			q3:  out STD_LOGIC);
end entity;

architecture func of DMux4Way is

begin
	q0 <= a and not sel(0) and not sel(1);
	q1 <= a and not sel(1) and sel(0);
	q2 <= a and sel(1) and not sel(0);
	q3 <= a and sel(0) and sel(1);
end func;

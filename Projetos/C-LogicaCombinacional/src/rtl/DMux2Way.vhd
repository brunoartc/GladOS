library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DMux2Way is
	port (
			a:   in  STD_LOGIC;
			sel: in  STD_LOGIC;
			q0:  out STD_LOGIC;
			q1:  out STD_LOGIC);
<<<<<<< HEAD
end entity;
architecture func of DMux2Way is
signal aa : STD_LOGIC;
begin
		aa <= not sel;
		q0 <= aa and a;
		q1 <= sel and a;
end func;
=======
end entity
>>>>>>> f73964f29ff59ca081f6e546f6d855cd73e9f6da

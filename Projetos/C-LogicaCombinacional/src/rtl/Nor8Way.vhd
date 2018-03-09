library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Nor8Way is
	port ( 
			a:   in  STD_LOGIC;
			b:   in  STD_LOGIC;
			c:   in  STD_LOGIC;
			d:   in  STD_LOGIC;
			e:   in  STD_LOGIC;
			f:   in  STD_LOGIC;
			g:   in  STD_LOGIC;
			h:   in  STD_LOGIC;
			q:   out STD_LOGIC);
end entity;
	
architecture rtl of Nor8Way is 
  begin
    F<=a nor b nor c nor d nor d nor e nor f nor g nor h;
    result <= F
  end rtl; 

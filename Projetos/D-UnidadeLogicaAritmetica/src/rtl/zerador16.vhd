-- Elementos de Sistemas
-- by Luciano Soares
-- zerador16.vhd

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity zerador16 is
   port(z   : in STD_LOGIC;
	     a   : in STD_LOGIC_VECTOR(15 downto 0);
        y   : out STD_LOGIC_VECTOR(15 downto 0)
   );
end zerador16;

architecture rtl of zerador16 is


begin

y(0) <= A(0) and not z;
y(1) <= A(1) and not z;
y(2) <= A(2) and not z;
y(3) <= A(3) and not z;
y(4) <= A(4) and not z;
y(5) <= A(5) and not z;
y(6) <= A(6) and not z;
y(7) <= A(7) and not z;
y(8) <= A(8) and not z;
y(9) <= A(9) and not z;
y(10) <= A(10) and not z;
y(11) <= A(11) and not z;
y(12) <= A(12) and not z;
y(13) <= A(13) and not z;
y(14) <= A(14) and not z;
y(15) <= A(15) and not z;
   
end architecture;

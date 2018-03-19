-- Elementos de Sistemas
-- by Luciano Soares
-- Add16.vhd

-- Soma dois valores de 16 bits
-- ignorando o carry mais significativo

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Add16 is
	port(
		a   :  in STD_LOGIC_VECTOR(15 downto 0);
		b   :  in STD_LOGIC_VECTOR(15 downto 0);
		q   : out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;
architecture rtl of Add16 is
signal tmp : STD_LOGIC_VECTOR(15 downto 0);
component FullAdder is
	port(
		a,b,c:      in STD_LOGIC;   -- entradas
		soma,vaium: out STD_LOGIC   -- sum e carry
	);
end component;

begin
	um : FullAdder port map (a(0), b(0), '0', q(0),tmp(0));
	dois : FullAdder port map (a(1), b(1), tmp(0), q(1), tmp(1));
	tres : FullAdder port map (a(2), b(2), tmp(1), q(2), tmp(2));
	quatro: FullAdder port map (a(3), b(3), tmp(2),q(3), tmp(3));
	cinco : FullAdder port map (a(4), b(4), tmp(3), q(4), tmp(4));
	seis : FullAdder port map (a(5), b(5), tmp(4), q(5), tmp(5));
	sete : FullAdder port map (a(6), b(6), tmp(5), q(6), tmp(6));
	oito : FullAdder port map (a(7), b(7), tmp(6), q(7), tmp(7));
	nove : FullAdder port map (a(8),b(8), tmp(7), q(8), tmp(8));
	dezum : FullAdder port map (a(9), b(9), tmp(8), q(9), tmp(9));
	ddois : FullAdder port map (a(10), b(10), tmp(9), q(10), tmp(10));
	dtres : FullAdder port map (a(11), b(11), tmp(10), q(11), tmp(11));
	dquatro : FullAdder port map (a(12), b(12), tmp(11), q(12), tmp(12));
	dcinco : FullAdder port map (a(13), b(13), tmp(12), q(13), tmp(13));
	dseis : FullAdder port map (a(14), b(14), tmp(13), q(14), tmp(14));
	final : FullAdder port map (a(15), b(15), tmp(14), q(15), tmp(15));
end architecture;

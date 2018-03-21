-- Elementos de Sistemas
-- by Luciano Soares
-- Inc16.vhd

-- Incrementador de 16 bits
-- adiciona 1 ao valore de entrada (adição aritmética)

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Inc16 is
	port(
		a   :  in STD_LOGIC_VECTOR(15 downto 0);
		q   : out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

architecture rtl of Inc16 is

signal tmp : STD_LOGIC_VECTOR(15 downto 0);

component HalfAdder
	port(
		a,b:        in STD_LOGIC;   -- entradas
		soma,vaium: out STD_LOGIC   -- sum e carry
	);
end component;

begin
	um : HalfAdder port map (a(0), '1', q(0),tmp(0));
	dois : HalfAdder port map (a(1), tmp(0), q(1), tmp(1));
	tres : HalfAdder port map (a(2), tmp(1), q(2), tmp(2));
	quatro: HalfAdder port map (a(3), tmp(2),q(3), tmp(3));
	cinco : HalfAdder port map (a(4), tmp(3), q(4), tmp(4));
	seis : HalfAdder port map (a(5), tmp(4), q(5), tmp(5));
	sete : HalfAdder port map (a(6), tmp(5), q(6), tmp(6));
	oito : HalfAdder port map (a(7), tmp(6), q(7), tmp(7));
	nove : HalfAdder port map (a(8), tmp(7), q(8), tmp(8));
	dez : HalfAdder port map (a(9), tmp(8), q(9), tmp(9));
	onze : HalfAdder port map (a(10), tmp(9), q(10), tmp(10));
	doze : HalfAdder port map (a(11), tmp(10), q(11), tmp(11));
	treze : HalfAdder port map (a(12), tmp(11), q(12), tmp(12));
	catorze : HalfAdder port map (a(13), tmp(12), q(13), tmp(13));
	quinze : HalfAdder port map (a(14), tmp(13), q(14), tmp(14));
	final : HalfAdder port map (a(15), tmp(14), q(15), tmp(15));
end architecture;
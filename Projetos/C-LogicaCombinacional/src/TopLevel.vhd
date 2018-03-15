--
-- Elementos de Sistemas - Aula 5 - Logica Combinacional
-- Rafael . Corsi @ insper . edu . br
--
-- Arquivo exemplo para acionar os LEDs e ler os bottoes
-- da placa DE0-CV utilizada no curso de elementos de
-- sistemas do 3s da eng. da computacao

----------------------------
-- Bibliotecas ieee       --
----------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

----------------------------
-- Entrada e saidas do bloco
----------------------------
entity TopLevel is
	port(
		A     : in  std_logic;
		B     : in std_logic;
		C     : in std_logic;
		Q     : out std_logic
	);
end entity;

----------------------------
-- Implementacao do bloco --
----------------------------
architecture rtl of TopLevel is

--------------
-- signals
--------------
signal sand : std_logic:='0';
signal sandand : std_logic:='0';
---------------
-- implementacao
---------------

component nand_z01
   port(
          a : in  std_logic;
	        b : in  std_logic;
	        q : out std_logic
   );
end component;

component Or8Way
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
end component;

component And16 is
	port (
			a:   in  STD_LOGIC_VECTOR(15 downto 0);
			b:   in  STD_LOGIC_VECTOR(15 downto 0);
			q:   out STD_LOGIC_VECTOR(15 downto 0));
end component;


begin
	NaN: nand_z01 port map(
	A=>a,
	A=>b,
	q=>sand);

	Ou: Or8Way port map (
	sand=>a,
	C=>b,
	c=>'0',
	d=>'0',
	e=>'0',
	f=>'0',
	g=>'0',
	h=>'0',
	q=>sandand);

	atchin: And16 port map (
	sandand=>a,
	B=>b,
	q=>Q);
	--LEDR(8) <= ((NaN a) Ou C) atchin b;
	--B(Ä+C)
	--ä(b+c)
end rtl;

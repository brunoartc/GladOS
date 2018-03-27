-- Elementos de Sistemas
-- by Luciano Soares
-- Ram64.vhd

Library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;

entity Ram64 is
	port(
		clock:   in  STD_LOGIC;
		input:   in  STD_LOGIC_VECTOR(15 downto 0);
		load:    in  STD_LOGIC;
		address: in  STD_LOGIC_VECTOR( 5 downto 0);
		output:  out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;
architecture func of Ram64 is

  component Register16 is
  	port(
  		clock:   in STD_LOGIC;
  		input:   in STD_LOGIC_VECTOR(15 downto 0);
  		load:    in STD_LOGIC;
  		output: out STD_LOGIC_VECTOR(15 downto 0)
  	);
  end component;

  component Ram8 is
    port(
  		clock:   in  STD_LOGIC;
  		input:   in  STD_LOGIC_VECTOR(15 downto 0);
  		load:    in  STD_LOGIC;
  		address: in  STD_LOGIC_VECTOR( 2 downto 0);
  		output:  out STD_LOGIC_VECTOR(15 downto 0)
  	);
  end component;


  component Mux8Way16 is
    port (
  			a:   in  STD_LOGIC_VECTOR(15 downto 0);
  			b:   in  STD_LOGIC_VECTOR(15 downto 0);
  			c:   in  STD_LOGIC_VECTOR(15 downto 0);
  			d:   in  STD_LOGIC_VECTOR(15 downto 0);
  			e:   in  STD_LOGIC_VECTOR(15 downto 0);
  			f:   in  STD_LOGIC_VECTOR(15 downto 0);
  			g:   in  STD_LOGIC_VECTOR(15 downto 0);
  			h:   in  STD_LOGIC_VECTOR(15 downto 0);
  			sel: in  STD_LOGIC_VECTOR(2 downto 0);
  			q:   out STD_LOGIC_VECTOR(15 downto 0));
  end component;

  type memo is array (7 downto 0) of STD_LOGIC_VECTOR(15 downto 0);
  type memo64 is array (63 downto 0) of STD_LOGIC_VECTOR(15 downto 0);
  SIGNAL rram : memo;
  SIGNAL pipe : memo64;
  begin
    P0: Ram8 port map (clock,input,load,address(2 downto 0),pipe(0));
    P1: Ram8 port map (clock,input,load,address( 2 downto 0 ),pipe(1));
    P2: Ram8 port map (clock,input,load,address( 2 downto 0 ),pipe(2));
    P3: Ram8 port map (clock,input,load,address( 2 downto 0 ),pipe(3));
    p4: Ram8 port map (clock,input,load,address( 2 downto 0 ),pipe(4));
    p5: Ram8 port map (clock,input,load,address( 2 downto 0 ),pipe(5));
    p6: Ram8 port map (clock,input,load,address( 2 downto 0 ),pipe(6));
    p7: Ram8 port map (clock,input,load,address( 2 downto 0 ),pipe(7));
    P8: Mux8Way16 port map (pipe(0),pipe(1),pipe(2),pipe(3),pipe(4),pipe(5),pipe(6),pipe(7),address(5 downto 3),output);

    --P0: Register16 port map(clock,input,load,saida);
    --ramm(to_integer(unsigned(address))) <= saida when (load = '0');
    --output <= saida when (load = '1');
		--deveria funcionar mas nao sei


end func;

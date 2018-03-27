-- Elementos de Sistemas
-- by Luciano Soares
-- Ram4K.vhd

Library ieee; 
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;
  
entity Ram4K is
	port(
		clock:   in  STD_LOGIC;
		input:   in  STD_LOGIC_VECTOR(15 downto 0);
		load:    in  STD_LOGIC;
		address: in  STD_LOGIC_VECTOR(11 downto 0);
		output:  out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

architecture func of Ram4k is

	  component Ram512 is
			port(
				clock:   in  STD_LOGIC;
				input:   in  STD_LOGIC_VECTOR(15 downto 0);
				load:    in  STD_LOGIC;
				address: in  STD_LOGIC_VECTOR( 8 downto 0);
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
	  type memo64 is array (63 downto 0) of STD_LOGIC_VECTOR(15 downto 0);
	  SIGNAL pipe : memo64;
	  begin
	    P0: Ram512 port map (clock,input,load,address( 8 downto 0),pipe(0));
	    P1: Ram512 port map (clock,input,load,address( 8 downto 0 ),pipe(1));
	    P2: Ram512 port map (clock,input,load,address( 8 downto 0 ),pipe(2));
	    P3: Ram512 port map (clock,input,load,address( 8 downto 0 ),pipe(3));
	    p4: Ram512 port map (clock,input,load,address( 8 downto 0 ),pipe(4));
	    p5: Ram512 port map (clock,input,load,address( 8 downto 0 ),pipe(5));
	    p6: Ram512 port map (clock,input,load,address( 8 downto 0 ),pipe(6));
	    p7: Ram512 port map (clock,input,load,address( 8 downto 0 ),pipe(7));
	    P8: Mux8Way16 port map (pipe(0),pipe(1),pipe(2),pipe(3),pipe(4),pipe(5),pipe(6),pipe(7),address(11 downto 9),output);

	    --P0: Register16 port map(clock,input,load,saida);
	    --ramm(to_integer(unsigned(address))) <= saida when (load = '0');
	    --output <= saida when (load = '1');
			--deveria funcionar mas nao sei


	end func;

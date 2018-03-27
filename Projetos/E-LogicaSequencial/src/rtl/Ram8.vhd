-- Elementos de Sistemas
-- by Luciano Soares
-- Ram8.vhd

Library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;

entity Ram8 is
	port(
		clock:   in  STD_LOGIC;
		input:   in  STD_LOGIC_VECTOR(15 downto 0);
		load:    in  STD_LOGIC;
		address: in  STD_LOGIC_VECTOR( 2 downto 0);
		output:  out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;


architecture func of Ram8 is
  component Register16 is
  	port(
  		clock:   in STD_LOGIC;
  		input:   in STD_LOGIC_VECTOR(15 downto 0);
  		load:    in STD_LOGIC;
  		output: out STD_LOGIC_VECTOR(15 downto 0)
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
  q: out STD_LOGIC_VECTOR(15 downto 0));
  end component;

  component DMux8Way is
    port (
  			a:   in  STD_LOGIC;
  			sel: in  STD_LOGIC_VECTOR(2 downto 0);
  			q0:  out STD_LOGIC;
  			q1:  out STD_LOGIC;
  			q2:  out STD_LOGIC;
  			q3:  out STD_LOGIC;
  			q4:  out STD_LOGIC;
  			q5:  out STD_LOGIC;
  			q6:  out STD_LOGIC;
  q7: out STD_LOGIC);
  end component;


  type memo is array (7 downto 0) of STD_LOGIC_VECTOR(15 downto 0);
  SIGNAL ramm : memo;
  SIGNAL saida: STD_LOGIC_VECTOR(15 downto 0);
	begin

    --nao sei porque nao funciona
    process (clock)
    begin
      if rising_edge(clock) then
        if load = '1' then
          ramm(to_integer(unsigned(address))) <= input;
        end if;
      end if;

    end process;
		output <= ramm(to_integer(unsigned(address)));

    --P0: Register16 port map(clock,input,load,saida);
    --ramm(to_integer(unsigned(address))) <= saida when (load = '0');
    --output <= saida when (load = '1');
		-- funciona mas nao como esperado


end func;

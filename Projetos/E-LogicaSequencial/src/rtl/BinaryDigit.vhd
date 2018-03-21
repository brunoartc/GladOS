-- Elementos de Sistemas
-- by Luciano Soares
-- BinaryDigit.vhd

Library ieee; 
use ieee.std_logic_1164.all;
  
entity BinaryDigit is
	port(
		clock:   in STD_LOGIC; --
		input:   in STD_LOGIC; --
		load:    in STD_LOGIC; --
		output: out STD_LOGIC
	);
end entity;

architecture fds of BinaryDigit is

component Mux2Way is
	port (
			a:   in  STD_LOGIC;
			b:   in  STD_LOGIC;
			sel: in  STD_LOGIC;
			q:   out STD_LOGIC);
end component;

component FlipFlopD is
	port(
		clock:  in std_logic;
		d:      in std_logic;
		clear:  in std_logic;
		preset: in std_logic;
		q:     out std_logic
	);
end component;
 
 signal outmx_inFF: std_logic;
 signal feedback: std_logic;

begin
	P1 : Mux2Way port map(feedback,input,load,outmx_inFF);
	P2 : FlipFlopD port map(clock,outmx_inFF,'0','0', feedback);
	output <= feedback;


end architecture;
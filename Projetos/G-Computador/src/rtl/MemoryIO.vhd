library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MemoryIO is

   PORT(
        -- Sistema
        CLK_SLOW : IN  STD_LOGIC;
        CLK_FAST : IN  STD_LOGIC;
        RST      : IN  STD_LOGIC;

        -- RAM 16K
        ADDRESS		: IN  STD_LOGIC_VECTOR (14 DOWNTO 0);
        INPUT		: IN  STD_LOGIC_VECTOR (15 DOWNTO 0);
        LOAD		: IN  STD_LOGIC ;
        OUTPUT		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0);

        -- LCD EXTERNAL I/OS
        LCD_CS_N     : OUT   STD_LOGIC;
        LCD_D        : INOUT STD_LOGIC_VECTOR(15 downto 0);
        LCD_RD_N     : OUT   STD_LOGIC;
        LCD_RESET_N  : OUT   STD_LOGIC;
        LCD_RS       : OUT   STD_LOGIC;	-- (DCx) 0 : reg, 1: command
        LCD_WR_N     : OUT   STD_LOGIC;
        LCD_ON       : OUT   STD_LOGIC := '1';	-- liga e desliga o LCD
        LCD_INIT_OK  : OUT   STD_LOGIC;

        -- Switchs
        SW  : in std_logic_vector(9 downto 0);
        LED : OUT std_logic_vector(9 downto 0)

		);
end entity;


ARCHITECTURE logic OF MemoryIO IS

  component RAM16K IS
      PORT
      (
          address	: IN STD_LOGIC_VECTOR (13 DOWNTO 0);
          clock		: IN STD_LOGIC  := '1';
          data		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
          wren		: IN STD_LOGIC ;
          q		   : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
      );
  end component;

  component Mux4Way16 is
  	port (
  			a:   in  STD_LOGIC_VECTOR(15 downto 0);
  			b:   in  STD_LOGIC_VECTOR(15 downto 0);
  			c:   in  STD_LOGIC_VECTOR(15 downto 0);
  			d:   in  STD_LOGIC_VECTOR(15 downto 0);
  			sel: in  STD_LOGIC_VECTOR(1 downto 0);
  			q:   out STD_LOGIC_VECTOR(15 downto 0));
  end component;

  component DMux4Way is
  	port (
  			a:   in  STD_LOGIC;
  			sel: in  STD_LOGIC_VECTOR(1 downto 0);
  			q0:  out STD_LOGIC;
  			q1:  out STD_LOGIC;
  			q2:  out STD_LOGIC;
  			q3:  out STD_LOGIC);
  end component;

  component Register16 is
  	port(
  		clock:   in STD_LOGIC;
  		input:   in STD_LOGIC_VECTOR(15 downto 0);
  		load:    in STD_LOGIC;
  		output: out STD_LOGIC_VECTOR(15 downto 0)
  	);
  end component;


  component Screen is
      PORT(
          INPUT        : IN STD_LOGIC_VECTOR(15 downto 0);
          LOAD         : IN  STD_LOGIC;
          ADDRESS      : IN STD_LOGIC_VECTOR(13 downto 0);

            -- Sistema
          CLK_FAST : IN  STD_LOGIC;
          CLK_SLOW : IN  STD_LOGIC;
          RST 	   : IN  STD_LOGIC;

            -- LCD EXTERNAL I/OS
          LCD_INIT_OK  : OUT STD_LOGIC;
          LCD_CS_N     : OUT   STD_LOGIC;
          LCD_D        : INOUT STD_LOGIC_VECTOR(15 downto 0);
          LCD_RD_N     : OUT   STD_LOGIC;
          LCD_RESET_N  : OUT   STD_LOGIC;
          LCD_RS       : OUT   STD_LOGIC;	-- (DCx) 0 : reg, 1: command
          LCD_WR_N     : OUT   STD_LOGIC
          );
    end component;

signal outram, leds, outgoing, lcdd, sw_in_reg : STD_LOGIC_VECTOR(15 downto 0);
signal bolinha_load,bolinha_sw : STD_LOGIC_VECTOR(1 downto 0);

signal load1, load2, load3, load0, lcdinit, lcdcs, lcdrd, lcdres, lcdrs, lcdwr : STD_LOGIC;

BEGIN

bolinha_load <= "00" when (ADDRESS(14) = '0') else
          "01" when (ADDRESS = "101001011000000") else
          "10";
bolinha_sw <= "01" when (ADDRESS = "101001011000001") else
            "00";

U0 : DMux4Way port map (LOAD, bolinha_load, load1, load2, load3, load0);
RAM : RAM16K port map (ADDRESS(13 downto 0), CLK_FAST, INPUT(15 DOWNTO 0), load1, outram);
U2 : Register16 port map (CLK_SLOW, INPUT(15 downto 0), load2, leds);
U4 : Screen port map (INPUT(15 DOWNTO 0), load3, ADDRESS(13 DOWNTO 0), CLK_FAST, CLK_SLOW, RST, lcdinit, lcdcs, lcdd, lcdrd, lcdres, lcdrs, lcdwr);
U5 : Mux4Way16 port map (outram, sw_in_reg, "0000000000000000", "0000000000000000", bolinha_sw, outgoing);

sw_in_reg <="000000" & sw;
LED <= leds(9 downto 0);
OUTPUT <= outgoing(15 downto 0);
LCD_CS_N <= lcdcs;
LCD_D <= lcdd;
LCD_RD_N <= lcdrd;
LCD_RESET_N <= lcdres;
LCD_RS <= lcdrs;
LCD_WR_N <= lcdwr;
LCD_ON <= '1';
LCD_INIT_OK <= lcdinit;

END logic;

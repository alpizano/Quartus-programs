library ieee;
use ieee.std_logic_1164.all;

entity mux_4to1 is

port ( s1 : in std_logic;
       s0 : in std_logic;
		 D0 : in std_logic;
		 D1 : in std_logic;
		 D2 : in std_logic;
		 D3 : in std_logic;
		 y  : out std_logic
     );

end entity mux_4to1;

architecture structure of mux_4to1 is

signal x1 : std_logic; --intermediate output from mux1
signal x2 : std_logic; --intermediate output from mux2


begin


mux1: entity work.mux_2to1(dataflow)
port map(s => s0, D0 => D0, D1 => D1, y => x1); --compoent instantiation w/ positional association

mux2: entity work.mux_2to1(dataflow)
port map(s => s0, D0 => D2, D1 =>  D3, y => x2); --compoent instantiation w/ positional association

mux3: entity work.mux_2to1(dataflow)
port map(s => s1, D0 => x1, D1 => x2, y => y); --compoent instantiation w/ positional association


end architecture structure;
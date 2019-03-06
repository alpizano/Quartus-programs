library ieee;
use ieee.std_logic_1164.all;

entity adv_game is

	port
	(
		clk		 : in	std_logic;
		--input	 : in	std_logic;
		n, s, e, w : in std_logic;
		reset	 : in	std_logic;
		--output	 : out	std_logic_vector(1 downto 0)
		sw, d, win : out std_logic
	);

end entity;

architecture rtl of adv_game is

	-- Build an enumerated type for the state machine
	type state_type is (CC, TT, RR, SS, DD, VV, GG); -- 7 total states

	-- Register to hold the current state
	signal state : state_type;
	signal v : std_logic; --signal for vorpal sword, '1' = has sword, '0' = no sword
	
begin

	process (clk, reset)
	begin

		if reset = '1' then
			state <= CC;

		elsif (rising_edge(clk)) then

			-- Determine the next state synchronously, based on
			-- the current state and the input
			case state is
				when CC=>
					if e = '1' then
						state <= TT;
					else
						state <= CC;
					end if;
					
				when TT=>
					if s = '1' then
						state <= RR;
					elsif w = '1' then
					   state <= CC;
					else
						state <= TT;
					end if;
					
				when RR=>
					if w = '1' then
						state <= SS;
					elsif e = '1' then
					   state <= DD;
					elsif n = '1' then
					   state <= TT;
					else
						state <= RR;
					end if;
					
				when SS=>
					if e = '1' then
						state <= RR;
					else
						state <= SS;
					end if;
					
				when DD=>
					if v = '1' then
						state <= VV; -- go to victory vault if have sword (v = '1')
						
					elsif v = '0' then
						state <= GG; -- go to grievous gravard if no vorpal sword (v = '0')
					else
					   state <= DD;
					end if;
					
				when VV=>
				   state <= CC; -- when you win the game, go back to CC and start over
					
			   when GG=>
				   state <= CC; -- -- when you win the game, go back to CC and start over
					
			end case;

		end if;
	end process;

	-- Determine the output based only on the current state
	-- and the input (do not wait for a clock edge).
	process (state, sw)
	begin
			case state is
			-- MOORE outputs
				when CC => sw <= '0';
				when TT => sw <= '0';
				
			
				when SS => sw <= '1'; --when you find vorpal sword in SS
				
				when RR => sw <= '0';
				
				
				-- MEELY output
				when DD =>
					if sw = '1' then
						v <= '1';
					else
						v <= '0';
					end if;
					
				when VV => win <= '1';
				when GG=> d <= '1';
			
		   
				--when s3=>
					--if input = '1' then
						--output <= "11";
					--else
						--output <= "10";
					--end if;
					
			end case;
	end process;

end rtl;

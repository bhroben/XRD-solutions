----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 15.10.2023 14:26:57
-- Design Name:
-- Module Name: FSM - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FSM is
    port(
      Clk : in std_logic;
      RST : in std_logic;
      warning : out std_logic := '0';
      SW : in std_logic_vector(3 downto 0); -- switch input
      O : out std_logic_vector(3 downto 0) -- output
    );
end FSM;

architecture Behavioral of FSM is

type state_t is (S0, S1, S2, S3, S4);
signal State : state_t;
--signal warning : ;

constant Value0 : std_logic_vector(3 downto 0) := "0000";
constant Value1 : std_logic_vector(3 downto 0) := "1111";

begin


process(Clk) is
begin
   if rising_edge(Clk) then
       if RST = '1' then
           State <= S0;
       end if;
   end if;
end process;



process(SW) is

begin
         case State is
            when S0 =>      if SW = x"1" then
                                State <= S1;

                            else
                              warning <= '1';

                            end if;

            when S1 =>      if SW = x"3" then
                                State <= S2;
                            else
                              warning <= '1';
		                    end if;

            when S2 =>      if SW = x"7" then
                                State <= S3;
                            else
                              warning <= '1';
		                    end if;

            when S3 =>      if SW = x"15" then
                                State <= S4;
                                O <= Value1;
                            else
                              warning <= '1';
		                    end if;

            when others =>  O <= Value0;
                            warning <= '1';
                            State <= S0;

         end case;

end process;


end Behavioral;

----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 03.10.2023 15:52:15
-- Design Name:
-- Module Name: counter - Behavioral
-- Project Name: Xcounter 4bit Reset DD Flip-flops
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter is
    port(
      Clk : in std_logic;
      O : out std_logic_vector(3 downto 0);
      RST : in std_logic;
      SW  : in std_logic;
      SW3 : in std_logic
    );

end counter;

architecture Behavioral of counter is

signal count : unsigned(3 downto 0) :=(others => '0');
signal q_temp: unsigned(3 downto 0) := "0000"; -- per inizializzare count a 0000

begin


process(Clk,SW,SW3,RST)
begin

    if(rising_edge(Clk)) then
        if SW = '1' then
             count <= count + 1;
        elsif SW = '0' then
             count <= count - 1;
        elsif SW3 = '1' then
             count <= count + 3;
        elsif SW3 = '0' then
             count <= count + 1;

        elsif RST = '1' then
             count <= q_temp; --(others => '0');
        end if;
    end if;

end process;


O <= std_logic_vector(count);

end Behavioral;

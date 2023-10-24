----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 10/23/2023 09:51:25 PM
-- Design Name:
-- Module Name: tb_counter - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_counter is
--  Port ( );
end tb_counter;

architecture Behavioral of tb_counter is

component counter is
    port(
      Clk : in std_logic;
      O : out std_logic_vector(3 downto 0);
      RST : in std_logic;
      SW  : in std_logic;
      SW3 : in std_logic
    );
end component;

signal O  : std_logic_vector(3 downto 0) := (others=>'0');
signal RST : std_logic :='0';
signal SW :std_logic :='0';
signal SW3 : std_logic :='0';
signal Clk : std_logic := '0';
constant clk_period : time := 10 ns;


begin

DUT: counter
    port map (
        O       => O,
        RST       => RST,
        SW     => SW,
        SW3     => SW3,
        Clk    => Clk
     );


Clk <= not Clk after clk_period/2;

stim_p: process
begin
    wait for 40 ns;
    SW <= '1';
    wait for 40 ns;
    SW <= '0';
    wait for 40 ns;
    RST<='1';
    wait for 30 ns;
    SW3<='1';
    wait;
end process;


end Behavioral;

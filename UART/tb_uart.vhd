----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.10.2023 12:45:27
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_uart is
--  Port ( );
end tb_uart;

architecture Behavioral of tb_uart is

component uart_tx is

    generic(
      period : integer := 5
    );  
     
    port(
      clk       : in std_logic;
      data_line : in std_logic_vector(7 downto 0);
      --output O is a single bit
      O         : out std_logic;
      valid     : in std_logic --button to start sending data
    );
end component;



--signal clk_couter : integer :=0; 
--signal BAUDRATE_out : std_logic := '0';
---- State machine deinition
--type state_t is (idle, data_valid, start, bit0, bit1, bit2, bit3, bit4, bit5, bit6, bit7, stop);
--signal state : state_t := idle; 
signal busy: std_logic := '0';
signal clk : std_logic := '0';
signal data_line :  std_logic_vector(7 downto 0) :=(others=>'0');
signal O :  std_logic := '0';
signal valid : std_logic := '0';
--signal fake : std_logic := '0';

constant clk_period : time := 10 ns;

begin

DUT: uart_tx 
    port map(
        clk => clk,
        data_line => data_line, 
         O => O,
         valid => valid 
    );    

clk <= not clk after clk_period/2;

stim_p: process
begin
    data_line <= "11110010";
    wait for 20 ns;
    valid <= '1';
    wait;
    -- che fare con busy????
    
end process;
    
end Behavioral;
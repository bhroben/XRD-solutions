----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.10.2023 15:52:15
-- Design Name: 
-- Module Name: counter - Behavioral
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

entity counter is
    generic(
      period : integer := 2**26 - 1
    );  
    port(
      clk       : in std_logic;
      data_line : in std_logic_vector(7 downto 0);
      --output O is a single bit
      O         : out std_logic   ;
      valid     : in std_logic --button to start sending data
    );
end counter;

architecture Behavioral of counter is

signal clk_couter : integer :=0; 
signal count : unsigned(3 downto 0) :=(others => '0');
signal BAUDRATE_out : std_logic; --ritornaci. questo è il segnale per andare allo stato successivo; inizializza a 0 e quando period è raggiunto diventa 1 
-- State machine deinition
type state_t is (idle, data_valid, start, bit0, bit1, bit2, bit3, bit4, bit5, bit6, bit7, stop);
signal state : state_t; --inizializzare ad idle



begin

process(Clk)
begin 
    if(rising_edge(clk)) then
        clk_couter <= clk_couter + 1;
        
        if clk_couter = period then
            BAUDRATE_out <= '1';
            clk_couter <= 0; 
        end if; 
    
   end if;   
    
end process;  



process(Clk)
begin

if BAUDRATE_out = '1' then

    --reset BAUDRATE 
    BAUDRATE_out <= '0';
    --update state machine
    case state is
                    when idle => if valid = '1' then
                                    state <= data_valid; 
                                    end if;
                    
                    when data_valid => state <= start;
                                        
                    when start  => state <= bit0;
                    
                    when bit0   => state <= bit1;
                                   O <= data_line(0);
                                   
                    when bit1   => state <= bit2;
                                   O <= data_line(1);
                                   
                    when bit2   => state <= bit3;
                                     O <= data_line(2);
                                     
                    when bit3   => state <= bit4;
                                     O <= data_line(3);
                                     
                    when bit4   => state <= bit5;
                                     O <= data_line(4);
                                     
                    when bit5   => state <= bit6;
                                     O <= data_line(5);
                    
                    when bit6   => state <= bit7;
                                     O <= data_line(6);
                                     
                    when bit7   => state<= stop;
                    
                    when stop   => state<= idle;
                    
    end case;
        
end if;

end process;

end Behavioral;
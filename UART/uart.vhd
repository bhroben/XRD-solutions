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

entity uart_tx is
    generic(
      period : integer := 10**9
    );  
    port(
      clk       : in std_logic;
      data_line : in std_logic_vector(7 downto 0);
      --output O is a single bit
      O         : out std_logic  ;
      valid     : in std_logic --button to start sending data
    );
end uart_tx;

architecture Behavioral of uart_tx is

signal clk_couter : integer :=0; 
signal BAUDRATE_out : std_logic := '0'; --ritornaci. questo � il segnale per andare allo stato successivo; inizializza a 0 e quando period � raggiunto diventa 1 
-- State machine deinition
type state_t is (idle, data_valid, start, bit0, bit1, bit2, bit3, bit4, bit5, bit6, bit7, stop);
signal state : state_t; --inizializzare ad idle
signal busy: std_logic;
signal fake : std_logic := '0';



begin

process(clk)
begin 
    fake <= '1';
    if(rising_edge(clk)) then
        clk_couter <= clk_couter + 1;
        BAUDRATE_out <= '0';
        
        if clk_couter = period then
            BAUDRATE_out <= '1';
            clk_couter <= 0; 
        end if; 
    
   end if;   
    
end process;  


process(clk)
begin

if(rising_edge(clk)) then

    --update state machine
    case state is
                    when idle => if valid = '1' then
                                    state <= data_valid; 
                                    end if;
                    
                    when data_valid => if BAUDRATE_out = '1' then
                                        state <= start; --non � ridondante? Perch� non passare direttamente da idle a start?
                                        busy <= '1';
                                        end if;
                                        
                    when start  => if BAUDRATE_out = '1' then
                                    state <= bit0;
                                    end if;
                    
                    when bit0   => if BAUDRATE_out = '1' then
                                        state <= bit1;
                                        O <= data_line(0);
                                        end if;
                                   
                    when bit1   => if BAUDRATE_out = '1' then
                                        state <= bit2;
                                        O <= data_line(1);
                                        end if;
                                   
                    when bit2   => if BAUDRATE_out = '1' then
                                        state <= bit3;
                                        O <= data_line(2);
                                        end if;
                                     
                    when bit3   => if BAUDRATE_out = '1' then
                                        state <= bit4;
                                         O <= data_line(3);
                                         end if;
                                     
                    when bit4   => if BAUDRATE_out = '1' then
                                        state <= bit5;
                                         O <= data_line(4);
                                         end if;
                                     
                    when bit5   => if BAUDRATE_out = '1' then
                                        state <= bit6;
                                        O <= data_line(5);
                                        end if;
                    
                    when bit6   => if BAUDRATE_out = '1' then
                                    state <= bit7;
                                     O <= data_line(6);
                                     end if;
                                     
                    when bit7   => if BAUDRATE_out = '1' then
                                        state<= stop;
                                        end if;
                    
                    when stop   => if BAUDRATE_out = '1' then
                                    state<= idle;
                                    busy <= '0';
                                    end if;
                    
    end case;
    
    --reset BAUDRATE 
   -- BAUDRATE_out <= '0';
        
end if;

end process;

end Behavioral;
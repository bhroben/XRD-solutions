----------------------------------------------------------------------------------
-- Company: XRD solutions
-- Engineer: not even one
--
-- Create Date: 22.09.2023 15:10:54
-- Design Name:
-- Module Name: nbit_demux - diego v0.1
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

entity nbit_demux is
    generic (n: NATURAL :=3);
    port (D: in std_logic_vector(n-1 downto 0); -- S0 and S1 are in S
          S0: in std_logic;
          S1: in std_logic;
          Y0 : out std_logic_vector(n-1 downto 0);
          Y1 : out std_logic_vector(n-1 downto 0);
          Y2 : out std_logic_vector(n-1 downto 0);
          Y3 : out std_logic_vector(n-1 downto 0));
end nbit_demux;

architecture diego of nbit_demux is

    
begin
    
    Y0 <= not (S0&S1) and D;
    Y1 <= not (S0)&S1 and D;
    Y2 <=  S0& not(S1) and D;
    Y3 <= S0&S1 and D;


end diego;

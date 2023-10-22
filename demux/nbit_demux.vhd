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
-- Additional Comments: Final version 22.10.2023 17:02:22
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
          S: std_logic_vector(1 downto 0);
          Y0 : out std_logic_vector(n-1 downto 0);
          Y1 : out std_logic_vector(n-1 downto 0);
          Y2 : out std_logic_vector(n-1 downto 0);
          Y3 : out std_logic_vector(n-1 downto 0));
end nbit_demux;

architecture diego of nbit_demux is


begin

    Y0 <= D when S="00" else ( others => '0');
    Y1 <= D when S="01" else ( others => '0');
    Y2 <=  D when S="10" else ( others => '0');
    Y3 <= D when S="11" else ( others => '0');

end diego;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.05.2019 13:37:08
-- Design Name: 
-- Module Name: CountersTest - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CountersTest is
    Port (
        --clk : in std_logic;
        display : out std_logic_vector(3 downto 0);
        cot_out : out std_logic_vector(6 downto 0)
    );
end CountersTest;

architecture Behavioral of CountersTest is

signal num : integer;
signal clk : std_logic := '0';

begin
display <= "1110";
clk <= not clk after 500 ms;
process (clk) is
    begin
        if (clk = '1') then
            if (num = 9) then
                num <= 0;
            else 
                num <= num + 1;
            end if;
            case num is
                when 0 =>  cot_out <= "0000001"; -- 0
                when 1 =>  cot_out <= "1001111"; -- 1
                when 2 =>  cot_out <= "0010010"; -- 2
                when 3 =>  cot_out <= "0000110"; -- 3
                when 4 =>  cot_out <= "1001100"; -- 4
                when 5 =>  cot_out <= "0100100"; -- 5
                when 6 =>  cot_out <= "1100000"; -- 6
                when 7 =>  cot_out <= "0001111"; -- 7
                when 8 =>  cot_out <= "0000000"; -- 8
                when 9 =>  cot_out <= "0000100"; -- 9
                when others => cot_out <= "0000001";
            end case;
        end if;
    end process;

end Behavioral;

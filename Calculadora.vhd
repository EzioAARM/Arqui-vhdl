----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.04.2019 12:59:01
-- Design Name: 
-- Module Name: Calculadora - Behavioral
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

entity Calculadora is
Port (
    clk    : IN  STD_LOGIC;
    areset : IN  STD_LOGIC;
    aload  : IN  STD_LOGIC;
    data   : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    cnt_out: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
);
end Calculadora;

architecture Behavioral of Calculadora is
signal cnt_tmp: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
begin
    proceso_contador: process (aload, areset, clk, data) begin
        if areset = '1' then
            cnt_tmp <= "0000";
        elsif aload = '1' then
            cnt_tmp <= data;
        elsif rising_edge(clk) then
            cnt_tmp <= cnt_tmp + 1;
        end if;
    end process;
 
    cnt_out <= cnt_tmp;

end Behavioral;

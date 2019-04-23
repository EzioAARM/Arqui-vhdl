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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Calculadora is
Port (
    dato1_input: in std_logic_vector(2 downto 0);
    posicion: in std_logic_vector(2 downto 0);
    teclaso_mostrar: in std_logic;
    teclaso_guardar: in std_logic;
    
    show_display: out std_logic_vector(7 downto 0);
    
    display1: out std_logic;
    display2: out std_logic;
    display3: out std_logic;
    display4: out std_logic
);
end Calculadora;

architecture Behavioral of Calculadora is
begin
display1 <= '0';
display2 <= '1';
display3 <= '1';
display4 <= '1';

process (teclaso_guardar, teclaso_mostrar)
    begin
        case (dato1_input) is
            when "000" => show_display <= "00000001";
            when "001" => show_display <= "00000011";
            when "010" => show_display <= "00000111";
            when "011" => show_display <= "00001111";
            when "100" => show_display <= "00011111";
            when "101" => show_display <= "00111111";
            when "110" => show_display <= "01111111";
            when "111" => show_display <= "11111111";
        end case;
end process;

end Behavioral;

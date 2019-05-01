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
    numero: in std_logic_vector(4 downto 0);
    posicion: in std_logic_vector(2 downto 0);
    guardar: in std_logic;
    mostrar: in std_logic;
    leds: out std_logic_vector(6 downto 0);
    displays: out std_logic_vector(3 downto 0)
);
end Calculadora;

architecture Behavioral of Calculadora is
signal n1 : std_logic_vector(4 downto 0);
signal n2 : std_logic_vector(4 downto 0);
signal n3 : std_logic_vector(4 downto 0);
signal n4 : std_logic_vector(4 downto 0);
signal n5 : std_logic_vector(4 downto 0);
signal numeroMostrar : std_logic_vector(4 downto 0);
begin

    displays <= "1100";
    
    process (guardar, mostrar) is
        begin
            if (guardar = '1') then
                case posicion is
                    when "000" => n1 <= numero;
                    when "001" => n2 <= numero;
                    when "010" => n3 <= numero;
                    when "011" => n4 <= numero;
                    when "100" => n5 <= numero;
                    when others => null;
                end case;
            elsif (mostrar = '1') then
                case posicion is
                    when "000" => numeroMostrar <= n1;
                    when "001" => numeroMostrar <= n1;
                    when "010" => numeroMostrar <= n1;
                    when "011" => numeroMostrar <= n1;
                    when "100" => numeroMostrar <= n1;
                    when others => null;
                end case;
                case numeroMostrar is
                    when "00000" => leds <= "0000001";
                    when "00001" => leds <= "1001111";
                    when "00010" => leds <= "0010010";
                    when "00011" => leds <= "0000110";
                    when "00100" => leds <= "1001100";
                    when "00101" => leds <= "0100100";
                    when "00110" => leds <= "0100000";
                    when "00111" => leds <= "0001111";
                    when "01000" => leds <= "0000000";
                    when "01001" => leds <= "0000100";
                    when others => leds <= "1111111";
                end case;
            end if;
        end process;

end Behavioral;

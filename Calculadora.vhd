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
use IEEE.MATH_REAL.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.ALL; 
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
    set_pos: in std_logic;
    suma: in std_logic;
    resta: in std_logic;
    
    leds: out std_logic_vector(6 downto 0);
    displays: out std_logic_vector(3 downto 0)
);
end Calculadora;

architecture Behavioral of Calculadora is
    signal n1 : std_logic_vector(4 downto 0) := "00000";
    signal n2 : std_logic_vector(4 downto 0) := "00000";
    signal n3 : std_logic_vector(4 downto 0) := "00000";
    signal n4 : std_logic_vector(4 downto 0) := "00000";
    signal n5 : std_logic_vector(4 downto 0) := "00000";
    signal numeroMostrar : std_logic_vector(4 downto 0);
    
    signal op1 : std_logic_vector(2 downto 0) := "000";
    signal op2 : std_logic_vector(2 downto 0) := "000";
    signal res : std_logic_vector(2 downto 0) := "000";
    signal calc1 : std_logic_vector(4 downto 0) := "00000";
    signal calc2 : std_logic_vector(4 downto 0) := "00000";
    signal total : std_logic_vector(4 downto 0) := "00000";
    signal presiono : integer := 0;
begin

displays <= "1110";

    process (guardar, mostrar, set_pos, suma, resta) is
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
                    when "001" => numeroMostrar <= n2;
                    when "010" => numeroMostrar <= n3;
                    when "011" => numeroMostrar <= n4;
                    when "100" => numeroMostrar <= n5;
                    when others => null;
                end case;
                case conv_integer(numeroMostrar) is
                    when 0 => leds <= "0000001";
                    when 1 => leds <= "1001111";
                    when 2 => leds <= "0010010";
                    when 3 => leds <= "0000110";
                    when 4 => leds <= "1001100";
                    when 5 => leds <= "0100100";
                    when 6 => leds <= "0100000";
                    when 7 => leds <= "0001111";
                    when 8 => leds <= "0000000";
                    when 9 => leds <= "0000100";
                    when others => leds <= "1111111";
                end case;
            elsif (set_pos = '1') then
                if (presiono = 0) then
                    op1 <= posicion;
                    presiono <= presiono + 1;
                elsif (presiono = 1) then
                    op2 <= posicion;
                    presiono <= presiono + 1;
                elsif (presiono = 2) then
                    res <= posicion;
                    presiono <= 0;
                end if;
            elsif (suma = '1') then
                case op1 is
                    when "000" => calc1 <= n1;
                    when "001" => calc1 <= n2;
                    when "010" => calc1 <= n3;
                    when "011" => calc1 <= n4;
                    when "100" => calc1 <= n5;
                    when others => null;
                end case;
                case op2 is
                    when "000" => calc2 <= n1;
                    when "001" => calc2 <= n2;
                    when "010" => calc2 <= n3;
                    when "011" => calc2 <= n4;
                    when "100" => calc2 <= n5;
                    when others => null;
                end case;
                total <= calc1 + calc2;
                case res is
                    when "000" => n1 <= total;
                    when "001" => n2 <= total;
                    when "010" => n3 <= total;
                    when "011" => n4 <= total;
                    when "100" => n5 <= total;
                    when others => null;
                end case;
            elsif (resta = '1') then
                case op1 is
                    when "000" => calc1 <= n1;
                    when "001" => calc1 <= n2;
                    when "010" => calc1 <= n3;
                    when "011" => calc1 <= n4;
                    when "100" => calc1 <= n5;
                    when others => null;
                end case;
                case op2 is
                    when "000" => calc2 <= n1;
                    when "001" => calc2 <= n2;
                    when "010" => calc2 <= n3;
                    when "011" => calc2 <= n4;
                    when "100" => calc2 <= n5;
                    when others => null;
                end case;
                total <= calc1 - calc2;
                case res is
                    when "000" => n1 <= total;
                    when "001" => n2 <= total;
                    when "010" => n3 <= total;
                    when "011" => n4 <= total;
                    when "100" => n5 <= total;
                    when others => null;
                end case;
            end if;
        end process;

end Behavioral;

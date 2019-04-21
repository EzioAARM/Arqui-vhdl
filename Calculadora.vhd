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
    dato1_input: in std_logic_vector(4 downto 0);
    posicion: in std_logic_vector(2 downto 0);
    teclaso_guardar: in std_logic;
    teclaso_mostrar: in std_logic;
    
    show_display: out std_logic_vector(4 downto 0);
    
    display1: out std_logic;
    display2: out std_logic;
    display3: out std_logic;
    display4: out std_logic
);
end Calculadora;

architecture Behavioral of Calculadora is
-- modificacion
shared variable var1: std_logic_vector(4 downto 0);
shared variable var2: std_logic_vector(4 downto 0);
shared variable var3: std_logic_vector(4 downto 0);
shared variable var4: std_logic_vector(4 downto 0);
shared variable var5: std_logic_vector(4 downto 0);

begin

display1 <= '0';
display2 <= '0';
display3 <= '0';
display4 <= '0';

--GUARDAR: process(teclaso_guardar)
--begin
--    display1 <= '1';
    
--end process;

process (teclaso_guardar)
    begin
        display1 <= '0';
        show_display <= "11111";
--        if teclaso_guardar='1' then
--            display1 <= '0';
--            case posicion is
--                when "000" => var1 := dato1_input;
--                when "001" => var2 := dato1_input;
--                when "010" => var3 := dato1_input;
--                when "011" => var4 := dato1_input;
--                when "100" => var5 := dato1_input;
--                when "101" => var5 := dato1_input;
--                when "110" => var5 := dato1_input;
--                when "111" => var5 := dato1_input;
--            end case;        
--        end if;
--        if teclaso_mostrar='1' then
--            display1 <= '1';
--            case posicion is
--                when "000" => show_display <= var1;
--                when "001" => show_display <= var2;
--                when "010" => show_display <= var3;
--                when "011" => show_display <= var4;
--                when "100" => show_display <= var5;
--                when "101" => show_display <= var5;
--                when "110" => show_display <= var5;
--                when "111" => show_display <= var5;
--            end case;
--        end if;
    end process;
    
process (teclaso_mostrar)
    begin
        display1 <= '1';
        
        show_display <= "11111";
--        case posicion is
--            when "000" => show_display <= var1;
--            when "001" => show_display <= var2;
--            when "010" => show_display <= var3;
--            when "011" => show_display <= var4;
--            when "100" => show_display <= var5;
--            when "101" => show_display <= var5;
--            when "110" => show_display <= var5;
--            when "111" => show_display <= var5;
--        end case;
    end process;

end Behavioral;

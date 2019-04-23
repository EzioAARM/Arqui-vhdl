----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.04.2019 12:17:55
-- Design Name: 
-- Module Name: Contador hexbin - Behavioral
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

entity Contador_hexbin is
Port (
    manager : in STD_LOGIC; -- boton para contar o detenerse
    esHex: in STD_LOGIC; -- switch para cambiar a binario o hexadecimal
    reset: in STD_LOGIC; -- boton para detener y reiniciar el contador.
    
    display : out STD_LOGIC_VECTOR (3 downto 0); -- indica en que display se mostrarà el nùmero
    led : out STD_LOGIC_VECTOR (6 downto 0); -- indica que leds del display se encienden
    indicador : out STD_LOGIC_VECTOR(1 downto 0); -- indicador de que opciòn del botòn manager està activa
    esHexIndicator : out STD_LOGIC
    -- contar 01, detenerse 10 y reset 00
);
end Contador_hexbin;

architecture Behavioral of Contador_hexbin is

    signal timer : std_logic := '0'; -- señal de reloj
    signal numeroD1 : std_logic_vector(3 downto 0) := "0000";
    signal numeroD2 : std_logic_vector(3 downto 0) := "0000";
    signal numeroD3 : std_logic_vector(3 downto 0) := "0000";
    signal numeroD4 : std_logic_vector(3 downto 0) := "0000";
    signal activo : std_logic;
    signal contando : std_logic := '0';
    signal accionActual : std_logic := '0';
    signal displayActual : std_logic_vector(1 downto 0) := (others => '0');
    signal numeroDisplay : STD_LOGIC_VECTOR (3 downto 0);

begin
timer <= not timer after 10 ms; -- la señal cambia cada 100 ms

process(displayActual)
    begin
        case displayActual is
            when "00" =>
                Display <= "0111";
            when "01" =>
                Display <= "1011";
            when "10" =>
                Display <= "1101";
            when "11" =>
                Display <= "1110";
        end case;
        case numeroDisplay is
            when "0000" => led <= "0000001"; -- 0     
            when "0001" => led <= "1001111"; -- 1 
            when "0010" => led <= "0010010"; -- 2 
            when "0011" => led <= "0000110"; -- 3 
            when "0100" => led <= "1001100"; -- 4 
            when "0101" => led <= "0100100"; -- 5 
            when "0110" => led <= "0100000"; -- 6 
            when "0111" => led <= "0001111"; -- 7 
            when "1000" => led <= "0000000"; -- 8     
            when "1001" => led <= "0000100"; -- 9 
            when "1010" => led <= "0001000"; -- A
            when "1011" => led <= "1100000"; -- B
            when "1100" => led <= "0110001"; -- C
            when "1101" => led <= "1000010"; -- D
            when "1110" => led <= "0110000"; -- E
            when "1111" => led <= "0111000"; -- F
        end case;
    end process;

process (timer)
    begin
        if (rising_edge(timer)) then
            if (esHex = '1') then
                if (numeroD1 = "1111") then
                    numeroD1 <= "0000";
                    numeroD2 <= numeroD2 + "0001";
                    if (numeroD2 = "1111") then
                        numeroD2 <= "0000";
                        numeroD3 <= numeroD2 + "0001";
                        if (numeroD3 = "1111") then
                            numeroD3 <= "0000";
                            numeroD4 <= numeroD4 + "0001";
                            if (numeroD4 = "1111" and numeroD3 = "1111" and numeroD2 = "1111" and numeroD1 = "1111") then
                                --Cuando se termine la cuenta se detiene
                                contando <= '0';
                                numeroD1 <= "0000";
                                numeroD2 <= "0000";
                                numeroD3 <= "0000";
                                numeroD4 <= "0000";
                                accionActual <= '0';
                                indicador <= "10";
                            end if;
                        end if;
                    end if;
                end if;
            else
                if (numeroD1 = "1001") then
                    numeroD1 <= "0000";
                end if;
            end if;
        end if;
    end process;

process (manager)
    begin
        if (accionActual = '0') then
            -- Cuenta
            accionActual <= '1';
            indicador <= "01";
        else
            -- Deja de contar
            accionActual <= '0';
            indicador <= "10";
        end if;
    end process;

process (reset)
    begin
        if (contando = '1') then
            contando <= '0';
        end if;
        numeroD1 <= "0000";
        numeroD2 <= "0000";
        numeroD3 <= "0000";
        numeroD4 <= "0000";
        indicador <= "00";
    end process;
    
process (esHex)
    begin
        if (esHex = '1') then
            esHexIndicator <= '1';
        else
            esHexIndicator <= '0';
        end if;
    end process;

end Behavioral;

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
use IEEE.NUMERIC_STD.ALL;
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

    constant clockFreq : integer := 100e6;
    constant clockPer : time := 100 ms / clockFreq;
    signal timer : std_logic := '0'; -- señal de reloj
    signal numeroD1 : integer := 0;
    signal numeroD2 : integer := 0;
    signal numeroD3 : integer := 0;
    signal numeroD4 : integer := 0;
    signal activo : std_logic;
    signal contando : std_logic := '1';
    signal accionActual : std_logic := '0';
    signal displayActual : std_logic_vector(1 downto 0);
    signal numeroDisplay : std_logic_vector (3 downto 0);

begin

timer <= not timer after clockPer/2; -- la señal cambia cada 100 ms

process (timer) is
    begin
        if (rising_edge(timer)) then
            if (esHex = '1') then
                if (numeroD1 = 15) then
                    numeroD1 <= 0;
                    displayActual <= "11";
                    numeroD2 <= numeroD2 + 1;
                    displayActual <= "10";
                    if (numeroD2 = 15) then
                        numeroD2 <= 0;
                        displayActual <= "10";
                        numeroD3 <= numeroD3 + 1;
                        displayActual <= "01";
                        if (numeroD3 = 15) then
                            numeroD3 <= 0;
                            displayActual <= "01";
                            numeroD4 <= numeroD4 + 1;
                            displayActual <= "00";
                            if (numeroD4 = 15 and numeroD3 = 15 and numeroD2 = 15 and numeroD1 = 15) then
                                --Cuando se termine la cuenta se detiene
                                contando <= '0';
                                numeroD1 <= 0;
                                numeroD2 <= 0;
                                numeroD3 <= 0;
                                numeroD4 <= 0;
                                accionActual <= '0';
                                indicador <= "10";
                            end if;
                        end if;
                    end if;
                else
                    numeroD1 <= numeroD1 + 1;
                    displayActual <= "11";
                end if;
            else
                if (numeroD1 = 9) then
                    numeroD1 <= 0;
                    displayActual <= "11";
                    numeroD2 <= numeroD2 + 1;
                    displayActual <= "10";
                    if (numeroD2 = 9) then
                        numeroD2 <= 0;
                        displayActual <= "10";
                        numeroD3 <= numeroD3 + 1;
                        displayActual <= "01";
                        if (numeroD3 = 9) then
                            numeroD3 <= 0;
                            displayActual <= "01";
                            numeroD4 <= numeroD4 + 1;
                            displayActual <= "00";
                            if (numeroD4 = 9 and numeroD3 = 9 and numeroD2 = 9 and numeroD1 = 9) then
                                --Cuando se termine la cuenta se detiene
                                contando <= '0';
                                numeroD1 <= 0;
                                numeroD2 <= 0;
                                numeroD3 <= 0;
                                numeroD4 <= 0;
                                accionActual <= '0';
                                indicador <= "10";
                            end if;
                        end if;
                    end if;
                else
                    numeroD1 <= numeroD1 + 1;
                    displayActual <= "11";
                end if;
            end if;
        end if;
    end process;

end Behavioral;
